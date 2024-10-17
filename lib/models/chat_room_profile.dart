import 'package:poc_chat_2/models/chat_room_member.dart';
import 'package:poc_chat_2/providers/ruejai_chat/entities/rue_jai_chat_room_profile_entity.dart';

class ChatRoomProfile {
  ChatRoomProfile({
    required this.id,
    required this.name,
    required this.thumbnailUrl,
    required this.members,
    required this.profileHash,
  });

  factory ChatRoomProfile.fromEntity(RueJaiChatRoomProfileEntity entity) {
    return ChatRoomProfile(
      id: entity.id.toString(),
      name: entity.name,
      thumbnailUrl: entity.thumbnailUrl,
      members: entity.members.map(ChatRoomMember.fromEntity).toList(),
      profileHash: entity.profileHash,
    );
  }

  final String id;
  final String name;
  final String? thumbnailUrl;
  final List<ChatRoomMember> members;
  final String profileHash;
}
