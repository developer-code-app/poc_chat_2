import 'package:poc_chat_2/repositories/local_chat_repository.dart';

class ChatRoomMemberInquiry {
  ChatRoomMemberInquiry({
    required this.chatRoomId,
    required this.memberId,
    required this.localChatRepository,
  });

  final String chatRoomId;
  final String memberId;
  final LocalChatRepository localChatRepository;

  Future<int> getLastReadMessageId() async {
    return 0;
  }
}
