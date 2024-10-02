import 'package:poc_chat_2/providers/isar_storage/entities/isar_chat_room_entity.dart';
import 'package:poc_chat_2/providers/ruejai_chat/entities/rue_jai_chat_room_state_entity.dart';

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

  factory ChatRoomState.fromEntity(RueJaiChatRoomStateEntity entity) {
    return ChatRoomState(
      id: entity.id,
      profileHash: entity.profileHash,
      latestRoomAndMessageEventRecordNumber:
          entity.latestRoomAndMessageEventRecordNumber,
    );
  }

  final String id;
  final String profileHash;
  final int latestRoomAndMessageEventRecordNumber;
}
