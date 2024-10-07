import 'package:poc_chat_2/broadcaster/broadcaster.dart';
import 'package:poc_chat_2/error.dart';
import 'package:poc_chat_2/model_services/chat_room/message/forms/chat_room_message_form_creator.dart';
import 'package:poc_chat_2/models/events/message_event.dart';
import 'package:poc_chat_2/models/events/read_event.dart';
import 'package:poc_chat_2/models/events/recorded_event.dart';
import 'package:poc_chat_2/models/events/room_event.dart';
import 'package:poc_chat_2/repositories/local_chat_repository.dart';

class ChatRoomRecordedEventAction {
  ChatRoomRecordedEventAction({
    required this.chatRoomId,
    required this.recordedEvent,
    required this.localChatRepository,
  });

  final String chatRoomId;
  final RecordedEvent recordedEvent;
  final LocalChatRepository localChatRepository;

  Future<void> processEvent() async {
    final event = recordedEvent.event;

    if (event is MessageEvent) {
      processMessageEvent();
    } else if (event is RoomEvent) {
      processRoomManagementEvent();
    } else if (event is ReadMessageEvent) {
      processReadMessageEvent();
    } else {
      throw UnprocessableEventError('Event is not support');
    }
  }

  ChatRoomMessageFormCreator _getChatRoomMessageFormCreator({
    required String chatRoomId,
  }) {
    return ChatRoomMessageFormCreator(
      chatRoomId: chatRoomId,
      localChatRepository: localChatRepository,
    );
  }
}

extension RecordedMessageEventAction on ChatRoomRecordedEventAction {
  Future<void> processMessageEvent() async {
    if (recordedEvent.event is! MessageEvent) {
      throw UnprocessableEventError('Event is not a message event');
    }

    _updateChatRoomPersistentMessage(
      chatRoomId: chatRoomId,
      recordedEvent: recordedEvent,
    );
    _updateChatRoomTemporaryMessage(
      chatRoomId: chatRoomId,
      recordedEvent: recordedEvent,
    );
  }

  Future<void> _updateChatRoomPersistentMessage({
    required String chatRoomId,
    required RecordedEvent recordedEvent,
  }) async {
    if (!await _canEventUpdateChatRoomPersistentMessage(
      chatRoomId: chatRoomId,
      recordedEvent: recordedEvent,
    )) return;

    final event = recordedEvent.event;

    if (event is CreateMessageEvent) {
      final form = await _getChatRoomMessageFormCreator(chatRoomId: chatRoomId)
          .createMessageFormFromRecordedEvent(recordedEvent: recordedEvent);

      final message = await localChatRepository.createConfirmedMessage(
        targetChatRoomId: chatRoomId,
        form: form,
      );

      Broadcaster.instance.add(
        ChatRoomConfirmedMessageAdded(
          chatRoomId: chatRoomId,
          message: message,
        ),
      );
    } else if (event is UpdateTextMessageEvent) {
      final message = await localChatRepository.updateConfirmedTextMessage(
        targetMessageChatRoomId: chatRoomId,
        targetMessageCreatedByRecordNumber: event.updatedMessageRecordNumber,
        newText: event.text,
        newUpdatedAt: recordedEvent.recordedAt,
        newLastUpdatedByRecordNumber: recordedEvent.recordNumber,
      );

      Broadcaster.instance.add(
        ChatRoomConfirmedMessageEdited(
          chatRoomId: chatRoomId,
          message: message,
        ),
      );
    } else if (event is DeleteMessageEvent) {
      final messageId = await localChatRepository.deleteConfirmedMessage(
        targetMessageCreatedByRecordNumber: event.deletedMessageRecordNumber,
      );

      Broadcaster.instance.add(
        ChatRoomConfirmedMessageRemoved(
          chatRoomId: chatRoomId,
          messageId: messageId,
        ),
      );
    }
  }

  Future<void> _updateChatRoomTemporaryMessage({
    required String chatRoomId,
    required RecordedEvent recordedEvent,
  }) async {
    final event = recordedEvent.event;

    if (await _isEventFirstSuccessorOfLastSyncedMessageEvent(
      chatRoomId: chatRoomId,
      recordedEvent: recordedEvent,
    )) {
      localChatRepository.deleteUnconfirmedMessage(
        targetChatRoomId: chatRoomId,
        targetMessageCreatedByRecordNumber: recordedEvent.recordNumber,
      );
      localChatRepository.deleteSendingMessage(
        targetChatRoomId: chatRoomId,
        targetMessageCreatedByRecordNumber: recordedEvent.recordNumber,
      );
      localChatRepository.deleteFailedMessage(
        targetChatRoomId: chatRoomId,
        targetMessageCreatedByRecordNumber: recordedEvent.recordNumber,
      );
    } else {
      if (event is CreateMessageEvent) {
        final form = await _getChatRoomMessageFormCreator(
                chatRoomId: chatRoomId)
            .createMessageFormFromRecordedEvent(recordedEvent: recordedEvent);

        localChatRepository.createUnconfirmedMessage(
          targetChatRoomId: chatRoomId,
          form: form,
        );
      }

      localChatRepository.deleteSendingMessage(
        targetChatRoomId: chatRoomId,
        targetMessageCreatedByRecordNumber: recordedEvent.recordNumber,
      );
      localChatRepository.deleteFailedMessage(
        targetChatRoomId: chatRoomId,
        targetMessageCreatedByRecordNumber: recordedEvent.recordNumber,
      );
    }
  }

