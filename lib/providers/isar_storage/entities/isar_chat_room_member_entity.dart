import 'package:poc_chat_2/models/chat_room_member.dart';
import 'package:poc_chat_2/providers/isar_storage/entities/isar_rue_jai_user_entity.dart';
import 'package:isar/isar.dart';

part 'isar_chat_room_member_entity.g.dart';

@collection
@Name("ChatRoomMember")
class IsarChatRoomMemberEntity {
  Id id = Isar.autoIncrement;

  late int memberId;
  late int lastReadMessageId;

  @Enumerated(EnumType.name)
  late ChatRoomMemberRole role;

  final rueJaiUser = IsarLink<IsarRueJaiUserEntity>();
}
