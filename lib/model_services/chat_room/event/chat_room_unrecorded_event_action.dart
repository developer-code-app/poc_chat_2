import 'package:poc_chat_2/broadcaster/broadcaster.dart';
import 'package:poc_chat_2/error.dart';
import 'package:poc_chat_2/model_services/chat_room/message/chat_room_message_form_creator.dart';
import 'package:poc_chat_2/models/events/event.dart';
import 'package:poc_chat_2/models/events/message_event.dart';
import 'package:poc_chat_2/models/events/read_event.dart';
import 'package:poc_chat_2/models/events/room_event.dart';
import 'package:poc_chat_2/models/forms/message_form.dart';
import 'package:poc_chat_2/repositories/local_chat_repository.dart';
import 'package:poc_chat_2/repositories/server_chat_repository.dart';

class ChatRoomUnrecordedEventAction {
  ChatRoomUnrecordedEventAction({
    required this.chatRoomId,
    required this.event,
    required this.serverChatRepository,
    required this.localChatRepository,
  });

  final int chatRoomId;
  final Event event;
  final ServerChatRepository serverChatRepository;
  final LocalChatRepository localChatRepository;

  Future<void> processEvent() async {
    final event = this.event;

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
    required int chatRoomId,
  }) {
    return ChatRoomMessageFormCreator(
      chatRoomId: chatRoomId,
      localChatRepository: localChatRepository,
    );
  }
}

extension _UnrecordedMessageEventAction on ChatRoomUnrecordedEventAction {
  Future<void> processMessageEvent() async {
    final event = this.event;

    if (event is! MessageEvent) {
      throw UnprocessableEventError('Event is not a message event');
    }

    final messageForm = await _convertUnrecordedEventToMessageForm(
      chatRoomId: chatRoomId,
      event: event,
    );

    if (messageForm != null) {
      final message = await localChatRepository.createSendingMessage(
        targetChatRoomId: chatRoomId,
        form: messageForm,
      );

      Broadcaster.instance.add(
        ChatRoomSendingMessageAdded(
          chatRoomId: chatRoomId,
          message: message,
        ),
      );

      Broadcaster.instance.add(
        WebSocketMessageSent(
          chatRoomId: chatRoomId,
          message: message,
        ),
      );
    }
  }

  Future<MessageForm?> _convertUnrecordedEventToMessageForm({
    required int chatRoomId,
    required Event event,
  }) async {
    if (event is CreateMessageEvent) {
      return _getChatRoomMessageFormCreator(chatRoomId: chatRoomId)
          .createMessageFormFromUnrecordedEvent(event: event);
    }

    return null;
  }
}

extension _UnrecordedRoomManagementEventAction
    on ChatRoomUnrecordedEventAction {
  Future<void> processRoomManagementEvent() async {
    final event = this.event;

    if (event is! RoomEvent) {
      throw UnprocessableEventError('Event is not a room management event');
    }

    serverChatRepository.publishRoomManagementEvent(
      chatRoomId: chatRoomId,
      event: event,
    );
  }
}

extension _UnrecordedReadMessageEventAction on ChatRoomUnrecordedEventAction {
  void processReadMessageEvent() {
    final event = this.event;

    if (event is! ReadMessageEvent) {
      throw UnprocessableEventError('Event is not a read message event');
    }

    serverChatRepository.publishReadMessageEvent(
      chatRoomId: chatRoomId,
      event: event,
    );
  }
}
