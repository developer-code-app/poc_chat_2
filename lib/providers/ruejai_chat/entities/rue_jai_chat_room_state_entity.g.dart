// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rue_jai_chat_room_state_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RueJaiChatRoomStateEntity _$RueJaiChatRoomStateEntityFromJson(
        Map<String, dynamic> json) =>
    RueJaiChatRoomStateEntity(
      id: (json['id'] as num).toInt(),
      latestRoomAndMessageEventRecordNumber:
          (json['latest_room_and_message_event_record_number'] as num).toInt(),
      profileHash: json['profile_hash'] as String,
    );

Map<String, dynamic> _$RueJaiChatRoomStateEntityToJson(
        RueJaiChatRoomStateEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'latest_room_and_message_event_record_number':
          instance.latestRoomAndMessageEventRecordNumber,
      'profile_hash': instance.profileHash,
    };
