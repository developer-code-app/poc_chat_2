import 'package:json_annotation/json_annotation.dart';
import 'package:poc_chat_2/models/chat_room_member.dart';
import 'package:poc_chat_2/models/event_type.dart';
import 'package:poc_chat_2/models/rue_jai_user.dart';

part 'rue_jai_chat_event_entity.g.dart';

sealed class RueJaiChatBaseEventEntity {}

@JsonSerializable(createFactory: false)
class RueJaiChatEventEntity extends RueJaiChatBaseEventEntity {
  RueJaiChatEventEntity({
    required this.id,
    required this.owner,
    required this.createdAt,
    required this.type,
  });

  factory RueJaiChatEventEntity.fromJson(Map<String, dynamic> json) {
    final eventEntity = RueJaiChatEventEntity.fromJson(json);

    switch (eventEntity.type) {
      case EventType.createTextMessage:
        return RueJaiChatCreateTextMessageEventEntity.fromJson(json);
      case EventType.createTextReplyMessage:
        return RueJaiChatCreateTextReplyMessageEventEntity.fromJson(json);
      case EventType.createPhotoMessage:
        return RueJaiChatCreatePhotoMessageEventEntity.fromJson(json);
      case EventType.createVideoMessage:
        return RueJaiChatCreateVideoMessageEventEntity.fromJson(json);
      case EventType.createFileMessage:
        return RueJaiChatCreateFileMessageEventEntity.fromJson(json);
      case EventType.createHomeCareMessage:
        return RueJaiChatCreateHomeCareMessageEventEntity.fromJson(json);
      case EventType.textEdited:
        return RueJaiChatTextEditedEventEntity.fromJson(json);
      case EventType.deleteMessage:
        return RueJaiChatDeleteMessageEventEntity.fromJson(json);
      case EventType.readMessage:
        return RueJaiChatReadMessageEventEntity.fromJson(json);
      case EventType.createRoom:
        return RueJaiChatCreateRoomEventEntity.fromJson(json);
      case EventType.roleEdited:
        return RueJaiChatRoleEditedEventEntity.fromJson(json);
      case EventType.invite:
        return RueJaiChatInviteEventEntity.fromJson(json);
      case EventType.reject:
        return RueJaiChatRejectEventEntity.fromJson(json);
    }
  }

  Map<String, dynamic> toJson() => _$RueJaiChatEventEntityToJson(this);

  final String id;
  final RueJaiChatOwnerEntity owner;
  final DateTime createdAt;
  final EventType type;
}

@JsonSerializable()
class RueJaiChatOwnerEntity {
  RueJaiChatOwnerEntity({
    required this.rueJaiUserId,
    required this.rueJaiUserType,
  });

  factory RueJaiChatOwnerEntity.fromJson(Map<String, dynamic> json) =>
      _$RueJaiChatOwnerEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RueJaiChatOwnerEntityToJson(this);

  final String rueJaiUserId;
  final RueJaiUserType rueJaiUserType;
}

@JsonSerializable()
class RueJaiChatCreateTextMessageEventEntity extends RueJaiChatEventEntity {
  RueJaiChatCreateTextMessageEventEntity({
    required super.id,
    required super.owner,
    required super.createdAt,
    required super.type,
  });

  factory RueJaiChatCreateTextMessageEventEntity.fromJson(
          Map<String, dynamic> json) =>
      _$RueJaiChatCreateTextMessageEventEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RueJaiChatCreateTextMessageEventEntityToJson(this);
}

@JsonSerializable()
class RueJaiChatCreateTextReplyMessageEventEntity
    extends RueJaiChatEventEntity {
  RueJaiChatCreateTextReplyMessageEventEntity({
    required super.id,
    required super.owner,
    required super.createdAt,
    required super.type,
    required this.repliedMessageAddedByEventRecordNumber,
  });

  factory RueJaiChatCreateTextReplyMessageEventEntity.fromJson(
          Map<String, dynamic> json) =>
      _$RueJaiChatCreateTextReplyMessageEventEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RueJaiChatCreateTextReplyMessageEventEntityToJson(this);

  final int repliedMessageAddedByEventRecordNumber;
}

@JsonSerializable()
class RueJaiChatCreatePhotoMessageEventEntity extends RueJaiChatEventEntity {
  RueJaiChatCreatePhotoMessageEventEntity({
    required super.id,
    required super.owner,
    required super.createdAt,
    required super.type,
  });

  factory RueJaiChatCreatePhotoMessageEventEntity.fromJson(
          Map<String, dynamic> json) =>
      _$RueJaiChatCreatePhotoMessageEventEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RueJaiChatCreatePhotoMessageEventEntityToJson(this);
}

@JsonSerializable()
class RueJaiChatCreateVideoMessageEventEntity extends RueJaiChatEventEntity {
  RueJaiChatCreateVideoMessageEventEntity({
    required super.id,
    required super.owner,
    required super.createdAt,
    required super.type,
  });

  factory RueJaiChatCreateVideoMessageEventEntity.fromJson(
          Map<String, dynamic> json) =>
      _$RueJaiChatCreateVideoMessageEventEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RueJaiChatCreateVideoMessageEventEntityToJson(this);
}

@JsonSerializable()
class RueJaiChatCreateFileMessageEventEntity extends RueJaiChatEventEntity {
  RueJaiChatCreateFileMessageEventEntity({
    required super.id,
    required super.owner,
    required super.createdAt,
    required super.type,
  });

