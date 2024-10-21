// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_message_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IsarTextMessageContentMapper _$IsarTextMessageContentMapperFromJson(
        Map<String, dynamic> json) =>
    IsarTextMessageContentMapper(
      text: json['text'] as String,
    );

Map<String, dynamic> _$IsarTextMessageContentMapperToJson(
        IsarTextMessageContentMapper instance) =>
    <String, dynamic>{
      'text': instance.text,
    };

IsarPhotoMessageContentMapper _$IsarPhotoMessageContentMapperFromJson(
        Map<String, dynamic> json) =>
    IsarPhotoMessageContentMapper(
      urls: (json['urls'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$IsarPhotoMessageContentMapperToJson(
        IsarPhotoMessageContentMapper instance) =>
    <String, dynamic>{
      'urls': instance.urls,
    };

IsarVideoMessageContentMapper _$IsarVideoMessageContentMapperFromJson(
        Map<String, dynamic> json) =>
    IsarVideoMessageContentMapper(
      url: json['url'] as String,
    );

Map<String, dynamic> _$IsarVideoMessageContentMapperToJson(
        IsarVideoMessageContentMapper instance) =>
    <String, dynamic>{
      'url': instance.url,
    };

IsarFileMessageContentMapper _$IsarFileMessageContentMapperFromJson(
        Map<String, dynamic> json) =>
    IsarFileMessageContentMapper(
      url: json['url'] as String,
    );

Map<String, dynamic> _$IsarFileMessageContentMapperToJson(
        IsarFileMessageContentMapper instance) =>
    <String, dynamic>{
      'url': instance.url,
    };

IsarInviteMemberMessageContentMapper
    _$IsarInviteMemberMessageContentMapperFromJson(Map<String, dynamic> json) =>
        IsarInviteMemberMessageContentMapper(
          invitedMember: IsarChatRoomMember.fromJson(
              json['invited_member'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$IsarInviteMemberMessageContentMapperToJson(
        IsarInviteMemberMessageContentMapper instance) =>
    <String, dynamic>{
      'invited_member': instance.invitedMember,
    };

IsarUninviteMemberMessageContentMapper
    _$IsarUninviteMemberMessageContentMapperFromJson(
            Map<String, dynamic> json) =>
        IsarUninviteMemberMessageContentMapper(
          uninvitedMember: IsarChatRoomMember.fromJson(
              json['uninvited_member'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$IsarUninviteMemberMessageContentMapperToJson(
        IsarUninviteMemberMessageContentMapper instance) =>
    <String, dynamic>{
      'uninvited_member': instance.uninvitedMember,
    };

IsarChatRoomMember _$IsarChatRoomMemberFromJson(Map<String, dynamic> json) =>
    IsarChatRoomMember(
      role: $enumDecode(_$ChatRoomMemberRoleEnumMap, json['role']),
      rueJaiUserId: json['rue_jai_user_id'] as String,
      rueJaiUserType:
          $enumDecode(_$RueJaiUserTypeEnumMap, json['rue_jai_user_type']),
    );

Map<String, dynamic> _$IsarChatRoomMemberToJson(IsarChatRoomMember instance) =>
    <String, dynamic>{
      'role': _$ChatRoomMemberRoleEnumMap[instance.role]!,
      'rue_jai_user_id': instance.rueJaiUserId,
      'rue_jai_user_type': _$RueJaiUserTypeEnumMap[instance.rueJaiUserType]!,
    };

const _$ChatRoomMemberRoleEnumMap = {
  ChatRoomMemberRole.admin: 'ADMIN',
  ChatRoomMemberRole.member: 'MEMBER',
};

const _$RueJaiUserTypeEnumMap = {
  RueJaiUserType.rueJaiAdmin: 'RUE_JAI_ADMIN',
  RueJaiUserType.rueJaiAppUser: 'RUE_JAI_APP_USER',
};
