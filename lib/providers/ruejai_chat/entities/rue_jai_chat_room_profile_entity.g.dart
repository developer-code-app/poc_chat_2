// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rue_jai_chat_room_profile_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RueJaiChatRoomProfileEntity _$RueJaiChatRoomProfileEntityFromJson(
        Map<String, dynamic> json) =>
    RueJaiChatRoomProfileEntity(
      id: json['id'] as String,
      name: json['name'] as String,
      members: (json['members'] as List<dynamic>)
          .map((e) =>
              RueJaiChatRoomMemberEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      profileHash: json['profile_hash'] as String,
      thumbnailUrl: json['thumbnail_url'] as String?,
    );

Map<String, dynamic> _$RueJaiChatRoomProfileEntityToJson(
    RueJaiChatRoomProfileEntity instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('thumbnail_url', instance.thumbnailUrl);
  val['members'] = instance.members;
  val['profile_hash'] = instance.profileHash;
  return val;
}

RueJaiChatRoomMemberEntity _$RueJaiChatRoomMemberEntityFromJson(
        Map<String, dynamic> json) =>
    RueJaiChatRoomMemberEntity(
      id: json['id'] as String,
      role: $enumDecode(_$ChatRoomMemberRoleEnumMap, json['role']),
      rueJaiUser: RueJaiUserEntity.fromJson(
          json['rue_jai_user'] as Map<String, dynamic>),
      lastReadMessageRecordNumber:
          (json['last_read_message_record_number'] as num).toInt(),
    );

Map<String, dynamic> _$RueJaiChatRoomMemberEntityToJson(
        RueJaiChatRoomMemberEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'role': _$ChatRoomMemberRoleEnumMap[instance.role]!,
      'rue_jai_user': instance.rueJaiUser,
      'last_read_message_record_number': instance.lastReadMessageRecordNumber,
    };

const _$ChatRoomMemberRoleEnumMap = {
  ChatRoomMemberRole.admin: 'ADMIN',
  ChatRoomMemberRole.member: 'MEMBER',
};

RueJaiUserEntity _$RueJaiUserEntityFromJson(Map<String, dynamic> json) =>
    RueJaiUserEntity(
      rueJaiUserId: json['rue_jai_user_id'] as String,
      rueJaiUserType:
          $enumDecode(_$RueJaiUserTypeEnumMap, json['rue_jai_user_type']),
      rueJaiUserRole:
          $enumDecode(_$RueJaiUserRoleEnumMap, json['rue_jai_user_role']),
      name: json['name'] as String,
      thumbnailUrl: json['thumbnail_url'] as String?,
    );

Map<String, dynamic> _$RueJaiUserEntityToJson(RueJaiUserEntity instance) {
  final val = <String, dynamic>{
    'rue_jai_user_id': instance.rueJaiUserId,
    'rue_jai_user_type': _$RueJaiUserTypeEnumMap[instance.rueJaiUserType]!,
    'rue_jai_user_role': _$RueJaiUserRoleEnumMap[instance.rueJaiUserRole]!,
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('thumbnail_url', instance.thumbnailUrl);
  return val;
}

const _$RueJaiUserTypeEnumMap = {
  RueJaiUserType.rueJaiAdmin: 'RUE_JAI_ADMIN',
  RueJaiUserType.rueJaiAppUser: 'RUE_JAI_APP_USER',
};

const _$RueJaiUserRoleEnumMap = {
  RueJaiUserRole.homeOwner: 'homeOwner',
  RueJaiUserRole.resident: 'resident',
  RueJaiUserRole.renter: 'renter',
  RueJaiUserRole.customerService: 'customerService',
};
