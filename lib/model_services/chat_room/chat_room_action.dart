import 'dart:async';

import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:poc_chat_2/flavor_constants.dart';

import 'package:poc_chat_2/model_services/chat_room/event/chat_room_recorded_event_action.dart';
import 'package:poc_chat_2/model_services/chat_room/event/chat_room_unrecorded_event_action.dart';
import 'package:poc_chat_2/models/chat_room_sync_state.dart';
import 'package:poc_chat_2/models/events/event.dart';
import 'package:poc_chat_2/models/events/recorded_event.dart';
import 'package:poc_chat_2/repositories/local_chat_repository.dart';
import 'package:poc_chat_2/repositories/server_chat_repository.dart';

class ChatRoomAction {
  ChatRoomAction({
    required this.chatRoomId,
    required this.localChatRepository,
    required this.serverChatRepository,
  });

  final String chatRoomId;
  final LocalChatRepository localChatRepository;
  final ServerChatRepository serverChatRepository;

  Future<void> processUnrecordedEvent({
    required Event event,
  }) async {
    return ChatRoomUnrecordedEventAction(
      event: event,
      chatRoomId: chatRoomId,
      localChatRepository: localChatRepository,
      serverChatRepository: serverChatRepository,
    ).processEvent();
  }

  Future<void> processRecordedEvent({
    required RecordedEvent recordedEvent,
  }) async {
    return ChatRoomRecordedEventAction(
      recordedEvent: recordedEvent,
      chatRoomId: chatRoomId,
      localChatRepository: localChatRepository,
    ).processEvent();
  }

  Future<void> updateChatRoom({
    required ChatRoomSyncState chatRoomSyncState,
  }) async {
    await chatRoomSyncState.chatRoomProfileSyncState(
      onUnsynced: (_) => _syncChatRoomProfile(),
    );
    await chatRoomSyncState.roomAndMessageEventSyncState(
      onUnsynced: (chatRoomState) => _syncChatRoomEvent(
        lastSyncedEventRecordNumber:
            chatRoomState.latestRoomAndMessageEventRecordNumber,
      ),
    );

    await _syncChatRoomReadEvent();
  }

  Future<void> _syncChatRoomProfile() async {
    final chatRoomProfile = await serverChatRepository.getServerChatRoomProfile(
      chatRoomId: chatRoomId,
    );

    await localChatRepository.updateChatRoomProfile(
      chatRoomProfile: chatRoomProfile,
    );
  }

  Future<void> _syncChatRoomReadEvent() async {}

  Future<void> _syncChatRoomEvent({
    required int lastSyncedEventRecordNumber,
  }) async {
    final events = await _getServerEventsAfter(
      startAt: lastSyncedEventRecordNumber,
    );

    for (var event in events) {
      await processRecordedEvent(recordedEvent: event);
    }
  }

  Future<void> removeChatRoom() async {
    await localChatRepository.removeChatRoom(
      chatRoomId: chatRoomId,
    );
  }

  Future<List<RecordedEvent>> _getServerEventsAfter(
      {required int startAt}) async {
    // TODO: This is for POC only, change to real implementation
    final url =
        '${FlavorConfig.instance.variables[FlavorVariableKeys.ruejaiChatApiBaseUrl]}api/ruejai-chat/chat-rooms/$chatRoomId/events';

    return serverChatRepository.getChatRoomEventsFromUrl(url: url);
  }
}
