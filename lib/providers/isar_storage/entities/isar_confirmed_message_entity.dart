import 'package:poc_chat_2/models/messages/message_type.dart';
import 'package:poc_chat_2/providers/isar_storage/entities/isar_chat_room_entity.dart';
import 'package:poc_chat_2/providers/isar_storage/entities/isar_chat_room_member_entity.dart';
import 'package:isar/isar.dart';

part 'isar_confirmed_message_entity.g.dart';

@collection
@Name('ConfirmedMessage')
class IsarConfirmedMessageEntity {
  Id id = Isar.autoIncrement;

  @Enumerated(EnumType.name)
  late MessageType type;

  List<byte>? content;

  @Index(unique: true)
  late String createdByEventId;

  late DateTime createdAt;

  late DateTime updatedAt;

  int? createdByRecordNumber;

  int? lastUpdatedByRecordNumber;

  DateTime? deletedAt;

  final owner = IsarLink<IsarChatRoomMemberEntity>();

  @Index()
  @Backlink(to: 'confirmedMessages')
  final room = IsarLink<IsarChatRoomEntity>();
}
