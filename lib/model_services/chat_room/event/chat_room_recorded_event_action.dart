import 'package:poc_chat_2/broadcaster/broadcaster.dart';
import 'package:poc_chat_2/error.dart';
import 'package:poc_chat_2/model_services/chat_room/message/chat_room_message_form_creator.dart';
import 'package:poc_chat_2/models/events/message_event.dart';
import 'package:poc_chat_2/models/events/read_event.dart';
import 'package:poc_chat_2/models/events/recorded_event.dart';
import 'package:poc_chat_2/models/events/room_management_event.dart';
import 'package:poc_chat_2/repositories/local_chat_repository.dart';

class ChatRoomRecordedEventAction {
  ChatRoomRecordedEventAction({
    required this.chatRoomId,
    required this.recordedEvent,
    required this.localChatRepository,
  });

  final int chatRoomId;
  final RecordedEvent recordedEvent;
  final LocalChatRepository localChatRepository;

  Future<void> processEvent() async {
    final recordedEvent = this.recordedEvent;

    if (recordedEvent is MessageEvent) {
      processMessageEvent();
    } else if (recordedEvent is RoomManagementEvent) {
      processRoomManagementEvent();
    } else if (recordedEvent is ReadMessageEvent) {
      processReadMessageEvent();
    } else {
      throw UnprocessableEventError('Event is not support');
    }
  }

  ChatRoomMessageFormCreator _getChatRoomMessageFormCreator({
    required int chatRoomId,
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
    required int chatRoomId,
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
    required int chatRoomId,
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
    required int chatRoomId,
    required RecordedEvent recordedEvent,
  }) async {
    return (recordedEvent.event is MessageEvent) &&
        await _isEventFirstSuccessorOfLastSyncedMessageEvent(
          chatRoomId: chatRoomId,
          recordedEvent: recordedEvent,
        );
  }

  Future<bool> _isEventFirstSuccessorOfLastSyncedMessageEvent({
    required int chatRoomId,
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
    required int chatRoomId,
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

    if (event is CreateRoomEvent) {
      await localChatRepository.updateChatRoom(
        targetChatRoomId: chatRoomId,
        newName: event.name,
        newThumbnailUrl: event.thumbnailUrl,
      );

      for (var member in event.members) {
        localChatRepository.createMember(
          targetChatRoomId: chatRoomId,
          member: member,
        );
      }
    } else if (event is InviteMemberEvent) {
      await localChatRepository.createMember(
        targetChatRoomId: chatRoomId,
        member: event.member,
      );
    } else if (event is UpdateMemberRoleEvent) {
      await localChatRepository.updateMemberRole(
        targetChatRoomId: chatRoomId,
        targetMemberAddedByRecordNumber: event.updatedMemberRecordNumber,
        newRole: event.memberRole,
      );
    } else if (event is RemoveMemberEvent) {
      await localChatRepository.deleteMember(
        targetChatRoomId: chatRoomId,
        targetMemberAddedByRecordNumber: event.removedMemberRecordNumber,
      );
    } else {
      throw UnprocessableEventError('Event is not a room management event');
    }
  }

  Future<bool> _canEventUpdateChatRoom({
    required int chatRoomId,
    required RecordedEvent recordedEvent,
  }) async {
    return (recordedEvent.event is RoomManagementEvent) &&
        await _isEventFirstSuccessorOfLastSyncedRoomManagementEvent(
          chatRoomId: chatRoomId,
          recordedEvent: recordedEvent,
        );
  }

  Future<bool> _isEventFirstSuccessorOfLastSyncedRoomManagementEvent({
    required int chatRoomId,
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
    required int chatRoomId,
  }) async {
    return localChatRepository.getLastSyncedRoomManagementEventRecordNumber(
      chatRoomId: chatRoomId,
    );
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
    required int chatRoomId,
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
