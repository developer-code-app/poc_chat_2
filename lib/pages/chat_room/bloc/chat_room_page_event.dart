part of 'chat_room_page_bloc.dart';

sealed class ChatRoomPageEvent {}

class StartedEvent extends _Event {}

class MessageSentEvent extends _Event {
  MessageSentEvent({required this.messageEvent});

  final MessageEvent messageEvent;
}

class ChatRoomBasicInfoUpdatedEvent extends _Event {
  ChatRoomBasicInfoUpdatedEvent({
    required this.chatRoomId,
    this.name,
    this.thumbnailUrl,
  });

  final int chatRoomId;
  final String? name;
  final String? thumbnailUrl;
}

class ChatRoomMemberAddedEvent extends _Event {
  ChatRoomMemberAddedEvent({
    required this.chatRoomId,
    required this.member,
  });

  final int chatRoomId;
  final ChatRoomMember member;
}

class ChatRoomMemberUpdatedEvent extends _Event {
  ChatRoomMemberUpdatedEvent({
    required this.chatRoomId,
    required this.memberId,
    this.name,
    this.thumbnailUrl,
    this.role,
  });

  final int chatRoomId;
  final int memberId;
  final String? name;
  final String? thumbnailUrl;
  final ChatRoomMemberRole? role;
}

class ChatRoomMemberRemovedEvent extends _Event {
  ChatRoomMemberRemovedEvent({
    required this.chatRoomId,
    required this.memberId,
  });

  final int chatRoomId;
  final int memberId;
}

class ChatRoomMemberLastReadMessageUpdatedEvent extends _Event {
  ChatRoomMemberLastReadMessageUpdatedEvent({
    required this.chatRoomId,
    required this.memberId,
    required this.lastReadMessageId,
  });

  final int chatRoomId;
  final int memberId;
  final int lastReadMessageId;
}

class ChatRoomConfirmedMessageAddedEvent extends _Event {
  ChatRoomConfirmedMessageAddedEvent({
    required this.chatRoomId,
    required this.message,
  });

  final int chatRoomId;
  final Message message;
}

class ChatRoomConfirmedMessageEditedEvent extends _Event {
  ChatRoomConfirmedMessageEditedEvent({
    required this.chatRoomId,
    required this.message,
  });

  final int chatRoomId;
  final Message message;
}

class ChatRoomConfirmedMessageRemovedEvent extends _Event {
  ChatRoomConfirmedMessageRemovedEvent({
    required this.chatRoomId,
    required this.messageId,
  });

  final int chatRoomId;
  final int messageId;
}

class ChatRoomSendingMessageAddedEvent extends _Event {
  ChatRoomSendingMessageAddedEvent({
    required this.chatRoomId,
    required this.message,
  });

  final int chatRoomId;
  final Message message;
}

class ChatRoomSendingMessageTimeOutEvent extends _Event {
  ChatRoomSendingMessageTimeOutEvent({
    required this.chatRoomId,
    required this.messageId,
  });

  final int chatRoomId;
  final int messageId;
}

class ChatRoomFailedMessageRetriedEvent extends _Event {
  ChatRoomFailedMessageRetriedEvent({
    required this.chatRoomId,
    required this.messageId,
  });

  final int chatRoomId;
  final int messageId;
}

class ChatRoomFailedMessageRemovedEvent extends _Event {
  ChatRoomFailedMessageRemovedEvent({
    required this.chatRoomId,
    required this.messageId,
  });

  final int chatRoomId;
  final int messageId;
}