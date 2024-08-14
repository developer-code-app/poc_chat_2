import 'package:poc_chat_2/models/message_type.dart';
import 'package:poc_chat_2/providers/isar_storage/entities/isar_chat_room_entity.dart';
import 'package:poc_chat_2/providers/isar_storage/entities/isar_chat_room_member_entity.dart';
import 'package:isar/isar.dart';

part 'isar_confirmed_message_entity.g.dart';

@collection
@Name('ConfirmedMessage')
class IsarConfirmedMessageEntity {
  Id id = Isar.autoIncrement;

  late DateTime createdAt;
  late DateTime updatedAt;
  late String createdByEventId;
  late byte content;

  @Enumerated(EnumType.name)
  late MessageType type;

  int? createdByRecordNumber;
  int? lastUpdatedByRecordNumber;
  DateTime? deletedAt;

  final owner = IsarLink<IsarChatRoomMemberEntity>();

  @Index()
  @Backlink(to: 'confirmedMessages')
  final room = IsarLink<IsarChatRoomEntity>();
}
