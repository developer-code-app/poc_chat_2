import 'package:poc_chat_2/models/chat_room_member.dart';
import 'package:poc_chat_2/models/messages/message.dart';
import 'package:poc_chat_2/providers/isar_storage/entities/isar_chat_room_entity.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:poc_chat_2/providers/ruejai_chat/entities/rue_jai_chat_room_entity.dart';

part 'chat_room.g.dart';

class ChatRoomSyncState {
  ChatRoomSyncState({
    required this.roomAndMessageEventSyncState,
    required this.latestRoomAndMessageEventRecordNumber,
  });

  final SyncState roomAndMessageEventSyncState;
  final int latestRoomAndMessageEventRecordNumber;
}

enum SyncState {
  synced,
  unsynced,
  corrupted,
}

@CopyWith()
class ChatRoom {
  const ChatRoom({
    required this.id,
    required this.name,
    required this.members,
    required this.confirmedMessages,
    required this.failedMessages,
    required this.sendingMessages,
    this.thumbnailUrl,
  });

  factory ChatRoom.fromEntity(RueJaiChatRoomEntity entity) {
    return ChatRoom(
      id: entity.id,
      name: entity.name,
      thumbnailUrl: entity.thumbnailUrl,
      members: const [],
      confirmedMessages: const [],
      failedMessages: const [],
      sendingMessages: const [],
    );
  }

  factory ChatRoom.fromIsarEntity(IsarChatRoomEntity entity) {
    return ChatRoom(
      id: entity.roomId,
      name: entity.name,
      thumbnailUrl: entity.thumbnail,
      members: entity.members.map(ChatRoomMember.fromIsarEntity).toList(),
      confirmedMessages: entity.confirmedMessages
          .map(Message.fromConfirmedMessageEntity)
          .toList(),
      failedMessages:
          entity.failedMessages.map(Message.fromFailedMessageEntity).toList(),
      sendingMessages:
          entity.sendingMessages.map(Message.fromSendingMessageEntity).toList(),
    );
  }

  final int id;
  final String name;
  final String? thumbnailUrl;
  final List<ChatRoomMember> members;
  final List<Message> confirmedMessages;
  final List<Message> failedMessages;
  final List<Message> sendingMessages;
}
