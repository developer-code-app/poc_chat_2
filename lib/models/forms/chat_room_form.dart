import 'package:poc_chat_2/models/rue_jai_user.dart';

class ChatRoomForm {
  ChatRoomForm({
    required this.name,
    required this.member,
    this.thumbnailUrl,
  });

  final String name;
  final String? thumbnailUrl;
  final List<ChatRoomMemberForm> member;
}

class ChatRoomMemberForm {
  ChatRoomMemberForm({
    required this.rueJaiUserId,
    required this.rueJaiUserType,
  });

  final String rueJaiUserId;
  final RueJaiUserType rueJaiUserType;
}
