import 'package:poc_chat_2/model_services/chat_room/chat_room_lister.dart';
import 'package:poc_chat_2/models/chat_room.dart';
import 'package:poc_chat_2/models/rue_jai_user.dart';
import 'package:poc_chat_2/repositories/local_chat_repository.dart';
import 'package:poc_chat_2/repositories/server_chat_repository.dart';

class RueJaiUserService {
  RueJaiUserService({
    required this.rueJaiUser,
    required this.localChatRepository,
    required this.serverChatRepository,
  }) : _chatRoomLister = ChatRoomLister(
          localChatRepository: localChatRepository,
          serverChatRepository: serverChatRepository,
        );

  final RueJaiUser rueJaiUser;
  final LocalChatRepository localChatRepository;
  final ServerChatRepository serverChatRepository;

  final ChatRoomLister _chatRoomLister;

  Future<List<ChatRoom>> getChatRooms() async {
    return _chatRoomLister.getAllChatRooms();
  }
}
