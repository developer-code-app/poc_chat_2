import 'package:poc_chat_2/models/chat_room_member.dart';
import 'package:poc_chat_2/models/messages/message.dart';
import 'package:poc_chat_2/providers/isar_storage/entities/isar_chat_room_entity.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'chat_room.g.dart';

@CopyWith()
class ChatRoom {
  const ChatRoom({
    required this.id,
    required this.name,
    required this.members,
    this.confirmedMessages = const [],
    this.failedMessages = const [],
    this.sendingMessages = const [],
    this.thumbnailUrl,
  });

  factory ChatRoom.fromIsarEntity(IsarChatRoomEntity entity) {
    return ChatRoom(
      id: entity.roomId,
      name: entity.name,
      thumbnailUrl: entity.thumbnailUrl,
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

  final String id;
  final String name;
  final String? thumbnailUrl;
  final List<ChatRoomMember> members;
  final List<Message> confirmedMessages;
  final List<Message> failedMessages;
  final List<Message> sendingMessages;
}
