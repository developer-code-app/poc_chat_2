import 'package:poc_chat_2/models/message_type.dart';
import 'package:poc_chat_2/providers/isar_storage/entities/isar_chat_room_entity.dart';
import 'package:poc_chat_2/providers/isar_storage/entities/isar_chat_room_member_entity.dart';
import 'package:isar/isar.dart';

part 'isar_failed_message_entity.g.dart';

@collection
@Name('FailedMessage')
class IsarFailedMessageEntity {
  Id id = Isar.autoIncrement;

  late DateTime createdAt;

  late DateTime updatedAt;

  @Index(unique: true)
  late String createdByEventId;

  late List<byte> content;

  @Enumerated(EnumType.name)
  late MessageType type;

  DateTime? deletedAt;

  final owner = IsarLink<IsarChatRoomMemberEntity>();

  @Backlink(to: 'failedMessages')
  final room = IsarLink<IsarChatRoomEntity>();
}
