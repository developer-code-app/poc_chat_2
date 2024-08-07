// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rue_jai_chat_event_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$RueJaiChatEventEntityToJson(
        RueJaiChatEventEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner': instance.owner,
      'createdAt': instance.createdAt.toIso8601String(),
      'type': _$EventTypeEnumMap[instance.type]!,
    };

const _$EventTypeEnumMap = {
  EventType.createTextMessage: 'CREATE_TEXT_MESSAGE',
  EventType.createTextReplyMessage: 'CREATE_TEXT_REPLY_MESSAGE',
  EventType.createPhotoMessage: 'CREATE_PHOTO_MESSAGE',
  EventType.createVideoMessage: 'CREATE_VIDEO_MESSAGE',
  EventType.createFileMessage: 'CREATE_FILE_MESSAGE',
  EventType.createHomeCareMessage: 'CREATE_HOME_CARE_MESSAGE',
  EventType.textEdited: 'TEXT_EDITED',
  EventType.deleteMessage: 'DELETE_MESSAGE',
  EventType.readMessage: 'READ_MESSAGE',
  EventType.createRoom: 'CREATE_ROOM',
  EventType.roleEdited: 'ROLE_EDITED',
  EventType.invite: 'INVITE',
  EventType.reject: 'REJECT',
};

RueJaiChatOwnerEntity _$RueJaiChatOwnerEntityFromJson(
        Map<String, dynamic> json) =>
    RueJaiChatOwnerEntity(
      rueJaiUserId: json['rueJaiUserId'] as String,
      rueJaiUserType:
          $enumDecode(_$RueJaiUserTypeEnumMap, json['rueJaiUserType']),
    );

Map<String, dynamic> _$RueJaiChatOwnerEntityToJson(
        RueJaiChatOwnerEntity instance) =>
    <String, dynamic>{
      'rueJaiUserId': instance.rueJaiUserId,
      'rueJaiUserType': _$RueJaiUserTypeEnumMap[instance.rueJaiUserType]!,
    };

const _$RueJaiUserTypeEnumMap = {
  RueJaiUserType.rueJaiAdmin: 'RUE_JAI_ADMIN',
  RueJaiUserType.rueJaiAppUser: 'RUE_JAI_APP_USER',
};

RueJaiChatCreateTextMessageEventEntity
    _$RueJaiChatCreateTextMessageEventEntityFromJson(
            Map<String, dynamic> json) =>
        RueJaiChatCreateTextMessageEventEntity(
          id: json['id'] as String,
          owner: RueJaiChatOwnerEntity.fromJson(
              json['owner'] as Map<String, dynamic>),
          createdAt: DateTime.parse(json['createdAt'] as String),
          type: $enumDecode(_$EventTypeEnumMap, json['type']),
        );

Map<String, dynamic> _$RueJaiChatCreateTextMessageEventEntityToJson(
        RueJaiChatCreateTextMessageEventEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner': instance.owner,
      'createdAt': instance.createdAt.toIso8601String(),
      'type': _$EventTypeEnumMap[instance.type]!,
    };

RueJaiChatCreateTextReplyMessageEventEntity
    _$RueJaiChatCreateTextReplyMessageEventEntityFromJson(
            Map<String, dynamic> json) =>
        RueJaiChatCreateTextReplyMessageEventEntity(
          id: json['id'] as String,
          owner: RueJaiChatOwnerEntity.fromJson(
              json['owner'] as Map<String, dynamic>),
          createdAt: DateTime.parse(json['createdAt'] as String),
          type: $enumDecode(_$EventTypeEnumMap, json['type']),
          repliedMessageAddedByEventRecordNumber:
              (json['repliedMessageAddedByEventRecordNumber'] as num).toInt(),
        );

Map<String, dynamic> _$RueJaiChatCreateTextReplyMessageEventEntityToJson(
        RueJaiChatCreateTextReplyMessageEventEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner': instance.owner,
      'createdAt': instance.createdAt.toIso8601String(),
      'type': _$EventTypeEnumMap[instance.type]!,
      'repliedMessageAddedByEventRecordNumber':
          instance.repliedMessageAddedByEventRecordNumber,
    };

RueJaiChatCreatePhotoMessageEventEntity
    _$RueJaiChatCreatePhotoMessageEventEntityFromJson(
            Map<String, dynamic> json) =>
        RueJaiChatCreatePhotoMessageEventEntity(
          id: json['id'] as String,
          owner: RueJaiChatOwnerEntity.fromJson(
              json['owner'] as Map<String, dynamic>),
          createdAt: DateTime.parse(json['createdAt'] as String),
          type: $enumDecode(_$EventTypeEnumMap, json['type']),
        );

Map<String, dynamic> _$RueJaiChatCreatePhotoMessageEventEntityToJson(
        RueJaiChatCreatePhotoMessageEventEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner': instance.owner,
      'createdAt': instance.createdAt.toIso8601String(),
      'type': _$EventTypeEnumMap[instance.type]!,
    };

