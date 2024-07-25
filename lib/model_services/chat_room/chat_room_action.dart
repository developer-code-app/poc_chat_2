import 'package:poc_chat_2/model_services/chat_room/event/recorded_event_action.dart';
import 'package:poc_chat_2/model_services/chat_room/event/unrecorded_event_action.dart';
import 'package:poc_chat_2/models/chat_room.dart';
import 'package:poc_chat_2/models/chat_room_latest_event_record_info.dart';
import 'package:poc_chat_2/models/events/event.dart';
import 'package:poc_chat_2/models/events/recorded_event.dart';
import 'package:poc_chat_2/repositories/server_chat_repository.dart';

class ChatRoomAction {
  ChatRoomAction({
    required this.chatRoomId,
  });

  final int chatRoomId;

  final _serverChatRepository = ServerChatRepository();

  Future<void> processUnrecordedEvent({
    required Event event,
  }) async {
    return ChatRoomUnrecordedEventAction(
      event: event,
      chatRoomId: chatRoomId,
    ).processEvent();
  }

  Future<void> processRecordedEvent({
    required RecordedEvent recordedEvent,
  }) async {
    return ChatRoomRecordedEventAction(
      recordedEvent: recordedEvent,
      chatRoomId: chatRoomId,
    ).processEvent();
  }

  Future<void> updateChatRoom() async {
    final chatRoomSyncState = await _getChatRoomSyncState();

    _updateChatRoomState(
      currentSyncState: chatRoomSyncState.chatRoomManagementSyncState,
      onUnsynced: () => _syncChatRoomManagementEvent(),
    );
    _updateChatRoomState(
      currentSyncState: chatRoomSyncState.messageSyncState,
      onUnsynced: () => _syncChatRoomMessageEvent(),
    );
    _syncChatRoomReadEvent();
  }

  Future<ChatRoomSyncState> _getChatRoomSyncState() async {
    final lastSyncedEventRecordInfo =
        await getChatRoomLastSyncedEventRecordInfo();
    final serverLatestEventRecordInfo =
        await getServerChatRoomLatestEventRecordInfo();

    return ChatRoomSyncState(
      messageSyncState: _getSyncState(
        latestRecordNumber: lastSyncedEventRecordInfo.messageRecordNumber,
        serverLatestRecordNumber:
            serverLatestEventRecordInfo.messageRecordNumber,
      ),
      chatRoomManagementSyncState: _getSyncState(
        latestRecordNumber:
            lastSyncedEventRecordInfo.roomManagementRecordNumber,
        serverLatestRecordNumber:
            serverLatestEventRecordInfo.roomManagementRecordNumber,
      ),
    );
  }

  Future<ChatRoomLatestEventRecordInfo>
      getServerChatRoomLatestEventRecordInfo() async {
    return _serverChatRepository.getServerChatRoomLatestEventRecordInfo(
      chatRoomId: chatRoomId,
    );
  }

  Future<ChatRoomLatestEventRecordInfo>
      getChatRoomLastSyncedEventRecordInfo() async {
    // TODO: Implement this
    return ChatRoomLatestEventRecordInfo(
      messageRecordNumber: 0,
      // readRecordNumber: 0,
      roomManagementRecordNumber: 0,
    );
  }

  Future<int> _getChatRoomNextLastSyncedEventRecordNumber() async {
    // TODO: Implement this
    return 0;
  }

  Future<List<Event>> _getServerEventsAfter({
    String? eventId,
  }) async {
    // TODO: Implement this

    return List.empty();
  }

  List<String> _getServerEventFileURLs({
    String? eventId,
  }) {
    return List.empty();
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

  Future<void> _syncChatRoomManagementEvent() async {}

  Future<void> _syncChatRoomMessageEvent() async {}

  Future<void> _syncChatRoomReadEvent() async {}

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
