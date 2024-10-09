import 'package:poc_chat_2/models/chat_room.dart';
import 'package:poc_chat_2/models/chat_room_member.dart';
import 'package:poc_chat_2/models/rue_jai_user.dart';
import 'package:poc_chat_2/repositories/local_chat_repository.dart';

class ChatRoomInquiry {
  ChatRoomInquiry({
    required this.chatRoomId,
    required this.localChatRepository,
  });

  final String chatRoomId;
  final LocalChatRepository localChatRepository;

  Future<ChatRoom> getChatRoom({
    required String chatRoomId,
  }) async {
    return localChatRepository.getChatRoom(chatRoomId: chatRoomId);
  }

  Future<ChatRoomMember> getMemberByRueJaiUser({
    required String rueJaiUserId,
    required RueJaiUserType rueJaiUserType,
  }) async {
    return localChatRepository.getMemberByRueJaiUser(
      chatRoomId: chatRoomId,
      rueJaiUserId: rueJaiUserId,
    );
  }

  Future<int> messageCount() {
    return localChatRepository.getMessageCount();
  }
}
