part of 'broadcaster.dart';

sealed class ChatRoomBasicInfo extends ChatRoom {
  ChatRoomBasicInfo({
    required super.chatRoomId,
  });
}

class ChatRoomBasicInfoUpdated extends ChatRoomBasicInfo {
  ChatRoomBasicInfoUpdated({
    required super.chatRoomId,
    this.name,
    this.thumbnailUrl,
  });

  final String? name;
  final String? thumbnailUrl;
}

class ChatRoomMemberAdded extends ChatRoomBasicInfo {
  ChatRoomMemberAdded({
    required super.chatRoomId,
    required this.member,
  });

  final ChatRoomMember member;
}

class ChatRoomMemberUpdated extends ChatRoomBasicInfo {
  ChatRoomMemberUpdated({
    required super.chatRoomId,
    required this.memberId,
    this.name,
    this.thumbnailUrl,
    this.role,
  });

  final int memberId;
  final String? name;
  final String? thumbnailUrl;
  final ChatRoomMemberRole? role;
}

class ChatRoomMemberRemoved extends ChatRoomBasicInfo {
  ChatRoomMemberRemoved({
    required super.chatRoomId,
    required this.memberId,
  });

  final int memberId;
}

class ChatRoomMemberLastReadMessageUpdated extends ChatRoomBasicInfo {
  ChatRoomMemberLastReadMessageUpdated({
    required super.chatRoomId,
    required this.memberId,
    required this.lastReadMessageId,
  });

  final int memberId;
  final int lastReadMessageId;
}
