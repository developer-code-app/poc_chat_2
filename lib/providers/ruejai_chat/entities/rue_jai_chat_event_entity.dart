import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:poc_chat_2/models/chat_room_member.dart';

import 'package:poc_chat_2/models/event_type.dart';
import 'package:poc_chat_2/models/rue_jai_user.dart';

part 'rue_jai_chat_event_entity.g.dart';

@JsonSerializable(createFactory: false)
sealed class RueJaiChatEventEntity extends Equatable {
  const RueJaiChatEventEntity({
    required this.id,
    required this.owner,
    required this.createdAt,
    required this.type,
  });

  factory RueJaiChatEventEntity.fromJson(Map<String, dynamic> json) {
    final String? type = json['type'];

    if (type == null) {
      throw Exception('Event type is missing');
    }

    switch (type) {
      case "CREATE_ROOM":
        return RueJaiChatCreateRoomEventEntity.fromJson(json);
      case "UPDATE_ROOM":
        return RueJaiChatUpdateRoomEventEntity.fromJson(json);
      case "INVITE_MEMBER":
        return RueJaiChatInviteMemberEventEntity.fromJson(json);
      case "UPDATE_MEMBER_ROLE":
        return RueJaiChatUpdateMemberRoleEventEntity.fromJson(json);
      case "UNINVITE_MEMBER":
        return RueJaiChatUninviteMemberEventEntity.fromJson(json);
      case "CREATE_TEXT_MESSAGE":
        return RueJaiChatCreateTextMessageEventEntity.fromJson(json);
      case "CREATE_TEXT_REPLY_MESSAGE":
        return RueJaiChatCreateTextReplyMessageEventEntity.fromJson(json);
      case "CREATE_PHOTO_MESSAGE":
        return RueJaiChatCreatePhotoMessageEventEntity.fromJson(json);
      case "CREATE_VIDEO_MESSAGE":
        return RueJaiChatCreateVideoMessageEventEntity.fromJson(json);
      case "CREATE_FILE_MESSAGE":
        return RueJaiChatCreateFileMessageEventEntity.fromJson(json);
      case "UPDATE_TEXT_MESSAGE":
        return RueJaiChatUpdateTextMessageEventEntity.fromJson(json);
      case "DELETE_MESSAGE":
        return RueJaiChatDeleteMessageEventEntity.fromJson(json);
      default:
        throw Exception('Unknown event type: $type');
    }
  }

  Map<String, dynamic> toJson() => _$RueJaiChatEventEntityToJson(this);

  final String id;
  final RueJaiChatOwnerEntity owner;
  final DateTime createdAt;
  final EventType type;

  @override
  List<Object?> get props => [
        id,
        owner,
        createdAt,
        type,
      ];
}

@JsonSerializable()
class RueJaiChatOwnerEntity extends Equatable {
  const RueJaiChatOwnerEntity({
    required this.rueJaiUserId,
    required this.rueJaiUserType,
  });

  factory RueJaiChatOwnerEntity.fromJson(Map<String, dynamic> json) =>
      _$RueJaiChatOwnerEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RueJaiChatOwnerEntityToJson(this);

  final String rueJaiUserId;
  final RueJaiUserType rueJaiUserType;

  @override
  List<Object?> get props => [
        rueJaiUserId,
        rueJaiUserType,
      ];
}

@JsonSerializable()
class RueJaiChatCreateTextMessageEventEntity extends RueJaiChatEventEntity {
  const RueJaiChatCreateTextMessageEventEntity({
    required super.id,
    required super.owner,
    required super.createdAt,
    required super.type,
    required this.text,
  });

  factory RueJaiChatCreateTextMessageEventEntity.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$RueJaiChatCreateTextMessageEventEntityFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$RueJaiChatCreateTextMessageEventEntityToJson(this);

  final String text;

  @override
  List<Object?> get props => [
        id,
        owner,
        createdAt,
        type,
        text,
      ];
}

@JsonSerializable()
class RueJaiChatCreateTextReplyMessageEventEntity
    extends RueJaiChatEventEntity {
  const RueJaiChatCreateTextReplyMessageEventEntity({
    required super.id,
    required super.owner,
    required super.createdAt,
    required super.type,
    required this.text,
    required this.repliedMessageCreatedByEventRecordNumber,
  });

  factory RueJaiChatCreateTextReplyMessageEventEntity.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$RueJaiChatCreateTextReplyMessageEventEntityFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$RueJaiChatCreateTextReplyMessageEventEntityToJson(this);

  final String text;
  final int repliedMessageCreatedByEventRecordNumber;

  @override
  List<Object?> get props => [
        id,
        owner,
        createdAt,
        type,
        text,
        repliedMessageCreatedByEventRecordNumber,
      ];
}

