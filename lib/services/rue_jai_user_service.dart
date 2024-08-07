import 'package:poc_chat_2/model_services/chat_room/chat_room_lister.dart';
import 'package:poc_chat_2/model_services/event/creator.dart';
import 'package:poc_chat_2/models/chat_room.dart';
import 'package:poc_chat_2/models/forms/chat_room_form.dart';
import 'package:poc_chat_2/models/rue_jai_user.dart';
import 'package:poc_chat_2/repositories/local_chat_repository.dart';
import 'package:poc_chat_2/repositories/server_chat_repository.dart';

class RueJaiUserService {
  RueJaiUserService({
    required this.rueJaiUser,
    required this.localChatRepository,
    required this.serverChatRepository,
  })  : _chatRoomLister = ChatRoomLister(
          localChatRepository: localChatRepository,
          serverChatRepository: serverChatRepository,
        ),
        _eventCreator = EventCreator(rueJaiUser: rueJaiUser);

  final RueJaiUser rueJaiUser;
  final LocalChatRepository localChatRepository;
  final ServerChatRepository serverChatRepository;
  final EventCreator _eventCreator;

  final ChatRoomLister _chatRoomLister;

  Future<List<ChatRoom>> getChatRooms() async {
    return _chatRoomLister.getAllChatRooms();
  }

  Future<void> createChatRoom({required ChatRoomForm form}) async {
    final event = _eventCreator.createCreateRoomEventFromForm(form: form);

    serverChatRepository.publishCreateChatRoomEvent(event: event);
  }
}
