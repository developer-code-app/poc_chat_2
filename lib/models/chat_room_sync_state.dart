import 'dart:async';

import 'package:poc_chat_2/providers/isar_storage/entities/isar_chat_room_entity.dart';
import 'package:poc_chat_2/providers/ruejai_chat/entities/rue_jai_chat_room_state_entity.dart';

class ChatRoomSyncState {
  ChatRoomSyncState._({
    required this.chatRoomState,
    required this.serverChatRoomState,
  });

  factory ChatRoomSyncState.fromState({
    required ChatRoomState chatRoomState,
    required ServerChatRoomState serverChatRoomState,
  }) {
    if (chatRoomState.id != serverChatRoomState.id) throw Exception('');

    return ChatRoomSyncState._(
      chatRoomState: chatRoomState,
      serverChatRoomState: serverChatRoomState,
    );
  }

  final ChatRoomState chatRoomState;
  final ServerChatRoomState serverChatRoomState;

  String get roomId {
    return chatRoomState.id;
  }

  Future chatRoomProfileSyncState({
    Future Function()? onSynced,
    Future Function(ChatRoomState)? onUnsynced,
    Future Function()? onCorrupted,
  }) async {
    await _updateChatRoomState(
      currentSyncState: _profileSyncState,
      onSynced: onSynced,
      onUnsynced: onUnsynced,
      onCorrupted: onCorrupted,
    );
  }

  Future roomAndMessageEventSyncState({
    Future Function()? onSynced,
    Future Function(ChatRoomState)? onUnsynced,
    Future Function()? onCorrupted,
  }) async {
    await _updateChatRoomState(
      currentSyncState: _roomAndMessageEventSyncState,
      onSynced: onSynced,
      onUnsynced: onUnsynced,
      onCorrupted: onCorrupted,
    );
  }

  SyncState get _profileSyncState {
    return (chatRoomState.profileHash == serverChatRoomState.profileHash)
        ? SyncState.synced
        : SyncState.unsynced;
  }

  SyncState get _roomAndMessageEventSyncState {
    final latestRecordNumber =
        chatRoomState.latestRoomAndMessageEventRecordNumber;
    final serverLatestRecordNumber =
        serverChatRoomState.latestRoomAndMessageEventRecordNumber;

    if (latestRecordNumber == serverLatestRecordNumber) {
      return SyncState.synced;
    } else if (latestRecordNumber < serverLatestRecordNumber) {
      return SyncState.unsynced;
    } else {
      return SyncState.corrupted;
    }
  }

  Future _updateChatRoomState({
    required SyncState currentSyncState,
    Future Function()? onSynced,
    Future Function(ChatRoomState)? onUnsynced,
    Future Function()? onCorrupted,
  }) async {
    switch (currentSyncState) {
      case SyncState.synced:
        return onSynced?.call();
      case SyncState.unsynced:
        return onUnsynced?.call(chatRoomState);
      case SyncState.corrupted:
        return onCorrupted?.call();
    }
  }
}

class ChatRoomState {
  ChatRoomState({
    required this.id,
    required this.profileHash,
    required this.latestRoomAndMessageEventRecordNumber,
  });

  factory ChatRoomState.fromIsarEntity(IsarChatRoomEntity entity) {
    return ChatRoomState(
      id: entity.roomId,
      profileHash: entity.profileHash,
      latestRoomAndMessageEventRecordNumber:
          entity.lastSyncedRoomAndMessageEventRecordNumber,
    );
  }

  final String id;
  final String profileHash;
  final int latestRoomAndMessageEventRecordNumber;
}

class ServerChatRoomState {
  ServerChatRoomState({
    required this.id,
    required this.profileHash,
    required this.latestRoomAndMessageEventRecordNumber,
  });

  factory ServerChatRoomState.fromEntity(RueJaiChatRoomStateEntity entity) {
    return ServerChatRoomState(
      id: entity.id.toString(),
      profileHash: entity.profileHash,
      latestRoomAndMessageEventRecordNumber:
          entity.latestRoomAndMessageEventRecordNumber,
    );
  }

  final String id;
  final String profileHash;
  final int latestRoomAndMessageEventRecordNumber;
}

enum SyncState {
  synced,
  unsynced,
  corrupted,
}