@JsonSerializable()
class RueJaiChatCreatePhotoMessageEventEntity extends RueJaiChatEventEntity {
  const RueJaiChatCreatePhotoMessageEventEntity({
    required super.id,
    required super.owner,
    required super.createdAt,
    required super.type,
    required this.urls,
  });

  factory RueJaiChatCreatePhotoMessageEventEntity.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$RueJaiChatCreatePhotoMessageEventEntityFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$RueJaiChatCreatePhotoMessageEventEntityToJson(this);

  final List<String> urls;

  @override
  List<Object?> get props => [
        id,
        owner,
        createdAt,
        type,
        urls,
      ];
}

@JsonSerializable()
class RueJaiChatCreateVideoMessageEventEntity extends RueJaiChatEventEntity {
  const RueJaiChatCreateVideoMessageEventEntity({
    required super.id,
    required super.owner,
    required super.createdAt,
    required super.type,
    required this.url,
  });

  factory RueJaiChatCreateVideoMessageEventEntity.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$RueJaiChatCreateVideoMessageEventEntityFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$RueJaiChatCreateVideoMessageEventEntityToJson(this);

  final String url;

  @override
  List<Object?> get props => [
        id,
        owner,
        createdAt,
        type,
        url,
      ];
}

@JsonSerializable()
class RueJaiChatCreateFileMessageEventEntity extends RueJaiChatEventEntity {
  const RueJaiChatCreateFileMessageEventEntity({
    required super.id,
    required super.owner,
    required super.createdAt,
    required super.type,
    required this.url,
  });

  factory RueJaiChatCreateFileMessageEventEntity.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$RueJaiChatCreateFileMessageEventEntityFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$RueJaiChatCreateFileMessageEventEntityToJson(this);

  final String url;

  @override
  List<Object?> get props => [
        id,
        owner,
        createdAt,
        type,
        url,
      ];
}

@JsonSerializable()
class RueJaiChatCreateHomeCareMessageEventEntity extends RueJaiChatEventEntity {
  const RueJaiChatCreateHomeCareMessageEventEntity({
    required super.id,
    required super.owner,
    required super.createdAt,
    required super.type,
  });

  factory RueJaiChatCreateHomeCareMessageEventEntity.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$RueJaiChatCreateHomeCareMessageEventEntityFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$RueJaiChatCreateHomeCareMessageEventEntityToJson(this);

  @override
  List<Object?> get props => [
        id,
        owner,
        createdAt,
        type,
      ];
}

@JsonSerializable()
class RueJaiChatUpdateTextMessageEventEntity extends RueJaiChatEventEntity {
  const RueJaiChatUpdateTextMessageEventEntity({
    required super.id,
    required super.owner,
    required super.createdAt,
    required super.type,
    required this.updatedMessageCreatedByEventRecordNumber,
    required this.text,
  });

  factory RueJaiChatUpdateTextMessageEventEntity.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$RueJaiChatUpdateTextMessageEventEntityFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$RueJaiChatUpdateTextMessageEventEntityToJson(this);

  final int updatedMessageCreatedByEventRecordNumber;
  final String text;

  @override
  List<Object?> get props => [
        id,
        owner,
        createdAt,
        type,
        updatedMessageCreatedByEventRecordNumber,
      ];
}

@JsonSerializable()
class RueJaiChatDeleteMessageEventEntity extends RueJaiChatEventEntity {
  const RueJaiChatDeleteMessageEventEntity({
    required super.id,
    required super.owner,
    required super.createdAt,
    required super.type,
    required this.deletedMessageCreatedByEventRecordNumber,
  });

  factory RueJaiChatDeleteMessageEventEntity.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$RueJaiChatDeleteMessageEventEntityFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$RueJaiChatDeleteMessageEventEntityToJson(this);

  final int deletedMessageCreatedByEventRecordNumber;

  @override
  List<Object?> get props => [
        id,
        owner,
        createdAt,
        type,
        deletedMessageCreatedByEventRecordNumber,
      ];
}

