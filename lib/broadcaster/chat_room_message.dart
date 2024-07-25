part of 'broadcaster.dart';

sealed class ChatRoomMessage extends ChatRoom {
  ChatRoomMessage({required super.chatRoomId});
}

class ChatRoomConfirmedMessageAdded extends ChatRoomMessage {
  ChatRoomConfirmedMessageAdded({
    required super.chatRoomId,
    required this.message,
  });

  final Message message;
}

class ChatRoomConfirmedMessageEdited extends ChatRoomMessage {
  ChatRoomConfirmedMessageEdited({
    required super.chatRoomId,
    required this.message,
  });

  final Message message;
}

class ChatRoomConfirmedMessageRemoved extends ChatRoomMessage {
  ChatRoomConfirmedMessageRemoved({
    required super.chatRoomId,
    required this.messageId,
  });

  final int messageId;
}

class ChatRoomSendingMessageAdded extends ChatRoomMessage {
  ChatRoomSendingMessageAdded({
    required super.chatRoomId,
    required this.message,
  });

  final Message message;
}

class ChatRoomSendingMessageTimeOut extends ChatRoomMessage {
  ChatRoomSendingMessageTimeOut({
    required super.chatRoomId,
    required this.messageId,
  });

  final int messageId;
}

class ChatRoomFailedMessageRetried extends ChatRoomMessage {
  ChatRoomFailedMessageRetried({
    required super.chatRoomId,
    required this.messageId,
  });

  final int messageId;
}

class ChatRoomFailedMessageRemoved extends ChatRoomMessage {
  ChatRoomFailedMessageRemoved({
    required super.chatRoomId,
    required this.messageId,
  });

  final int messageId;
}
