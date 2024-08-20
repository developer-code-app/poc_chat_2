import 'package:poc_chat_2/model_services/chat_room/event/chat_room_recorded_event_action.dart';
import 'package:poc_chat_2/model_services/chat_room/event/chat_room_unrecorded_event_action.dart';
import 'package:poc_chat_2/models/chat_room.dart';
import 'package:poc_chat_2/models/chat_room_latest_event_record_info.dart';
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

  final int chatRoomId;
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

  Future<void> updateChatRoom() async {
    final chatRoomSyncState = await _getChatRoomSyncState();

    _updateChatRoomState(
      currentSyncState: chatRoomSyncState.roomAndMessageEventSyncState,
      onUnsynced: () => _syncChatRoomMessageEvent(
        lastSyncedEventRecordNumber:
            chatRoomSyncState.latestRoomAndMessageEventRecordNumber,
      ),
    );
    _syncChatRoomReadEvent();
  }

  Future<ChatRoomSyncState> _getChatRoomSyncState() async {
    final lastSyncedEventRecordInfo =
        await getChatRoomLastSyncedEventRecordInfo();
    final serverLatestEventRecordInfo =
        await getServerChatRoomLatestEventRecordInfo();

    return ChatRoomSyncState(
      roomAndMessageEventSyncState: _getSyncState(
        latestRecordNumber:
            lastSyncedEventRecordInfo.roomAndMessageRecordNumber,
        serverLatestRecordNumber:
            serverLatestEventRecordInfo.roomAndMessageRecordNumber,
      ),
      latestRoomAndMessageEventRecordNumber:
          lastSyncedEventRecordInfo.roomAndMessageRecordNumber,
    );
  }

  Future<ChatRoomLatestEventRecordInfo>
      getChatRoomLastSyncedEventRecordInfo() async {
    return localChatRepository.getChatRoomLatestEventRecordInfo(
      chatRoomId: chatRoomId,
    );
  }

  Future<ChatRoomLatestEventRecordInfo>
      getServerChatRoomLatestEventRecordInfo() async {
    return serverChatRepository.getChatRoomLatestEventRecordInfo(
      chatRoomId: chatRoomId,
    );
  }

  SyncState _getSyncState({
    required int latestRecordNumber,
    required int serverLatestRecordNumber,
  }) {
    if (latestRecordNumber == serverLatestRecordNumber) {
      return SyncState.synced;
    } else if (latestRecordNumber > serverLatestRecordNumber) {
      return SyncState.unsynced;
    } else {
      return SyncState.corrupted;
    }
  }

  Future<void> _syncChatRoomMessageEvent({
    required int lastSyncedEventRecordNumber,
  }) async {
    _syncChatRoomEvent(
      lastSyncedEventRecordNumber: lastSyncedEventRecordNumber,
    );
  }

  Future<void> _syncChatRoomReadEvent() async {}

  Future<void> _syncChatRoomEvent({
    required int lastSyncedEventRecordNumber,
  }) async {
    final eventsStream = _getServerEventsAfter(
      eventRecordNumber: lastSyncedEventRecordNumber,
    );

    eventsStream.listen((events) {
      for (final event in events) {
        processRecordedEvent(recordedEvent: event);
      }
    });
  }

  Stream<List<RecordedEvent>> _getServerEventsAfter({
    required int eventRecordNumber,
  }) async* {
    final eventUrls = await _getServerEventArchiveURLs(
      startEventRecordNumber: eventRecordNumber,
    );

    for (final eventUrl in eventUrls) {
      final events = await serverChatRepository.getChatRoomEventsFromUrl(
        url: eventUrl,
      );

      yield events;
    }
  }

  Future<List<String>> _getServerEventArchiveURLs({
    required int startEventRecordNumber,
  }) async {
    return serverChatRepository.getChatRoomEventArchiveUrls(
      chatRoomId: chatRoomId,
      startEventRecordNumber: startEventRecordNumber,
    );
  }

  Future<void> _updateChatRoomState({
    required SyncState currentSyncState,
    Function()? onSynced,
    Function()? onUnsynced,
    Function()? onCorrupted,
  }) async {
    switch (currentSyncState) {
      case SyncState.synced:
        onSynced?.call();
        break;
      case SyncState.unsynced:
        onUnsynced?.call();
        break;
      case SyncState.corrupted:
        onCorrupted?.call();
        break;
    }
  }
}
