import 'package:poc_chat_2/models/chat_room_member.dart';
import 'package:poc_chat_2/models/message.dart';
import 'package:poc_chat_2/providers/isar_storage/entities/isar_chat_room_entity.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'chat_room.g.dart';

class ChatRoomSyncState {
  ChatRoomSyncState({
    required this.messageSyncState,
    required this.chatRoomManagementSyncState,
  });

  final SyncState messageSyncState;
  final SyncState chatRoomManagementSyncState;
}

enum SyncState {
  synced,
  unsynced,
  corrupted,
}

@CopyWith()
class ChatRoom {
  ChatRoom({
    required this.id,
    required this.name,
    required this.thumbnailUrl,
    required this.members,
    required this.confirmedMessages,
    required this.failedMessages,
    required this.sendingMessages,
  });

  factory ChatRoom.fromEntity(IsarChatRoomEntity entity) {
    return ChatRoom(
      id: entity.roomId,
      name: entity.name,
      thumbnailUrl: entity.thumbnail,
      members: entity.members.map(ChatRoomMember.fromEntity).toList(),
      confirmedMessages: entity.confirmedMessages
          .map(Message.fromConfirmedMessageEntity)
          .toList(),
      failedMessages:
          entity.failedMessages.map(Message.fromFailedMessageEntity).toList(),
      sendingMessages:
          entity.sendingMessages.map(Message.fromSendingMessageEntity).toList(),
    );
  }

  factory ChatRoom.createChatRoom(int id) {
    return ChatRoom(
      id: id,
      name: '',
      thumbnailUrl: '',
      members: [],
      confirmedMessages: [],
      failedMessages: [],
      sendingMessages: [],
    );
  }

  final int id;
  final String name;
  final String thumbnailUrl;
  final List<ChatRoomMember> members;
  final List<Message> confirmedMessages;
  final List<Message> failedMessages;
  final List<Message> sendingMessages;
}
