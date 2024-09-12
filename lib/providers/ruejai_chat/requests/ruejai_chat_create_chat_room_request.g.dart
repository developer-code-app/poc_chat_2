// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ruejai_chat_create_chat_room_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RuejaiChatCreateChatRoomRequest _$RuejaiChatCreateChatRoomRequestFromJson(
        Map<String, dynamic> json) =>
    RuejaiChatCreateChatRoomRequest(
      id: json['id'] as String,
      owner: OwnerRequest.fromJson(json['owner'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['created_at'] as String),
      name: json['name'] as String,
      members: (json['members'] as List<dynamic>)
          .map((e) => ChatRoomMemberRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
      thumbnailUrl: json['thumbnail_url'] as String?,
      type: $enumDecodeNullable(_$EventTypeEnumMap, json['type']) ??
          EventType.createRoom,
    );

Map<String, dynamic> _$RuejaiChatCreateChatRoomRequestToJson(
    RuejaiChatCreateChatRoomRequest instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'owner': instance.owner,
    'created_at': instance.createdAt.toIso8601String(),
    'name': instance.name,
    'type': _$EventTypeEnumMap[instance.type]!,
    'members': instance.members,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('thumbnail_url', instance.thumbnailUrl);
  return val;
}

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

OwnerRequest _$OwnerRequestFromJson(Map<String, dynamic> json) => OwnerRequest(
      rueJaiUserId: json['rue_jai_user_id'] as String,
      rueJaiUserType:
          $enumDecode(_$RueJaiUserTypeEnumMap, json['rue_jai_user_type']),
    );

Map<String, dynamic> _$OwnerRequestToJson(OwnerRequest instance) =>
    <String, dynamic>{
      'rue_jai_user_id': instance.rueJaiUserId,
      'rue_jai_user_type': _$RueJaiUserTypeEnumMap[instance.rueJaiUserType]!,
    };

const _$RueJaiUserTypeEnumMap = {
  RueJaiUserType.rueJaiAdmin: 'RUE_JAI_ADMIN',
  RueJaiUserType.rueJaiAppUser: 'RUE_JAI_APP_USER',
};

ChatRoomMemberRequest _$ChatRoomMemberRequestFromJson(
        Map<String, dynamic> json) =>
    ChatRoomMemberRequest(
      role: $enumDecode(_$ChatRoomMemberRoleEnumMap, json['role']),
      rueJaiUserId: json['rue_jai_user_id'] as String,
      rueJaiUserType:
          $enumDecode(_$RueJaiUserTypeEnumMap, json['rue_jai_user_type']),
    );

Map<String, dynamic> _$ChatRoomMemberRequestToJson(
        ChatRoomMemberRequest instance) =>
    <String, dynamic>{
      'role': _$ChatRoomMemberRoleEnumMap[instance.role]!,
      'rue_jai_user_id': instance.rueJaiUserId,
      'rue_jai_user_type': _$RueJaiUserTypeEnumMap[instance.rueJaiUserType]!,
    };

const _$ChatRoomMemberRoleEnumMap = {
  ChatRoomMemberRole.admin: 'ADMIN',
  ChatRoomMemberRole.member: 'MEMBER',
};
