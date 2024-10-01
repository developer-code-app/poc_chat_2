// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rue_jai_chat_event_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$RueJaiChatEventEntityToJson(
    RueJaiChatEventEntity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('stringify', instance.stringify);
  val['hash_code'] = instance.hashCode;
  val['id'] = instance.id;
  val['owner'] = instance.owner;
  val['created_at'] = instance.createdAt.toIso8601String();
  val['type'] = _$EventTypeEnumMap[instance.type]!;
  val['props'] = instance.props;
  return val;
}

const _$EventTypeEnumMap = {
  EventType.createTextMessage: 'CREATE_TEXT_MESSAGE',
  EventType.createTextReplyMessage: 'CREATE_TEXT_REPLY_MESSAGE',
  EventType.createPhotoMessage: 'CREATE_PHOTO_MESSAGE',
  EventType.createVideoMessage: 'CREATE_VIDEO_MESSAGE',
  EventType.createFileMessage: 'CREATE_FILE_MESSAGE',
  EventType.createHomeCareMessage: 'CREATE_HOME_CARE_MESSAGE',
  EventType.editTextMessage: 'EDIT_TEXT_MESSAGE',
  EventType.deleteMessage: 'DELETE_MESSAGE',
  EventType.readMessage: 'READ_MESSAGE',
  EventType.createRoom: 'CREATE_ROOM',
  EventType.editMemberRole: 'EDIT_MEMBER_ROLE',
  EventType.inviteMember: 'INVITE_MEMBER',
  EventType.removeMember: 'REMOVE_MEMBER',
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
          text: json['text'] as String,
        );

Map<String, dynamic> _$RueJaiChatCreateTextMessageEventEntityToJson(
        RueJaiChatCreateTextMessageEventEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner': instance.owner,
      'created_at': instance.createdAt.toIso8601String(),
      'type': _$EventTypeEnumMap[instance.type]!,
      'text': instance.text,
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
          urls:
              (json['urls'] as List<dynamic>).map((e) => e as String).toList(),
        );

Map<String, dynamic> _$RueJaiChatCreatePhotoMessageEventEntityToJson(
        RueJaiChatCreatePhotoMessageEventEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner': instance.owner,
      'created_at': instance.createdAt.toIso8601String(),
      'type': _$EventTypeEnumMap[instance.type]!,
      'urls': instance.urls,
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
          url: json['url'] as String,
        );

Map<String, dynamic> _$RueJaiChatCreateVideoMessageEventEntityToJson(
        RueJaiChatCreateVideoMessageEventEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner': instance.owner,
      'created_at': instance.createdAt.toIso8601String(),
      'type': _$EventTypeEnumMap[instance.type]!,
      'url': instance.url,
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
          url: json['url'] as String,
        );

Map<String, dynamic> _$RueJaiChatCreateFileMessageEventEntityToJson(
        RueJaiChatCreateFileMessageEventEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner': instance.owner,
      'created_at': instance.createdAt.toIso8601String(),
      'type': _$EventTypeEnumMap[instance.type]!,
      'url': instance.url,
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

RueJaiChatEditTextMessageEventEntity
    _$RueJaiChatEditTextMessageEventEntityFromJson(Map<String, dynamic> json) =>
        RueJaiChatEditTextMessageEventEntity(
          id: json['id'] as String,
          owner: RueJaiChatOwnerEntity.fromJson(
              json['owner'] as Map<String, dynamic>),
          createdAt: DateTime.parse(json['created_at'] as String),
          type: $enumDecode(_$EventTypeEnumMap, json['type']),
          updatedMessageRecordNumber:
              (json['updated_message_record_number'] as num).toInt(),
        );

Map<String, dynamic> _$RueJaiChatEditTextMessageEventEntityToJson(
        RueJaiChatEditTextMessageEventEntity instance) =>
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

RueJaiChatEditMemberRoleEventEntity
    _$RueJaiChatEditMemberRoleEventEntityFromJson(Map<String, dynamic> json) =>
        RueJaiChatEditMemberRoleEventEntity(
          id: json['id'] as String,
          owner: RueJaiChatOwnerEntity.fromJson(
              json['owner'] as Map<String, dynamic>),
          createdAt: DateTime.parse(json['created_at'] as String),
          type: $enumDecode(_$EventTypeEnumMap, json['type']),
          updatedMemberRecordNumber:
              (json['updated_member_record_number'] as num).toInt(),
          memberRole:
              $enumDecode(_$ChatRoomMemberRoleEnumMap, json['member_role']),
        );

Map<String, dynamic> _$RueJaiChatEditMemberRoleEventEntityToJson(
        RueJaiChatEditMemberRoleEventEntity instance) =>
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

RueJaiChatInviteMemberEventEntity _$RueJaiChatInviteMemberEventEntityFromJson(
        Map<String, dynamic> json) =>
    RueJaiChatInviteMemberEventEntity(
      id: json['id'] as String,
      owner:
          RueJaiChatOwnerEntity.fromJson(json['owner'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['created_at'] as String),
      type: $enumDecode(_$EventTypeEnumMap, json['type']),
      member: RueJaiChatMemberEventEntity.fromJson(
          json['member'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RueJaiChatInviteMemberEventEntityToJson(
        RueJaiChatInviteMemberEventEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner': instance.owner,
      'created_at': instance.createdAt.toIso8601String(),
      'type': _$EventTypeEnumMap[instance.type]!,
      'member': instance.member,
    };

RueJaiChatRemoveMemberEventEntity _$RueJaiChatRemoveMemberEventEntityFromJson(
        Map<String, dynamic> json) =>
    RueJaiChatRemoveMemberEventEntity(
      id: json['id'] as String,
      owner:
          RueJaiChatOwnerEntity.fromJson(json['owner'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['created_at'] as String),
      type: $enumDecode(_$EventTypeEnumMap, json['type']),
      removedMemberRecordNumber:
          (json['removed_member_record_number'] as num).toInt(),
    );

Map<String, dynamic> _$RueJaiChatRemoveMemberEventEntityToJson(
        RueJaiChatRemoveMemberEventEntity instance) =>
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
