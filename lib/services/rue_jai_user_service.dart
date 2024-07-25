import 'package:poc_chat_2/model_services/chat_room/chat_room_lister.dart';
import 'package:poc_chat_2/models/chat_room.dart';
import 'package:poc_chat_2/models/rue_jai_user.dart';

class RueJaiUserService {
  RueJaiUserService({
    required this.rueJaiUser,
  });

  final RueJaiUser rueJaiUser;

  final chatRoomLister = ChatRoomLister();

  Future<List<ChatRoom>> getChatRooms() async {
    return chatRoomLister.getAllChatRooms();
  }
}
