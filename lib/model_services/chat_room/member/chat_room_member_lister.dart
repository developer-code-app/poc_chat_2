import 'package:poc_chat_2/models/chat_room_member.dart';
import 'package:poc_chat_2/providers/isar_storage/isar_storage_provider.dart';
import 'package:poc_chat_2/repositories/local_chat_repository.dart';

class ChatRoomMemberLister {
  ChatRoomMemberLister({
    required this.chatRoomId,
  });

  final int chatRoomId;

  final _localChatRepository = LocalChatRepository(
    provider: IsarStorageProvider.basic(),
  );

  Future<List<ChatRoomMember>> getChatRoomMembers() async {
    return _localChatRepository.getMembers(chatRoomId: chatRoomId);
  }
}