  Future<bool> _canEventUpdateChatRoomPersistentMessage({
    required String chatRoomId,
    required RecordedEvent recordedEvent,
  }) async {
    return (recordedEvent.event is MessageEvent) &&
        await _isEventFirstSuccessorOfLastSyncedMessageEvent(
          chatRoomId: chatRoomId,
          recordedEvent: recordedEvent,
        );
  }

  Future<bool> _isEventFirstSuccessorOfLastSyncedMessageEvent({
    required String chatRoomId,
    required RecordedEvent recordedEvent,
  }) async {
    final recordNumber = recordedEvent.recordNumber;
    final lastSyncedMessageEventFirstSuccessorRecordNumber =
        await _getFirstSuccessorOfLastSyncedMessageEventRecordNumber(
      chatRoomId: chatRoomId,
    );

    return recordNumber == lastSyncedMessageEventFirstSuccessorRecordNumber;
  }

  Future<int> _getFirstSuccessorOfLastSyncedMessageEventRecordNumber({
    required String chatRoomId,
  }) async {
    return localChatRepository.getLastSyncedMessageEventRecordNumber(
      chatRoomId: chatRoomId,
    );
  }
}

extension RecordedRoomManagementEventAction on ChatRoomRecordedEventAction {
  Future<void> processRoomManagementEvent() async {
    if (!await _canEventUpdateChatRoom(
      chatRoomId: chatRoomId,
      recordedEvent: recordedEvent,
    )) return;

    final event = recordedEvent.event;

    if (event is! RoomEvent) {
      throw UnprocessableEventError('Event is not a room management event');
    }

    switch (event) {
      case CreateRoomEvent():
      case InviteMemberEvent():
      // TODO: Handle this case.
      case UpdateMemberRoleEvent():
      // TODO: Handle this case.
      case RemoveMemberEvent():
      // TODO: Handle this case.
    }
  }

  Future<bool> _canEventUpdateChatRoom({
    required String chatRoomId,
    required RecordedEvent recordedEvent,
  }) async {
    return (recordedEvent.event is RoomEvent) &&
        await _isEventFirstSuccessorOfLastSyncedRoomManagementEvent(
          chatRoomId: chatRoomId,
          recordedEvent: recordedEvent,
        );
  }

  Future<bool> _isEventFirstSuccessorOfLastSyncedRoomManagementEvent({
    required String chatRoomId,
    required RecordedEvent recordedEvent,
  }) async {
    final recordNumber = recordedEvent.recordNumber;
    final firstSuccessorOfLastSyncedRoomManagementEventRecordNumber =
        await _getFirstSuccessorOfLastSyncedRoomManagementEventRecordNumber(
      chatRoomId: chatRoomId,
    );

    return recordNumber ==
        firstSuccessorOfLastSyncedRoomManagementEventRecordNumber;
  }

  Future<int> _getFirstSuccessorOfLastSyncedRoomManagementEventRecordNumber({
    required String chatRoomId,
  }) async {
    return await localChatRepository
            .getLastSyncedRoomManagementEventRecordNumber(
          chatRoomId: chatRoomId,
        ) +
        1;
  }
}

extension RecordedReadMessageEventAction on ChatRoomRecordedEventAction {
  Future<void> processReadMessageEvent() async {
    if (!await _canEventUpdateReadMessage(
      chatRoomId: chatRoomId,
      recordedEvent: recordedEvent,
    )) return;

    final event = recordedEvent.event;

    if (event is ReadMessageEvent) {
      localChatRepository.updateMemberLastReadMessage(
        targetChatRoomId: chatRoomId,
        targetMemberRueJaiUserId: event.owner.rueJaiUserId,
        targetMemberRueJaiUserType: event.owner.rueJaiUserType,
        newLastReadMessageCreatedByRecordNumber: event.readMessageRecordNumber,
      );
    } else {
      throw UnprocessableEventError('Event is not a read event');
    }
  }

  Future<bool> _canEventUpdateReadMessage({
    required String chatRoomId,
    required RecordedEvent recordedEvent,
  }) async {
    final event = recordedEvent.event;

    if (event is ReadMessageEvent) {
      final lastReadMessageAddedByRecordNumber =
          await localChatRepository.getMemberLastReadMessageAddedByRecordNumber(
        chatRoomId: chatRoomId,
        memberRueJaiUserId: event.owner.rueJaiUserId,
        memberRueJaiUserType: event.owner.rueJaiUserType,
      );

      return lastReadMessageAddedByRecordNumber < event.readMessageRecordNumber;
    } else {
      return false;
    }
  }
}
