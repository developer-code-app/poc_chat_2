import 'package:poc_chat_2/models/chat_room.dart';
import 'package:poc_chat_2/models/chat_room_state.dart';
import 'package:poc_chat_2/models/forms/chat_room_form.dart';
import 'package:poc_chat_2/repositories/local_chat_repository.dart';

class ChatRoomCreator {
  ChatRoomCreator({
    required this.localChatRepository,
  });

  final LocalChatRepository localChatRepository;

  Future<ChatRoom> createChatRoom({
    required ChatRoomState chatRoomState,
    required ChatRoomForm form,
  }) async {
    return localChatRepository.addChatRoom(
      chatRoomState: chatRoomState,
      form: form,
    );
  }
}
