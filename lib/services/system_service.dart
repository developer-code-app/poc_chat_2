import 'package:poc_chat_2/broadcaster/broadcaster.dart' as broadcaster;
import 'package:poc_chat_2/model_services/chat_room/chat_room_action.dart';
import 'package:poc_chat_2/model_services/chat_room/chat_room_creator.dart';
import 'package:poc_chat_2/model_services/chat_room/chat_room_lister.dart';
import 'package:poc_chat_2/model_services/user_profile/inquiry.dart';
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
        ),
        _userProfileInquiry = UserProfileInquiry(
          serverChatRepository: serverChatRepository,
        ) {
    broadcaster.Broadcaster.instance.stream.listen(
      onBroadcasterMessageReceived,
    );
  }

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
  final UserProfileInquiry _userProfileInquiry;

  void onBroadcasterMessageReceived(broadcaster.BroadcasterMessage message) {
    switch (message) {
      case broadcaster.WebSocketConnected():
        syncChatRooms();
      case broadcaster.WebSocketMessageReceived():
        processRecordedEvent(
          chatRoomId: message.chatRoomId,
          recordedEvent: message.recordedEvent,
        );
    }
  }

  Future<void> syncChatRooms() async {
    _updateExistingChatRooms();
    _createAndSyncNewChatRoomsIfExists();
  }

  Future<void> syncChatRoom({
    required int chatRoomId,
  }) async {
    return _getChatRoomAction(chatRoomId: chatRoomId).updateChatRoom();
  }

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
        (chatRoom) async => syncChatRoom(chatRoomId: chatRoom.id),
      ),
    );
  }

  Future<void> _createAndSyncNewChatRoomsIfExists() async {
    final serverChatRooms = await _userProfileInquiry.getServerAllChatRooms();
    final existingChatRoomIds = await _chatRoomLister
        .getAllChatRooms()
        .then((chatRooms) => chatRooms.map((chatRoom) => chatRoom.id).toList());
    final newChatRooms = serverChatRooms.where(
      (chatRoom) => !existingChatRoomIds.contains(chatRoom.id),
    );

    await Future.wait(newChatRooms.map(_createAndSyncNewChatRoom));

    if (newChatRooms.isNotEmpty) {
      broadcaster.Broadcaster.instance.add(
        broadcaster.CreatedAndSyncedNewChatRooms(),
      );
    }
  }

  Future<void> _createAndSyncNewChatRoom(ChatRoom chatRoom) async {
    await _chatRoomCreator.createChatRoom(
      chatRoomId: chatRoom.id,
      name: chatRoom.name,
      thumbnailUrl: chatRoom.thumbnailUrl,
    );
    await syncChatRoom(chatRoomId: chatRoom.id);
  }
}