  factory RueJaiChatCreateFileMessageEventEntity.fromJson(
          Map<String, dynamic> json) =>
      _$RueJaiChatCreateFileMessageEventEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RueJaiChatCreateFileMessageEventEntityToJson(this);
}

@JsonSerializable()
class RueJaiChatCreateHomeCareMessageEventEntity extends RueJaiChatEventEntity {
  RueJaiChatCreateHomeCareMessageEventEntity({
    required super.id,
    required super.owner,
    required super.createdAt,
    required super.type,
  });

  factory RueJaiChatCreateHomeCareMessageEventEntity.fromJson(
          Map<String, dynamic> json) =>
      _$RueJaiChatCreateHomeCareMessageEventEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RueJaiChatCreateHomeCareMessageEventEntityToJson(this);
}

@JsonSerializable()
class RueJaiChatTextEditedEventEntity extends RueJaiChatEventEntity {
  RueJaiChatTextEditedEventEntity({
    required super.id,
    required super.owner,
    required super.createdAt,
    required super.type,
    required this.updatedMessageRecordNumber,
  });

  factory RueJaiChatTextEditedEventEntity.fromJson(Map<String, dynamic> json) =>
      _$RueJaiChatTextEditedEventEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RueJaiChatTextEditedEventEntityToJson(this);

  final int updatedMessageRecordNumber;
}

@JsonSerializable()
class RueJaiChatDeleteMessageEventEntity extends RueJaiChatEventEntity {
  RueJaiChatDeleteMessageEventEntity({
    required super.id,
    required super.owner,
    required super.createdAt,
    required super.type,
    required this.deletedMessageRecordNumber,
  });

  factory RueJaiChatDeleteMessageEventEntity.fromJson(
          Map<String, dynamic> json) =>
      _$RueJaiChatDeleteMessageEventEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RueJaiChatDeleteMessageEventEntityToJson(this);

  final int deletedMessageRecordNumber;
}

@JsonSerializable()
class RueJaiChatReadMessageEventEntity extends RueJaiChatEventEntity {
  RueJaiChatReadMessageEventEntity({
    required super.id,
    required super.owner,
    required super.createdAt,
    required super.type,
    required this.readMessageRecordNumber,
  });

  factory RueJaiChatReadMessageEventEntity.fromJson(
          Map<String, dynamic> json) =>
      _$RueJaiChatReadMessageEventEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RueJaiChatReadMessageEventEntityToJson(this);

  final int readMessageRecordNumber;
}

@JsonSerializable()
class RueJaiChatCreateRoomEventEntity extends RueJaiChatEventEntity {
  RueJaiChatCreateRoomEventEntity({
    required super.id,
    required super.owner,
    required super.createdAt,
    required super.type,
    required this.roomId,
    required this.name,
    required this.members,
    this.thumbnailUrl,
  });

  factory RueJaiChatCreateRoomEventEntity.fromJson(Map<String, dynamic> json) =>
      _$RueJaiChatCreateRoomEventEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RueJaiChatCreateRoomEventEntityToJson(this);

  final String roomId;
  final String name;
  final String? thumbnailUrl;
  final List<RueJaiChatMemberEventEntity> members;
}

@JsonSerializable()
class RueJaiChatRoleEditedEventEntity extends RueJaiChatEventEntity {
  RueJaiChatRoleEditedEventEntity({
    required super.id,
    required super.owner,
    required super.createdAt,
    required super.type,
    required this.updatedMemberRecordNumber,
    required this.memberRole,
  });

  factory RueJaiChatRoleEditedEventEntity.fromJson(Map<String, dynamic> json) =>
      _$RueJaiChatRoleEditedEventEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RueJaiChatRoleEditedEventEntityToJson(this);

  final int updatedMemberRecordNumber;
  final ChatRoomMemberRole memberRole;
}

@JsonSerializable()
class RueJaiChatInviteEventEntity extends RueJaiChatEventEntity {
  RueJaiChatInviteEventEntity({
    required super.id,
    required super.owner,
    required super.createdAt,
    required super.type,
    required this.member,
  });

  factory RueJaiChatInviteEventEntity.fromJson(Map<String, dynamic> json) =>
      _$RueJaiChatInviteEventEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RueJaiChatInviteEventEntityToJson(this);

  final RueJaiChatMemberEventEntity member;
}

@JsonSerializable()
class RueJaiChatRejectEventEntity extends RueJaiChatEventEntity {
  RueJaiChatRejectEventEntity({
    required super.id,
    required super.owner,
    required super.createdAt,
    required super.type,
    required this.removedMemberRecordNumber,
  });

  factory RueJaiChatRejectEventEntity.fromJson(Map<String, dynamic> json) =>
      _$RueJaiChatRejectEventEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RueJaiChatRejectEventEntityToJson(this);

  final int removedMemberRecordNumber;
}

@JsonSerializable()
class RueJaiChatMemberEventEntity {
  RueJaiChatMemberEventEntity({
    required this.role,
    required this.rueJaiUserId,
    required this.rueJaiUserType,
  });

  factory RueJaiChatMemberEventEntity.fromJson(Map<String, dynamic> json) =>
      _$RueJaiChatMemberEventEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RueJaiChatMemberEventEntityToJson(this);

  final ChatRoomMemberRole role;
  final String rueJaiUserId;
  final RueJaiUserType rueJaiUserType;
}
