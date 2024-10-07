import 'package:poc_chat_2/broadcaster/broadcaster.dart' as broadcaster;
import 'package:poc_chat_2/model_services/chat_room/chat_room_creator.dart';
import 'package:poc_chat_2/model_services/chat_room/chat_room_lister.dart';
import 'package:poc_chat_2/model_services/event/creator.dart';
import 'package:poc_chat_2/models/chat_room.dart';
import 'package:poc_chat_2/models/chat_room_sync_state.dart';
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
    required this.systemService,
  })  : _chatRoomLister = ChatRoomLister(
          localChatRepository: localChatRepository,
          serverChatRepository: serverChatRepository,
        ),
        _eventCreator = EventCreator(rueJaiUser: rueJaiUser),
        _chatRoomCreator = ChatRoomCreator(
          localChatRepository: localChatRepository,
        );

  final RueJaiUser rueJaiUser;
  final LocalChatRepository localChatRepository;
  final ServerChatRepository serverChatRepository;
  final SystemService systemService;

  final EventCreator _eventCreator;
  final ChatRoomCreator _chatRoomCreator;

  final ChatRoomLister _chatRoomLister;

  Future<List<ChatRoom>> getChatRooms() async {
    return _chatRoomLister.getChatRooms();
  }

  Future<void> createChatRoom({required ChatRoomForm form}) async {
    final event = _eventCreator.createCreateRoomEventFromForm(form: form);
    final serverChatRoomState =
        await serverChatRepository.publishCreateChatRoomEvent(event: event);
    final chatRoomState = await _chatRoomCreator.createChatRoom(
      chatRoomId: serverChatRoomState.id,
      profileHash: serverChatRoomState.profileHash,
      form: form,
    );
    final chatRoomSyncState = ChatRoomSyncState.fromState(
      chatRoomState: chatRoomState,
      serverChatRoomState: serverChatRoomState,
    );

    await systemService.syncChatRoom(chatRoomSyncState: chatRoomSyncState);

    broadcaster.Broadcaster.instance.add(
      broadcaster.CreatedAndSyncedNewChatRooms(),
    );
  }
}
