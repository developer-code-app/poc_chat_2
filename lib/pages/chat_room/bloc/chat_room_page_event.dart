part of 'chat_room_page_bloc.dart';

sealed class ChatRoomPageEvent {}

class StartedEvent extends _Event {}

class DataLoadedEvent extends _Event {
  DataLoadedEvent({required this.chatRoom});

  final ChatRoom chatRoom;
}

class ErrorOccurredEvent extends _Event {
  ErrorOccurredEvent({required this.error});

  final Exception error;
}

class MessageSentEvent extends _Event {}

class ChatRoomBasicInfoUpdatedEvent extends _Event {
  ChatRoomBasicInfoUpdatedEvent({
    required this.chatRoomId,
    this.name,
    this.thumbnailUrl,
  });

  final String chatRoomId;
  final String? name;
  final String? thumbnailUrl;
}

class ChatRoomMemberAddedEvent extends _Event {
  ChatRoomMemberAddedEvent({
    required this.chatRoomId,
    required this.member,
  });

  final String chatRoomId;
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

  final String chatRoomId;
  final String memberId;
  final String? name;
  final String? thumbnailUrl;
  final ChatRoomMemberRole? role;
}

class ChatRoomMemberRemovedEvent extends _Event {
  ChatRoomMemberRemovedEvent({
    required this.chatRoomId,
    required this.memberId,
  });

  final String chatRoomId;
  final String memberId;
}

class ChatRoomMemberLastReadMessageUpdatedEvent extends _Event {
  ChatRoomMemberLastReadMessageUpdatedEvent({
    required this.chatRoomId,
    required this.memberId,
    required this.lastReadMessageRecordNumber,
  });

  final String chatRoomId;
  final String memberId;
  final int lastReadMessageRecordNumber;
}

class ChatRoomConfirmedMessageAddedEvent extends _Event {
  ChatRoomConfirmedMessageAddedEvent({
    required this.chatRoomId,
    required this.message,
  });

  final String chatRoomId;
  final Message message;
}

class ChatRoomConfirmedMessageEditedEvent extends _Event {
  ChatRoomConfirmedMessageEditedEvent({
    required this.chatRoomId,
    required this.message,
  });

  final String chatRoomId;
  final Message message;
}

class ChatRoomConfirmedMessageRemovedEvent extends _Event {
  ChatRoomConfirmedMessageRemovedEvent({
    required this.chatRoomId,
    required this.messageId,
  });

  final String chatRoomId;
  final int messageId;
}

class ChatRoomSendingMessageAddedEvent extends _Event {
  ChatRoomSendingMessageAddedEvent({
    required this.chatRoomId,
    required this.message,
  });

  final String chatRoomId;
  final Message message;
}

class ChatRoomSendingMessageTimeOutEvent extends _Event {
  ChatRoomSendingMessageTimeOutEvent({
    required this.chatRoomId,
    required this.messageId,
  });

  final String chatRoomId;
  final int messageId;
}

class ChatRoomFailedMessageRetriedEvent extends _Event {
  ChatRoomFailedMessageRetriedEvent({
    required this.chatRoomId,
    required this.messageId,
  });

  final String chatRoomId;
  final int messageId;
}

class ChatRoomFailedMessageRemovedEvent extends _Event {
  ChatRoomFailedMessageRemovedEvent({
    required this.chatRoomId,
    required this.messageId,
  });

  final String chatRoomId;
  final int messageId;
}

class ChatRoomTemporaryMessageRemovedEvent extends _Event {
  ChatRoomTemporaryMessageRemovedEvent({
    required this.chatRoomId,
    required this.messageId,
  });

  final String chatRoomId;
  final int messageId;
}

class UpdateSendingMessageToFailedMessageEvent extends _Event {}

class AssetsPickerRequestedEvent extends _Event {
  AssetsPickerRequestedEvent({
    required this.context,
  });

  final BuildContext context;
}

class AssetRemovedEvent extends _Event {
  AssetRemovedEvent({
    required this.asset,
  });

  final AssetEntity asset;
}

class ConfirmedMessageSelectActionRequestedEvent extends _Event {
  ConfirmedMessageSelectActionRequestedEvent({
    required this.messageId,
  });

  final int messageId;
}

class FailedMessageSelectActionRequestedEvent extends _Event {
  FailedMessageSelectActionRequestedEvent({
    required this.messageId,
  });

  final int messageId;
}

class PhotosSavedEvent extends _Event {
  PhotosSavedEvent({required this.urls});

  final List<String> urls;
}

class MessageRepliedEvent extends _Event {
  MessageRepliedEvent({required this.message});

  final MemberMessage message;
}

class MessageReplyRemovedEvent extends _Event {}

class MessageCopiedEvent extends _Event {
  MessageCopiedEvent({required this.message});

  final MemberMessage message;
}

class MessagePastedEvent extends _Event {
  MessagePastedEvent({required this.editableTextState});

  final EditableTextState editableTextState;
}

class PhotoSelectActionRequestedEvent extends _Event {
  PhotoSelectActionRequestedEvent({
    required this.urls,
    required this.index,
  });

  final List<String> urls;
  final int index;
}

class AddPreviewMetadataRequestedEvent extends _Event {
  AddPreviewMetadataRequestedEvent({
    required this.messageId,
    required this.text,
  });

  final int messageId;
  final String text;
}

class MessageResentEvent extends _Event {
  MessageResentEvent({
    required this.messageId,
  });

  final int messageId;
}

class MessageUnsendEvent extends _Event {
  MessageUnsendEvent({
    required this.messageId,
  });

  final int messageId;
}
