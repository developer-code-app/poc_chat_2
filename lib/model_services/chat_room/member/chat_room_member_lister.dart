import 'package:poc_chat_2/models/chat_room_member.dart';
import 'package:poc_chat_2/repositories/local_chat_repository.dart';

class ChatRoomMemberLister {
  ChatRoomMemberLister({
    required this.chatRoomId,
    required this.localChatRepository,
  });

  final String chatRoomId;
  final LocalChatRepository localChatRepository;

  Future<List<ChatRoomMember>> getChatRoomMembers() async {
    return localChatRepository.getMembers(chatRoomId: chatRoomId);
  }
}
