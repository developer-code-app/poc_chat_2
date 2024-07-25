import 'package:poc_chat_2/providers/isar_storage/isar_storage_provider.dart';
import 'package:poc_chat_2/repositories/local_chat_repository.dart';

class ChatRoomCreator {
  final _localChatRepository = LocalChatRepository(
    provider: IsarStorageProvider.basic(),
  );

  Future<void> createChatRoom({
    required int chatRoomId,
  }) async {
    await _localChatRepository.addChatRoom(chatRoomId: chatRoomId);
  }
}
