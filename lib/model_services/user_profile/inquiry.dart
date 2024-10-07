import 'package:poc_chat_2/models/chat_room_sync_state.dart';
import 'package:poc_chat_2/repositories/server_chat_repository.dart';

class UserProfileInquiry {
  UserProfileInquiry({required this.serverChatRepository});

  final ServerChatRepository serverChatRepository;

  Future<List<ServerChatRoomState>> getServerChatRoomStates() async {
    return serverChatRepository.getServerChatRoomStates();
  }
}
