import 'package:json_annotation/json_annotation.dart';
import 'package:poc_chat_2/providers/isar_storage/entities/isar_rue_jai_user_entity.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:poc_chat_2/providers/ruejai_chat/entities/rue_jai_chat_room_profile_entity.dart';

part 'rue_jai_user.g.dart';

enum RueJaiUserType {
  @JsonValue('RUE_JAI_ADMIN')
  rueJaiAdmin,
  @JsonValue('RUE_JAI_APP_USER')
  rueJaiAppUser,
}

enum RueJaiUserRole {
  homeOwner,
  resident,
  renter,
  customerService,
}

@CopyWith()
class RueJaiUser {
  RueJaiUser({
    required this.rueJaiUserId,
    required this.rueJaiUserType,
    required this.rueJaiUserRole,
    required this.name,
    this.thumbnailUrl,
  });

  factory RueJaiUser.fromEntity(RueJaiUserEntity entity) {
    return RueJaiUser(
      rueJaiUserId: entity.rueJaiUserId,
      rueJaiUserType: entity.rueJaiUserType,
      rueJaiUserRole: entity.rueJaiUserRole,
      name: entity.name,
      thumbnailUrl: entity.thumbnailUrl,
    );
  }

  factory RueJaiUser.fromIsarEntity(IsarRueJaiUserEntity entity) {
    return RueJaiUser(
      rueJaiUserId: entity.rueJaiUserId,
      rueJaiUserType: entity.type,
      rueJaiUserRole: entity.role,
      name: entity.name,
      thumbnailUrl: entity.thumbnailUrl,
    );
  }

  final String rueJaiUserId;
  final RueJaiUserType rueJaiUserType;
  final RueJaiUserRole rueJaiUserRole;
  final String name;
  final String? thumbnailUrl;
}
