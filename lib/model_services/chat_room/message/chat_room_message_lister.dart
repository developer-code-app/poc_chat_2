import 'package:poc_chat_2/models/message.dart';
import 'package:poc_chat_2/repositories/local_chat_repository.dart';

class ChatRoomMessageLister {
  ChatRoomMessageLister({
    required this.chatRoomId,
    required this.localChatRepository,
  });

  final int chatRoomId;
  final LocalChatRepository localChatRepository;

  Future<List<Message>> loadNewerMessages({
    required int chatRoomId,
    required int start,
    required int size,
  }) async {
    return _loadMessages(
      chatRoomId: chatRoomId,
      start: start,
      end: start + size,
    );
  }

  Future<List<Message>> loadOlderMessages({
    required int chatRoomId,
    required int start,
    required int size,
  }) async {
    return _loadMessages(
      chatRoomId: chatRoomId,
      start: start - size,
      end: start,
    );
  }

  Future<List<Message>> searchMessages({
    required int chatRoomId,
    required String query,
  }) async {
    return localChatRepository.searchMessages(chatRoomId, query);
  }

  Future<List<Message>> _loadMessages({
    required int chatRoomId,
    required int start,
    required int end,
  }) async {
    return List.empty();
  }
}