RueJaiChatCreateVideoMessageEventEntity
    _$RueJaiChatCreateVideoMessageEventEntityFromJson(
            Map<String, dynamic> json) =>
        RueJaiChatCreateVideoMessageEventEntity(
          id: json['id'] as String,
          owner: RueJaiChatOwnerEntity.fromJson(
              json['owner'] as Map<String, dynamic>),
          createdAt: DateTime.parse(json['createdAt'] as String),
          type: $enumDecode(_$EventTypeEnumMap, json['type']),
        );

Map<String, dynamic> _$RueJaiChatCreateVideoMessageEventEntityToJson(
        RueJaiChatCreateVideoMessageEventEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner': instance.owner,
      'createdAt': instance.createdAt.toIso8601String(),
      'type': _$EventTypeEnumMap[instance.type]!,
    };

RueJaiChatCreateFileMessageEventEntity
    _$RueJaiChatCreateFileMessageEventEntityFromJson(
            Map<String, dynamic> json) =>
        RueJaiChatCreateFileMessageEventEntity(
          id: json['id'] as String,
          owner: RueJaiChatOwnerEntity.fromJson(
              json['owner'] as Map<String, dynamic>),
          createdAt: DateTime.parse(json['createdAt'] as String),
          type: $enumDecode(_$EventTypeEnumMap, json['type']),
        );

Map<String, dynamic> _$RueJaiChatCreateFileMessageEventEntityToJson(
        RueJaiChatCreateFileMessageEventEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner': instance.owner,
      'createdAt': instance.createdAt.toIso8601String(),
      'type': _$EventTypeEnumMap[instance.type]!,
    };

RueJaiChatCreateHomeCareMessageEventEntity
    _$RueJaiChatCreateHomeCareMessageEventEntityFromJson(
            Map<String, dynamic> json) =>
        RueJaiChatCreateHomeCareMessageEventEntity(
          id: json['id'] as String,
          owner: RueJaiChatOwnerEntity.fromJson(
              json['owner'] as Map<String, dynamic>),
          createdAt: DateTime.parse(json['createdAt'] as String),
          type: $enumDecode(_$EventTypeEnumMap, json['type']),
        );

Map<String, dynamic> _$RueJaiChatCreateHomeCareMessageEventEntityToJson(
        RueJaiChatCreateHomeCareMessageEventEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner': instance.owner,
      'createdAt': instance.createdAt.toIso8601String(),
      'type': _$EventTypeEnumMap[instance.type]!,
    };

