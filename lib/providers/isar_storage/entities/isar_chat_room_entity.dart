import 'package:poc_chat_2/providers/isar_storage/entities/isar_chat_room_member_entity.dart';
import 'package:poc_chat_2/providers/isar_storage/entities/isar_confirmed_message_entity.dart';
import 'package:poc_chat_2/providers/isar_storage/entities/isar_failed_message_entity.dart';
import 'package:poc_chat_2/providers/isar_storage/entities/isar_sending_message_entity.dart';
import 'package:poc_chat_2/providers/isar_storage/entities/isar_unconfirmed_message_entity.dart';
import 'package:isar/isar.dart';

part 'isar_chat_room_entity.g.dart';

@collection
@Name("ChatRoom")
class IsarChatRoomEntity {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String roomId;

  late String name;

  late int lastSyncedRoomAndMessageEventRecordNumber;

  String? thumbnail;

  late String profileHash;

  final confirmedMessages = IsarLinks<IsarConfirmedMessageEntity>();
  final unconfirmedMessages = IsarLinks<IsarUnconfirmedMessageEntity>();
  final sendingMessages = IsarLinks<IsarSendingMessageEntity>();
  final failedMessages = IsarLinks<IsarFailedMessageEntity>();
  final members = IsarLinks<IsarChatRoomMemberEntity>();
}
