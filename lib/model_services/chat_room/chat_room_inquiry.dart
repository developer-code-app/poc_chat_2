import 'package:poc_chat_2/models/chat_room.dart';
import 'package:poc_chat_2/models/chat_room_member.dart';
import 'package:poc_chat_2/models/rue_jai_user.dart';
import 'package:poc_chat_2/repositories/local_chat_repository.dart';

class ChatRoomInquiry {
  ChatRoomInquiry({
    required this.chatRoomId,
    required this.localChatRepository,
  });

  final int chatRoomId;
  final LocalChatRepository localChatRepository;

  Future<ChatRoom?> getChatRoom({
    required int chatRoomId,
  }) async {
    return localChatRepository.getChatRoom();
  }

  Future<ChatRoomMember> getMemberByRueJaiUser({
    required String rueJaiUserId,
    required RueJaiUserType rueJaiUserType,
  }) async {
    final rueJaiUser = RueJaiUser(
      id: 1,
      rueJaiUserId: rueJaiUserId,
      rueJaiUserType: rueJaiUserType,
      rueJaiUserRole: RueJaiUserRole.customerService,
      name: 'name',
      thumbnailUrl: 'thumbnailUrl',
    );

    return ChatRoomMember(
      id: 1,
      role: ChatRoomMemberRole.member,
      rueJaiUser: rueJaiUser,
      lastReadMessageId: 0,
    );
  }

  Future<int> messageCount() {
    return localChatRepository.getMessageCount();
  }
}
