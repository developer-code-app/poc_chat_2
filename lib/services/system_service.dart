import 'package:poc_chat_2/model_services/chat_room/chat_room_action.dart';
import 'package:poc_chat_2/model_services/chat_room/chat_room_creator.dart';
import 'package:poc_chat_2/model_services/chat_room/chat_room_lister.dart';
import 'package:poc_chat_2/models/chat_room.dart';
import 'package:poc_chat_2/models/events/recorded_event.dart';
import 'package:poc_chat_2/models/notification.dart';
import 'package:poc_chat_2/repositories/local_chat_repository.dart';
import 'package:poc_chat_2/repositories/server_chat_repository.dart';

class SystemService {
  SystemService({
    required this.localChatRepository,
    required this.serverChatRepository,
  })  : _chatRoomLister = ChatRoomLister(
          localChatRepository: localChatRepository,
          serverChatRepository: serverChatRepository,
        ),
        _chatRoomCreator = ChatRoomCreator(
          localChatRepository: localChatRepository,
        );

  final LocalChatRepository localChatRepository;
  final ServerChatRepository serverChatRepository;

  ChatRoomAction _getChatRoomAction({required int chatRoomId}) {
    return ChatRoomAction(
        chatRoomId: chatRoomId,
        localChatRepository: localChatRepository,
        serverChatRepository: serverChatRepository);
  }

  final ChatRoomLister _chatRoomLister;
  final ChatRoomCreator _chatRoomCreator;

  Future<void> syncChatRooms() async {
    _updateExistingChatRooms();
    _createAndSyncNewChatRoomsIfExists();
  }

  Future<void> syncChatRoom({
    required int chatRoomId,
  }) async {}

  Future<void> processRecordedEvent({
    required int chatRoomId,
    required RecordedEvent recordedEvent,
  }) async {
    return _getChatRoomAction(chatRoomId: chatRoomId)
        .processRecordedEvent(recordedEvent: recordedEvent);
  }

  Future<void> processNotification({
    required ChatRoom chatRoom,
    required Notification notification,
  }) async {}

  Future<void> _updateExistingChatRooms() async {
    final chatRooms = await _chatRoomLister.getAllChatRooms();

    await Future.wait(
      chatRooms.map(
        (chatRoom) async => _getChatRoomAction(
          chatRoomId: chatRoom.id,
        ).updateChatRoom(),
      ),
    );
  }

  Future<void> _createAndSyncNewChatRoomsIfExists() async {
    final serverChatRoomIds = [1];
    final existingChatRoomIds = await _chatRoomLister.getAllChatRooms().then(
          (chatRooms) => chatRooms.map((chatRoom) => chatRoom.id),
        );
    final newChatRoomIds =
        serverChatRoomIds.toSet().difference(existingChatRoomIds.toSet());

    await Future.wait(newChatRoomIds.map(
      (chatRoomId) async {
        await _chatRoomCreator.createChatRoom(
          chatRoomId: chatRoomId,
        );
        await _getChatRoomAction(chatRoomId: chatRoomId).updateChatRoom();
      },
    ));
  }
}
