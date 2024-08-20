// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rue_jai_chat_room_latest_event_record_info_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RueJaiChatRoomLatestEventRecordInfoEntity
    _$RueJaiChatRoomLatestEventRecordInfoEntityFromJson(
            Map<String, dynamic> json) =>
        RueJaiChatRoomLatestEventRecordInfoEntity(
          latestRoomAndMessageEventRecordNumber:
              (json['latest_room_and_message_event_record_number'] as num)
                  .toInt(),
        );

Map<String, dynamic> _$RueJaiChatRoomLatestEventRecordInfoEntityToJson(
        RueJaiChatRoomLatestEventRecordInfoEntity instance) =>
    <String, dynamic>{
      'latest_room_and_message_event_record_number':
          instance.latestRoomAndMessageEventRecordNumber,
    };
