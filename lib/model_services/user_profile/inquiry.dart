import 'package:poc_chat_2/models/chat_room.dart';
import 'package:poc_chat_2/repositories/server_chat_repository.dart';

class UserProfileInquiry {
  UserProfileInquiry({required this.serverChatRepository});

  final ServerChatRepository serverChatRepository;

  Future<List<ChatRoom>> getServerAllChatRooms() async {
    return serverChatRepository.getAllChatRooms();
  }
}
