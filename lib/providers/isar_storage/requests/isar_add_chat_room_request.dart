import 'package:poc_chat_2/models/forms/chat_room_form.dart';

class IsarAddChatRoomRequest {
  IsarAddChatRoomRequest({
    required this.chatRoomId,
    required this.name,
    required this.lastSyncedRoomAndMessageEventRecordNumber,
    required this.profileHash,
    required this.members,
    this.thumbnailUrl,
  });

  final String chatRoomId;
  final String name;
  final String? thumbnailUrl;
  final int lastSyncedRoomAndMessageEventRecordNumber;
  final String profileHash;
  final List<ChatRoomMemberForm> members;
}
