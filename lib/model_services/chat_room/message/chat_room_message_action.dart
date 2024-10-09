import 'package:poc_chat_2/models/messages/message.dart';
import 'package:poc_chat_2/repositories/local_chat_repository.dart';

class ChatRoomMessageAction {
  ChatRoomMessageAction({
    required this.chatRoomId,
    required this.localChatRepository,
  });

  final String chatRoomId;
  final LocalChatRepository localChatRepository;

  Future<Message> resendMessage({required int messageId}) async {
    return localChatRepository.resendMessage(messageId: messageId);
  }
}
