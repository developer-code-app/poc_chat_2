import 'package:poc_chat_2/broadcaster/broadcaster.dart' as broadcaster;
import 'package:poc_chat_2/model_services/chat_room/chat_room_creator.dart';
import 'package:poc_chat_2/model_services/chat_room/chat_room_lister.dart';
import 'package:poc_chat_2/model_services/event/creator.dart';
import 'package:poc_chat_2/models/chat_room.dart';
import 'package:poc_chat_2/models/forms/chat_room_form.dart';
import 'package:poc_chat_2/models/rue_jai_user.dart';
import 'package:poc_chat_2/repositories/local_chat_repository.dart';
import 'package:poc_chat_2/repositories/server_chat_repository.dart';
import 'package:poc_chat_2/services/system_service.dart';

class RueJaiUserService {
  RueJaiUserService({
    required this.rueJaiUser,
    required this.localChatRepository,
    required this.serverChatRepository,
  })  : _chatRoomLister = ChatRoomLister(
          localChatRepository: localChatRepository,
          serverChatRepository: serverChatRepository,
        ),
        _eventCreator = EventCreator(rueJaiUser: rueJaiUser),
        _chatRoomCreator = ChatRoomCreator(
          localChatRepository: localChatRepository,
        ),
        _systemService = SystemService(
          localChatRepository: localChatRepository,
          serverChatRepository: serverChatRepository,
        );

  final RueJaiUser rueJaiUser;
  final LocalChatRepository localChatRepository;
  final ServerChatRepository serverChatRepository;
  final SystemService _systemService;

  final EventCreator _eventCreator;
  final ChatRoomCreator _chatRoomCreator;

  final ChatRoomLister _chatRoomLister;

  Future<List<ChatRoom>> getChatRooms() async {
    return _chatRoomLister.getAllChatRooms();
  }

  Future<void> createChatRoom({required ChatRoomForm form}) async {
    final event = _eventCreator.createCreateRoomEventFromForm(form: form);

    final chatRoom = await serverChatRepository.publishCreateChatRoomEvent(
      event: event,
    );

    await _chatRoomCreator.createChatRoom(
      chatRoomId: chatRoom.id,
      name: chatRoom.name,
      thumbnailUrl: chatRoom.thumbnailUrl,
    );

    await _systemService.syncChatRoom(chatRoomId: chatRoom.id);

    broadcaster.Broadcaster.instance.add(
      broadcaster.CreatedAndSyncedNewChatRooms(),
    );
  }
}
