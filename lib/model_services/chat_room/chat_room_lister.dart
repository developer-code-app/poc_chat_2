import 'package:poc_chat_2/models/chat_room.dart';
import 'package:poc_chat_2/models/chat_room_state.dart';
import 'package:poc_chat_2/repositories/local_chat_repository.dart';
import 'package:poc_chat_2/repositories/server_chat_repository.dart';

class ChatRoomLister {
  ChatRoomLister({
    required this.localChatRepository,
    required this.serverChatRepository,
  });

  final LocalChatRepository localChatRepository;
  final ServerChatRepository serverChatRepository;

  Future<List<ChatRoomState>> getChatRoomStates() async {
    return localChatRepository.getChatRoomStates();
  }

  Future<List<ChatRoom>> getChatRooms() async {
    return localChatRepository.getChatRooms();
  }
}
