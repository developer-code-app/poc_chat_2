import 'dart:async';

import 'package:poc_chat_2/broadcaster/broadcaster.dart' as broadcaster;
import 'package:poc_chat_2/cubits/alert_dialog_cubit.dart';
import 'package:poc_chat_2/model_services/chat_room/chat_room_action.dart';
import 'package:poc_chat_2/model_services/chat_room/chat_room_creator.dart';
import 'package:poc_chat_2/model_services/chat_room/chat_room_lister.dart';
import 'package:poc_chat_2/model_services/message/message_action.dart';
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
    required this.alertDialogCubit,
  })  : _chatRoomLister = ChatRoomLister(
          localChatRepository: localChatRepository,
          serverChatRepository: serverChatRepository,
        ),
        _chatRoomCreator = ChatRoomCreator(
          localChatRepository: localChatRepository,
        ),
        _userProfileInquiry = UserProfileInquiry(
          serverChatRepository: serverChatRepository,
        ),
        _messageAction = MessageAction(
          localChatRepository: localChatRepository,
        ) {
    broadcaster.Broadcaster.instance.stream.listen(
      onBroadcasterMessageReceived,
    );

    Timer.periodic(
      timeoutSendingMessage,
      (timer) => _updateTimeoutSendingMessageToFailed(),
    );
  }

  static const timeoutSendingMessage = Duration(seconds: 10);

  final LocalChatRepository localChatRepository;
  final ServerChatRepository serverChatRepository;
  final AlertDialogCubit alertDialogCubit;

  ChatRoomAction _getChatRoomAction({required String chatRoomId}) {
    return ChatRoomAction(
      chatRoomId: chatRoomId,
      localChatRepository: localChatRepository,
      serverChatRepository: serverChatRepository,
    );
  }

  final ChatRoomLister _chatRoomLister;
  final ChatRoomCreator _chatRoomCreator;
  final MessageAction _messageAction;

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

  Future<void> _updateTimeoutSendingMessageToFailed() async {
    _messageAction.updateTimeoutSendingMessageToFailed(
      timeout: timeoutSendingMessage,
    );
  }

  Future<void> syncChatRooms() async {
    // _updateExistingChatRooms();
    // _createAndSyncNewChatRoomsIfExists();
  }

  Future<void> syncChatRoom({
    required String chatRoomId,
  }) async {
    return _getChatRoomAction(chatRoomId: chatRoomId).updateChatRoom();
  }

  Future<void> processRecordedEvent({
    required String chatRoomId,
    required RecordedEvent recordedEvent,
  }) async {
    return _getChatRoomAction(chatRoomId: chatRoomId)
        .processRecordedEvent(recordedEvent: recordedEvent);
  }

  Future<void> processNotification({
    required ChatRoom chatRoom,
    required Notification notification,
  }) async {}

  // Future<void> _updateExistingChatRooms() async {
  //   final chatRooms = await _chatRoomLister.getChatRooms();

  //   await Future.wait(
  //     chatRooms.map(
  //       (chatRoom) async => syncChatRoom(chatRoomId: chatRoom.id),
  //     ),
  //   );
  // }

  // Future<void> _createAndSyncNewChatRoomsIfExists() async {
  //   final serverChatRooms = await _userProfileInquiry.getServerChatRooms();
  //   final existingChatRoomIds = await _chatRoomLister
  //       .getChatRooms()
  //       .then((chatRooms) => chatRooms.map((chatRoom) => chatRoom.id).toList());
  //   final newChatRooms = serverChatRooms.where(
  //     (chatRoom) => !existingChatRoomIds.contains(chatRoom.id),
  //   );

  //   await Future.wait(newChatRooms.map((chatRoom) async {
  //     await _chatRoomCreator.createChatRoom(
  //       chatRoomId: chatRoom.id,
  //       name: chatRoom.name,
  //       thumbnailUrl: chatRoom.thumbnailUrl,
  //     );
  //     await syncChatRoom(chatRoomId: chatRoom.id);
  //   }));

  //   if (newChatRooms.isNotEmpty) {
  //     broadcaster.Broadcaster.instance.add(
  //       broadcaster.CreatedAndSyncedNewChatRooms(),
  //     );
  //   }
  // }
}
