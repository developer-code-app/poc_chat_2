import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:poc_chat_2/models/chat_room_member.dart';
import 'package:poc_chat_2/models/rue_jai_user.dart';

part 'rue_jai_chat_room_profile_entity.g.dart';

@JsonSerializable()
class RueJaiChatRoomProfileEntity extends Equatable {
  const RueJaiChatRoomProfileEntity({
    required this.id,
    required this.name,
    required this.members,
    required this.profileHash,
    this.thumbnailUrl,
  });

  factory RueJaiChatRoomProfileEntity.fromJson(Map<String, dynamic> json) =>
      _$RueJaiChatRoomProfileEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RueJaiChatRoomProfileEntityToJson(this);

  final int id;
  final String name;
  final String? thumbnailUrl;
  final List<RueJaiChatRoomMemberEntity> members;
  final String profileHash;

  @override
  List<Object?> get props => [
        id,
        name,
        thumbnailUrl,
        profileHash,
      ];
}

@JsonSerializable()
class RueJaiChatRoomMemberEntity extends Equatable {
  const RueJaiChatRoomMemberEntity({
    required this.id,
    required this.role,
    required this.rueJaiUser,
    required this.lastReadMessageRecordNumber,
  });

  factory RueJaiChatRoomMemberEntity.fromJson(Map<String, dynamic> json) =>
      _$RueJaiChatRoomMemberEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RueJaiChatRoomMemberEntityToJson(this);

  final int id;
  final ChatRoomMemberRole role;
  final RueJaiUserEntity rueJaiUser;
  final int lastReadMessageRecordNumber;

  @override
  List<Object?> get props => [
        id,
        role,
        rueJaiUser,
        lastReadMessageRecordNumber,
      ];
}

@JsonSerializable()
class RueJaiUserEntity extends Equatable {
  const RueJaiUserEntity({
    required this.rueJaiUserId,
    required this.rueJaiUserType,
    required this.rueJaiUserRole,
    required this.name,
    this.thumbnailUrl,
  });

  factory RueJaiUserEntity.fromJson(Map<String, dynamic> json) =>
      _$RueJaiUserEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RueJaiUserEntityToJson(this);

  final String rueJaiUserId;
  final RueJaiUserType rueJaiUserType;
  final RueJaiUserRole rueJaiUserRole;
  final String name;
  final String? thumbnailUrl;

  @override
  List<Object?> get props => [
        rueJaiUserId,
        rueJaiUserType,
        rueJaiUserRole,
        name,
        thumbnailUrl,
      ];
}
