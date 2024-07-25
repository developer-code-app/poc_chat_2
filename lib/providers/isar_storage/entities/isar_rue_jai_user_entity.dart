import 'package:poc_chat_2/models/rue_jai_user.dart';
import 'package:poc_chat_2/providers/isar_storage/entities/isar_chat_room_member_entity.dart';
import 'package:isar/isar.dart';

part 'isar_rue_jai_user_entity.g.dart';

@collection
@Name('RueJaiUser')
class IsarRueJaiUserEntity {
  Id id = Isar.autoIncrement;

  late String rueJaiUserId;
  late String name;
  late String thumbnailUrl;

  @Enumerated(EnumType.name)
  late RueJaiUserType type;

  @Enumerated(EnumType.name)
  late RueJaiUserRole role;

  @Backlink(to: 'rueJaiUser')
  final member = IsarLinks<IsarChatRoomMemberEntity>();
}
