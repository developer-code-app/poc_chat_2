import 'package:poc_chat_2/models/chat_room_sync_state.dart';
import 'package:poc_chat_2/repositories/local_chat_repository.dart';

class ChatRoomCreator {
  ChatRoomCreator({
    required this.localChatRepository,
  });

  final LocalChatRepository localChatRepository;

  Future<ChatRoomState> createChatRoom({
    required String chatRoomId,
  }) async {
    return localChatRepository.addChatRoom(chatRoomId: chatRoomId);
  }
}
