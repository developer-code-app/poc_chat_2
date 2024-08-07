import 'package:poc_chat_2/models/chat_room_member.dart';
import 'package:poc_chat_2/models/rue_jai_user.dart';

class ChatRoomForm {
  ChatRoomForm({
    required this.name,
    required this.members,
    this.thumbnailUrl,
  });

  final String name;
  final String? thumbnailUrl;
  final List<ChatRoomMemberForm> members;
}

class ChatRoomMemberForm {
  ChatRoomMemberForm({
    required this.role,
    required this.rueJaiUserId,
    required this.rueJaiUserType,
  });

  final ChatRoomMemberRole role;
  final String rueJaiUserId;
  final RueJaiUserType rueJaiUserType;
}
