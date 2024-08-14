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
      'created_at': instance.createdAt.toIso8601String(),
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
      rueJaiUserId: json['rue_jai_user_id'] as String,
      rueJaiUserType:
          $enumDecode(_$RueJaiUserTypeEnumMap, json['rue_jai_user_type']),
    );

Map<String, dynamic> _$RueJaiChatOwnerEntityToJson(
        RueJaiChatOwnerEntity instance) =>
    <String, dynamic>{
      'rue_jai_user_id': instance.rueJaiUserId,
      'rue_jai_user_type': _$RueJaiUserTypeEnumMap[instance.rueJaiUserType]!,
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
          createdAt: DateTime.parse(json['created_at'] as String),
          type: $enumDecode(_$EventTypeEnumMap, json['type']),
        );

Map<String, dynamic> _$RueJaiChatCreateTextMessageEventEntityToJson(
        RueJaiChatCreateTextMessageEventEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner': instance.owner,
      'created_at': instance.createdAt.toIso8601String(),
      'type': _$EventTypeEnumMap[instance.type]!,
    };

RueJaiChatCreateTextReplyMessageEventEntity
    _$RueJaiChatCreateTextReplyMessageEventEntityFromJson(
            Map<String, dynamic> json) =>
        RueJaiChatCreateTextReplyMessageEventEntity(
          id: json['id'] as String,
          owner: RueJaiChatOwnerEntity.fromJson(
              json['owner'] as Map<String, dynamic>),
          createdAt: DateTime.parse(json['created_at'] as String),
          type: $enumDecode(_$EventTypeEnumMap, json['type']),
          repliedMessageAddedByEventRecordNumber:
              (json['replied_message_added_by_event_record_number'] as num)
                  .toInt(),
        );

Map<String, dynamic> _$RueJaiChatCreateTextReplyMessageEventEntityToJson(
        RueJaiChatCreateTextReplyMessageEventEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner': instance.owner,
      'created_at': instance.createdAt.toIso8601String(),
      'type': _$EventTypeEnumMap[instance.type]!,
      'replied_message_added_by_event_record_number':
          instance.repliedMessageAddedByEventRecordNumber,
    };

RueJaiChatCreatePhotoMessageEventEntity
    _$RueJaiChatCreatePhotoMessageEventEntityFromJson(
            Map<String, dynamic> json) =>
        RueJaiChatCreatePhotoMessageEventEntity(
          id: json['id'] as String,
          owner: RueJaiChatOwnerEntity.fromJson(
              json['owner'] as Map<String, dynamic>),
          createdAt: DateTime.parse(json['created_at'] as String),
          type: $enumDecode(_$EventTypeEnumMap, json['type']),
        );

Map<String, dynamic> _$RueJaiChatCreatePhotoMessageEventEntityToJson(
        RueJaiChatCreatePhotoMessageEventEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner': instance.owner,
      'created_at': instance.createdAt.toIso8601String(),
      'type': _$EventTypeEnumMap[instance.type]!,
    };

RueJaiChatCreateVideoMessageEventEntity
    _$RueJaiChatCreateVideoMessageEventEntityFromJson(
            Map<String, dynamic> json) =>
        RueJaiChatCreateVideoMessageEventEntity(
          id: json['id'] as String,
          owner: RueJaiChatOwnerEntity.fromJson(
              json['owner'] as Map<String, dynamic>),
          createdAt: DateTime.parse(json['created_at'] as String),
          type: $enumDecode(_$EventTypeEnumMap, json['type']),
        );

Map<String, dynamic> _$RueJaiChatCreateVideoMessageEventEntityToJson(
        RueJaiChatCreateVideoMessageEventEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner': instance.owner,
      'created_at': instance.createdAt.toIso8601String(),
      'type': _$EventTypeEnumMap[instance.type]!,
    };

RueJaiChatCreateFileMessageEventEntity
    _$RueJaiChatCreateFileMessageEventEntityFromJson(
            Map<String, dynamic> json) =>
        RueJaiChatCreateFileMessageEventEntity(
          id: json['id'] as String,
          owner: RueJaiChatOwnerEntity.fromJson(
              json['owner'] as Map<String, dynamic>),
          createdAt: DateTime.parse(json['created_at'] as String),
          type: $enumDecode(_$EventTypeEnumMap, json['type']),
        );

