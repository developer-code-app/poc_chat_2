// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TextMessageContent _$TextMessageContentFromJson(Map<String, dynamic> json) =>
    TextMessageContent(
      text: json['text'] as String,
    );

Map<String, dynamic> _$TextMessageContentToJson(TextMessageContent instance) =>
    <String, dynamic>{
      'text': instance.text,
    };

PhotoMessageContent _$PhotoMessageContentFromJson(Map<String, dynamic> json) =>
    PhotoMessageContent(
      urls: (json['urls'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$PhotoMessageContentToJson(
        PhotoMessageContent instance) =>
    <String, dynamic>{
      'urls': instance.urls,
    };

VideoMessageContent _$VideoMessageContentFromJson(Map<String, dynamic> json) =>
    VideoMessageContent(
      url: json['url'] as String,
    );

Map<String, dynamic> _$VideoMessageContentToJson(
        VideoMessageContent instance) =>
    <String, dynamic>{
      'url': instance.url,
    };

FileMessageContent _$FileMessageContentFromJson(Map<String, dynamic> json) =>
    FileMessageContent(
      url: json['url'] as String,
    );

Map<String, dynamic> _$FileMessageContentToJson(FileMessageContent instance) =>
    <String, dynamic>{
      'url': instance.url,
    };

InviteMemberMessageContent _$InviteMemberMessageContentFromJson(
        Map<String, dynamic> json) =>
    InviteMemberMessageContent(
      invitedMember: InvitedMember.fromJson(
          json['invited_member'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InviteMemberMessageContentToJson(
        InviteMemberMessageContent instance) =>
    <String, dynamic>{
      'invited_member': instance.invitedMember,
    };

InvitedMember _$InvitedMemberFromJson(Map<String, dynamic> json) =>
    InvitedMember(
      role: $enumDecode(_$ChatRoomMemberRoleEnumMap, json['role']),
      rueJaiUserId: json['rue_jai_user_id'] as String,
      rueJaiUserType:
          $enumDecode(_$RueJaiUserTypeEnumMap, json['rue_jai_user_type']),
    );

Map<String, dynamic> _$InvitedMemberToJson(InvitedMember instance) =>
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
