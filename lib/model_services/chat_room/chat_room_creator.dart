import 'package:poc_chat_2/broadcaster/broadcaster.dart';
import 'package:poc_chat_2/repositories/local_chat_repository.dart';

class ChatRoomCreator {
  ChatRoomCreator({
    required this.localChatRepository,
  });

  final LocalChatRepository localChatRepository;

  Future<void> createChatRoom({
    required int chatRoomId,
    required String name,
    String? thumbnailUrl,
  }) async {
    await localChatRepository.addChatRoom(
      chatRoomId: chatRoomId,
      name: name,
      thumbnailUrl: thumbnailUrl,
    );
  }
}