@JsonSerializable()
class RueJaiChatCreateRoomEventEntity extends RueJaiChatEventEntity {
  const RueJaiChatCreateRoomEventEntity({
    required super.id,
    required super.owner,
    required super.createdAt,
    required super.type,
    required this.name,
    required this.members,
    this.thumbnailUrl,
  });

  factory RueJaiChatCreateRoomEventEntity.fromJson(Map<String, dynamic> json) =>
      _$RueJaiChatCreateRoomEventEntityFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$RueJaiChatCreateRoomEventEntityToJson(this);

  final String name;
  final String? thumbnailUrl;
  final List<RueJaiChatRoomMemberEventEntity> members;

  @override
  List<Object?> get props => [
        id,
        owner,
        createdAt,
        type,
        name,
        members,
        thumbnailUrl,
      ];
}

@JsonSerializable()
class RueJaiChatUpdateRoomEventEntity extends RueJaiChatEventEntity {
  const RueJaiChatUpdateRoomEventEntity({
    required super.id,
    required super.owner,
    required super.createdAt,
    required super.type,
    this.name,
    this.thumbnailUrl,
  });

  factory RueJaiChatUpdateRoomEventEntity.fromJson(Map<String, dynamic> json) =>
      _$RueJaiChatUpdateRoomEventEntityFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$RueJaiChatUpdateRoomEventEntityToJson(this);

  final String? name;
  final String? thumbnailUrl;

  @override
  List<Object?> get props => [
        id,
        owner,
        createdAt,
        type,
        name,
        thumbnailUrl,
      ];
}

@JsonSerializable()
class RueJaiChatInviteMemberEventEntity extends RueJaiChatEventEntity {
  const RueJaiChatInviteMemberEventEntity({
    required super.id,
    required super.owner,
    required super.createdAt,
    required super.type,
    required this.invitedMember,
  });

  factory RueJaiChatInviteMemberEventEntity.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$RueJaiChatInviteMemberEventEntityFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$RueJaiChatInviteMemberEventEntityToJson(this);

  final RueJaiChatRoomMemberEventEntity invitedMember;

  @override
  List<Object?> get props => [
        id,
        owner,
        createdAt,
        type,
        invitedMember,
      ];
}

@JsonSerializable()
class RueJaiChatUpdateMemberRoleEventEntity extends RueJaiChatEventEntity {
  const RueJaiChatUpdateMemberRoleEventEntity({
    required super.id,
    required super.owner,
    required super.createdAt,
    required super.type,
    required this.updatedMember,
  });

  factory RueJaiChatUpdateMemberRoleEventEntity.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$RueJaiChatUpdateMemberRoleEventEntityFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$RueJaiChatUpdateMemberRoleEventEntityToJson(this);

  final RueJaiChatRoomMemberEventEntity updatedMember;

  @override
  List<Object?> get props => [
        id,
        owner,
        createdAt,
        type,
        updatedMember,
      ];
}

@JsonSerializable()
class RueJaiChatUninviteMemberEventEntity extends RueJaiChatEventEntity {
  const RueJaiChatUninviteMemberEventEntity({
    required super.id,
    required super.owner,
    required super.createdAt,
    required super.type,
    required this.uninvitedMember,
  });

  factory RueJaiChatUninviteMemberEventEntity.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$RueJaiChatUninviteMemberEventEntityFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$RueJaiChatUninviteMemberEventEntityToJson(this);

  final RueJaiChatRoomMemberEventEntity uninvitedMember;

  @override
  List<Object?> get props => [
        id,
        owner,
        createdAt,
        type,
        uninvitedMember,
      ];
}

@JsonSerializable()
class RueJaiChatRoomMemberEventEntity extends Equatable {
  const RueJaiChatRoomMemberEventEntity({
    required this.role,
    required this.rueJaiUserId,
    required this.rueJaiUserType,
  });

  factory RueJaiChatRoomMemberEventEntity.fromJson(Map<String, dynamic> json) =>
      _$RueJaiChatRoomMemberEventEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RueJaiChatRoomMemberEventEntityToJson(this);

  final ChatRoomMemberRole role;
  final String rueJaiUserId;
  final RueJaiUserType rueJaiUserType;

  @override
  List<Object?> get props => [
        role,
        rueJaiUserId,
        rueJaiUserType,
      ];
}
