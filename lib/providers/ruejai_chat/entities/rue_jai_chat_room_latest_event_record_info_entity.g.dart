// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rue_jai_chat_room_latest_event_record_info_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RueJaiLatestEventRecordInfoEntity _$RueJaiLatestEventRecordInfoEntityFromJson(
        Map<String, dynamic> json) =>
    RueJaiLatestEventRecordInfoEntity(
      latestMessageEventRecordNumber:
          (json['latest_message_event_record_number'] as num).toInt(),
      latestRoomManagementEventRecordNumber:
          (json['latest_room_management_event_record_number'] as num).toInt(),
    );

Map<String, dynamic> _$RueJaiLatestEventRecordInfoEntityToJson(
        RueJaiLatestEventRecordInfoEntity instance) =>
    <String, dynamic>{
      'latest_message_event_record_number':
          instance.latestMessageEventRecordNumber,
      'latest_room_management_event_record_number':
          instance.latestRoomManagementEventRecordNumber,
    };
