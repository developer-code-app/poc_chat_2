import 'package:poc_chat_2/models/message_type.dart';
import 'package:poc_chat_2/providers/isar_storage/entities/isar_chat_room_entity.dart';
import 'package:poc_chat_2/providers/isar_storage/entities/isar_chat_room_member_entity.dart';
import 'package:isar/isar.dart';

part 'isar_unconfirmed_message_entity.g.dart';

@collection
@Name("UnconfirmedMessage")
class IsarUnconfirmedMessageEntity {
  Id id = Isar.autoIncrement;

  @Enumerated(EnumType.name)
  late MessageType type;

  late byte content;

  @Index(unique: true)
  late String createdByEventId;

  @Index(unique: true)
  int? createdByRecordNumber;

  int? lastUpdatedByRecordNumber;

  late DateTime createdAt;

  late DateTime updatedAt;

  DateTime? deletedAt;

  final owner = IsarLink<IsarChatRoomMemberEntity>();

  @Index()
  @Backlink(to: 'unconfirmedMessages')
  final room = IsarLink<IsarChatRoomEntity>();
}
