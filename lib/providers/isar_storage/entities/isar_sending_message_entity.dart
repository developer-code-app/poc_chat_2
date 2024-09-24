import 'package:poc_chat_2/models/message_type.dart';
import 'package:poc_chat_2/providers/isar_storage/entities/isar_chat_room_entity.dart';
import 'package:poc_chat_2/providers/isar_storage/entities/isar_chat_room_member_entity.dart';
import 'package:isar/isar.dart';

part 'isar_sending_message_entity.g.dart';

@collection
@Name("SendingMessage")
class IsarSendingMessageEntity {
  Id id = Isar.autoIncrement;

  late DateTime createdAt;
  late DateTime updatedAt;
  late String createdByEventId;
  late List<byte> content;

  @Enumerated(EnumType.name)
  late MessageType type;

  DateTime? deletedAt;

  final owner = IsarLink<IsarChatRoomMemberEntity>();

  @Index(type: IndexType.value)
  @Backlink(to: 'sendingMessages')
  final room = IsarLink<IsarChatRoomEntity>();
}
