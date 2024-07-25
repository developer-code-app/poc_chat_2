import 'package:poc_chat_2/model_services/chat_room/member/inquiry.dart';
import 'package:poc_chat_2/models/message.dart';
import 'package:poc_chat_2/providers/isar_storage/isar_storage_provider.dart';
import 'package:poc_chat_2/repositories/local_chat_repository.dart';

class ChatRoomMessageLister {
  ChatRoomMessageLister({
    required this.chatRoomId,
  });

  final int chatRoomId;

  final _localChatRepository = LocalChatRepository(
    provider: IsarStorageProvider.basic(),
  );

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
    return _localChatRepository.searchMessages(chatRoomId, query);
  }

  Future<List<Message>> _loadMessages({
    required int chatRoomId,
    required int start,
    required int end,
  }) async {
    return List.empty();
  }

  ChatRoomMemberInquiry _getChatRoomMemberInquiry({required int memberId}) {
    return ChatRoomMemberInquiry(
      chatRoomId: chatRoomId,
      memberId: memberId,
    );
  }
}