RueJaiChatTextEditedEventEntity _$RueJaiChatTextEditedEventEntityFromJson(
        Map<String, dynamic> json) =>
    RueJaiChatTextEditedEventEntity(
      id: json['id'] as String,
      owner:
          RueJaiChatOwnerEntity.fromJson(json['owner'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
      type: $enumDecode(_$EventTypeEnumMap, json['type']),
      updatedMessageRecordNumber:
          (json['updatedMessageRecordNumber'] as num).toInt(),
    );

Map<String, dynamic> _$RueJaiChatTextEditedEventEntityToJson(
        RueJaiChatTextEditedEventEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner': instance.owner,
      'createdAt': instance.createdAt.toIso8601String(),
      'type': _$EventTypeEnumMap[instance.type]!,
      'updatedMessageRecordNumber': instance.updatedMessageRecordNumber,
    };

RueJaiChatDeleteMessageEventEntity _$RueJaiChatDeleteMessageEventEntityFromJson(
        Map<String, dynamic> json) =>
    RueJaiChatDeleteMessageEventEntity(
      id: json['id'] as String,
      owner:
          RueJaiChatOwnerEntity.fromJson(json['owner'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
      type: $enumDecode(_$EventTypeEnumMap, json['type']),
      deletedMessageRecordNumber:
          (json['deletedMessageRecordNumber'] as num).toInt(),
    );

Map<String, dynamic> _$RueJaiChatDeleteMessageEventEntityToJson(
        RueJaiChatDeleteMessageEventEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner': instance.owner,
      'createdAt': instance.createdAt.toIso8601String(),
      'type': _$EventTypeEnumMap[instance.type]!,
      'deletedMessageRecordNumber': instance.deletedMessageRecordNumber,
    };

RueJaiChatReadMessageEventEntity _$RueJaiChatReadMessageEventEntityFromJson(
        Map<String, dynamic> json) =>
    RueJaiChatReadMessageEventEntity(
      id: json['id'] as String,
      owner:
          RueJaiChatOwnerEntity.fromJson(json['owner'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
      type: $enumDecode(_$EventTypeEnumMap, json['type']),
      readMessageRecordNumber: (json['readMessageRecordNumber'] as num).toInt(),
    );

Map<String, dynamic> _$RueJaiChatReadMessageEventEntityToJson(
        RueJaiChatReadMessageEventEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner': instance.owner,
      'createdAt': instance.createdAt.toIso8601String(),
      'type': _$EventTypeEnumMap[instance.type]!,
      'readMessageRecordNumber': instance.readMessageRecordNumber,
    };

RueJaiChatCreateRoomEventEntity _$RueJaiChatCreateRoomEventEntityFromJson(
        Map<String, dynamic> json) =>
    RueJaiChatCreateRoomEventEntity(
      id: json['id'] as String,
      owner:
          RueJaiChatOwnerEntity.fromJson(json['owner'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
      type: $enumDecode(_$EventTypeEnumMap, json['type']),
      roomId: json['roomId'] as String,
      name: json['name'] as String,
      members: (json['members'] as List<dynamic>)
          .map((e) =>
              RueJaiChatMemberEventEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      thumbnailUrl: json['thumbnailUrl'] as String?,
    );

Map<String, dynamic> _$RueJaiChatCreateRoomEventEntityToJson(
        RueJaiChatCreateRoomEventEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner': instance.owner,
      'createdAt': instance.createdAt.toIso8601String(),
      'type': _$EventTypeEnumMap[instance.type]!,
      'roomId': instance.roomId,
      'name': instance.name,
      'thumbnailUrl': instance.thumbnailUrl,
      'members': instance.members,
    };

RueJaiChatRoleEditedEventEntity _$RueJaiChatRoleEditedEventEntityFromJson(
        Map<String, dynamic> json) =>
    RueJaiChatRoleEditedEventEntity(
      id: json['id'] as String,
      owner:
          RueJaiChatOwnerEntity.fromJson(json['owner'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
      type: $enumDecode(_$EventTypeEnumMap, json['type']),
      updatedMemberRecordNumber:
          (json['updatedMemberRecordNumber'] as num).toInt(),
      memberRole: $enumDecode(_$ChatRoomMemberRoleEnumMap, json['memberRole']),
    );

Map<String, dynamic> _$RueJaiChatRoleEditedEventEntityToJson(
        RueJaiChatRoleEditedEventEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner': instance.owner,
      'createdAt': instance.createdAt.toIso8601String(),
      'type': _$EventTypeEnumMap[instance.type]!,
      'updatedMemberRecordNumber': instance.updatedMemberRecordNumber,
      'memberRole': _$ChatRoomMemberRoleEnumMap[instance.memberRole]!,
    };

const _$ChatRoomMemberRoleEnumMap = {
  ChatRoomMemberRole.admin: 'ADMIN',
  ChatRoomMemberRole.member: 'MEMBER',
};

RueJaiChatInviteEventEntity _$RueJaiChatInviteEventEntityFromJson(
        Map<String, dynamic> json) =>
    RueJaiChatInviteEventEntity(
      id: json['id'] as String,
      owner:
          RueJaiChatOwnerEntity.fromJson(json['owner'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
      type: $enumDecode(_$EventTypeEnumMap, json['type']),
      member: RueJaiChatMemberEventEntity.fromJson(
          json['member'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RueJaiChatInviteEventEntityToJson(
        RueJaiChatInviteEventEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner': instance.owner,
      'createdAt': instance.createdAt.toIso8601String(),
      'type': _$EventTypeEnumMap[instance.type]!,
      'member': instance.member,
    };

RueJaiChatRejectEventEntity _$RueJaiChatRejectEventEntityFromJson(
        Map<String, dynamic> json) =>
    RueJaiChatRejectEventEntity(
      id: json['id'] as String,
      owner:
          RueJaiChatOwnerEntity.fromJson(json['owner'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
      type: $enumDecode(_$EventTypeEnumMap, json['type']),
      removedMemberRecordNumber:
          (json['removedMemberRecordNumber'] as num).toInt(),
    );

Map<String, dynamic> _$RueJaiChatRejectEventEntityToJson(
        RueJaiChatRejectEventEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner': instance.owner,
      'createdAt': instance.createdAt.toIso8601String(),
      'type': _$EventTypeEnumMap[instance.type]!,
      'removedMemberRecordNumber': instance.removedMemberRecordNumber,
    };

RueJaiChatMemberEventEntity _$RueJaiChatMemberEventEntityFromJson(
        Map<String, dynamic> json) =>
    RueJaiChatMemberEventEntity(
      role: $enumDecode(_$ChatRoomMemberRoleEnumMap, json['role']),
      rueJaiUserId: json['rueJaiUserId'] as String,
      rueJaiUserType:
          $enumDecode(_$RueJaiUserTypeEnumMap, json['rueJaiUserType']),
    );

Map<String, dynamic> _$RueJaiChatMemberEventEntityToJson(
        RueJaiChatMemberEventEntity instance) =>
    <String, dynamic>{
      'role': _$ChatRoomMemberRoleEnumMap[instance.role]!,
      'rueJaiUserId': instance.rueJaiUserId,
      'rueJaiUserType': _$RueJaiUserTypeEnumMap[instance.rueJaiUserType]!,
    };
