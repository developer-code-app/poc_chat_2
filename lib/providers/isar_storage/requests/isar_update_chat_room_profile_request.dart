import 'package:poc_chat_2/models/chat_room_member.dart';

class IsarUpdateChatRoomProfileRequest {
  IsarUpdateChatRoomProfileRequest({
    required this.roomId,
    required this.name,
    required this.profileHash,
    required this.members,
    this.thumbnailUrl,
  });

  final String roomId;
  final String name;
  final String? thumbnailUrl;
  final String profileHash;
  final List<ChatRoomMember> members;
}