Map<String, dynamic> _$RueJaiChatCreateFileMessageEventEntityToJson(
        RueJaiChatCreateFileMessageEventEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner': instance.owner,
      'created_at': instance.createdAt.toIso8601String(),
      'type': _$EventTypeEnumMap[instance.type]!,
    };

RueJaiChatCreateHomeCareMessageEventEntity
    _$RueJaiChatCreateHomeCareMessageEventEntityFromJson(
            Map<String, dynamic> json) =>
        RueJaiChatCreateHomeCareMessageEventEntity(
          id: json['id'] as String,
          owner: RueJaiChatOwnerEntity.fromJson(
              json['owner'] as Map<String, dynamic>),
          createdAt: DateTime.parse(json['created_at'] as String),
          type: $enumDecode(_$EventTypeEnumMap, json['type']),
        );

Map<String, dynamic> _$RueJaiChatCreateHomeCareMessageEventEntityToJson(
        RueJaiChatCreateHomeCareMessageEventEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner': instance.owner,
      'created_at': instance.createdAt.toIso8601String(),
      'type': _$EventTypeEnumMap[instance.type]!,
    };

RueJaiChatTextEditedEventEntity _$RueJaiChatTextEditedEventEntityFromJson(
        Map<String, dynamic> json) =>
    RueJaiChatTextEditedEventEntity(
      id: json['id'] as String,
      owner:
          RueJaiChatOwnerEntity.fromJson(json['owner'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['created_at'] as String),
      type: $enumDecode(_$EventTypeEnumMap, json['type']),
      updatedMessageRecordNumber:
          (json['updated_message_record_number'] as num).toInt(),
    );

Map<String, dynamic> _$RueJaiChatTextEditedEventEntityToJson(
        RueJaiChatTextEditedEventEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner': instance.owner,
      'created_at': instance.createdAt.toIso8601String(),
      'type': _$EventTypeEnumMap[instance.type]!,
      'updated_message_record_number': instance.updatedMessageRecordNumber,
    };

RueJaiChatDeleteMessageEventEntity _$RueJaiChatDeleteMessageEventEntityFromJson(
        Map<String, dynamic> json) =>
    RueJaiChatDeleteMessageEventEntity(
      id: json['id'] as String,
      owner:
          RueJaiChatOwnerEntity.fromJson(json['owner'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['created_at'] as String),
      type: $enumDecode(_$EventTypeEnumMap, json['type']),
      deletedMessageRecordNumber:
          (json['deleted_message_record_number'] as num).toInt(),
    );

Map<String, dynamic> _$RueJaiChatDeleteMessageEventEntityToJson(
        RueJaiChatDeleteMessageEventEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner': instance.owner,
      'created_at': instance.createdAt.toIso8601String(),
      'type': _$EventTypeEnumMap[instance.type]!,
      'deleted_message_record_number': instance.deletedMessageRecordNumber,
    };

RueJaiChatReadMessageEventEntity _$RueJaiChatReadMessageEventEntityFromJson(
        Map<String, dynamic> json) =>
    RueJaiChatReadMessageEventEntity(
      id: json['id'] as String,
      owner:
          RueJaiChatOwnerEntity.fromJson(json['owner'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['created_at'] as String),
      type: $enumDecode(_$EventTypeEnumMap, json['type']),
      readMessageRecordNumber:
          (json['read_message_record_number'] as num).toInt(),
    );

Map<String, dynamic> _$RueJaiChatReadMessageEventEntityToJson(
        RueJaiChatReadMessageEventEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner': instance.owner,
      'created_at': instance.createdAt.toIso8601String(),
      'type': _$EventTypeEnumMap[instance.type]!,
      'read_message_record_number': instance.readMessageRecordNumber,
    };

RueJaiChatCreateRoomEventEntity _$RueJaiChatCreateRoomEventEntityFromJson(
        Map<String, dynamic> json) =>
    RueJaiChatCreateRoomEventEntity(
      id: json['id'] as String,
      owner:
          RueJaiChatOwnerEntity.fromJson(json['owner'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['created_at'] as String),
      type: $enumDecode(_$EventTypeEnumMap, json['type']),
      roomId: json['room_id'] as String,
      name: json['name'] as String,
      members: (json['members'] as List<dynamic>)
          .map((e) =>
              RueJaiChatMemberEventEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      thumbnailUrl: json['thumbnail_url'] as String?,
    );

Map<String, dynamic> _$RueJaiChatCreateRoomEventEntityToJson(
    RueJaiChatCreateRoomEventEntity instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'owner': instance.owner,
    'created_at': instance.createdAt.toIso8601String(),
    'type': _$EventTypeEnumMap[instance.type]!,
    'room_id': instance.roomId,
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('thumbnail_url', instance.thumbnailUrl);
  val['members'] = instance.members;
  return val;
}

RueJaiChatRoleEditedEventEntity _$RueJaiChatRoleEditedEventEntityFromJson(
        Map<String, dynamic> json) =>
    RueJaiChatRoleEditedEventEntity(
      id: json['id'] as String,
      owner:
          RueJaiChatOwnerEntity.fromJson(json['owner'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['created_at'] as String),
      type: $enumDecode(_$EventTypeEnumMap, json['type']),
      updatedMemberRecordNumber:
          (json['updated_member_record_number'] as num).toInt(),
      memberRole: $enumDecode(_$ChatRoomMemberRoleEnumMap, json['member_role']),
    );

Map<String, dynamic> _$RueJaiChatRoleEditedEventEntityToJson(
        RueJaiChatRoleEditedEventEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner': instance.owner,
      'created_at': instance.createdAt.toIso8601String(),
      'type': _$EventTypeEnumMap[instance.type]!,
      'updated_member_record_number': instance.updatedMemberRecordNumber,
      'member_role': _$ChatRoomMemberRoleEnumMap[instance.memberRole]!,
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
      createdAt: DateTime.parse(json['created_at'] as String),
      type: $enumDecode(_$EventTypeEnumMap, json['type']),
      member: RueJaiChatMemberEventEntity.fromJson(
          json['member'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RueJaiChatInviteEventEntityToJson(
        RueJaiChatInviteEventEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner': instance.owner,
      'created_at': instance.createdAt.toIso8601String(),
      'type': _$EventTypeEnumMap[instance.type]!,
      'member': instance.member,
    };

RueJaiChatRejectEventEntity _$RueJaiChatRejectEventEntityFromJson(
        Map<String, dynamic> json) =>
    RueJaiChatRejectEventEntity(
      id: json['id'] as String,
      owner:
          RueJaiChatOwnerEntity.fromJson(json['owner'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['created_at'] as String),
      type: $enumDecode(_$EventTypeEnumMap, json['type']),
      removedMemberRecordNumber:
          (json['removed_member_record_number'] as num).toInt(),
    );

Map<String, dynamic> _$RueJaiChatRejectEventEntityToJson(
        RueJaiChatRejectEventEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner': instance.owner,
      'created_at': instance.createdAt.toIso8601String(),
      'type': _$EventTypeEnumMap[instance.type]!,
      'removed_member_record_number': instance.removedMemberRecordNumber,
    };

RueJaiChatMemberEventEntity _$RueJaiChatMemberEventEntityFromJson(
        Map<String, dynamic> json) =>
    RueJaiChatMemberEventEntity(
      role: $enumDecode(_$ChatRoomMemberRoleEnumMap, json['role']),
      rueJaiUserId: json['rue_jai_user_id'] as String,
      rueJaiUserType:
          $enumDecode(_$RueJaiUserTypeEnumMap, json['rue_jai_user_type']),
    );

Map<String, dynamic> _$RueJaiChatMemberEventEntityToJson(
        RueJaiChatMemberEventEntity instance) =>
    <String, dynamic>{
      'role': _$ChatRoomMemberRoleEnumMap[instance.role]!,
      'rue_jai_user_id': instance.rueJaiUserId,
      'rue_jai_user_type': _$RueJaiUserTypeEnumMap[instance.rueJaiUserType]!,
    };
