import 'package:poc_chat_2/providers/isar_storage/entities/isar_rue_jai_user_entity.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'rue_jai_user.g.dart';

enum RueJaiUserType {
  rueJaiAdmin,
  rueJaiAppUser;
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
    required this.id,
    required this.rueJaiUserId,
    required this.rueJaiUserType,
    required this.rueJaiUserRole,
    required this.name,
    required this.thumbnailUrl,
  });

  factory RueJaiUser.fromEntity(IsarRueJaiUserEntity entity) {
    return RueJaiUser(
      id: entity.id,
      rueJaiUserId: entity.rueJaiUserId,
      rueJaiUserType: entity.type,
      rueJaiUserRole: entity.role,
      name: entity.name,
      thumbnailUrl: entity.thumbnailUrl,
    );
  }

  final int id;
  final String rueJaiUserId;
  final RueJaiUserType rueJaiUserType;
  final RueJaiUserRole rueJaiUserRole;
  final String name;
  final String thumbnailUrl;
}
