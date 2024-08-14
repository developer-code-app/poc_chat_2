// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rue_jai_chat_recorded_event_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RueJaiChatRecordedEventEntity _$RueJaiChatRecordedEventEntityFromJson(
        Map<String, dynamic> json) =>
    RueJaiChatRecordedEventEntity(
      recordNumber: (json['record_number'] as num).toInt(),
      recordedAt: DateTime.parse(json['recorded_at'] as String),
      event:
          RueJaiChatEventEntity.fromJson(json['event'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RueJaiChatRecordedEventEntityToJson(
        RueJaiChatRecordedEventEntity instance) =>
    <String, dynamic>{
      'record_number': instance.recordNumber,
      'recorded_at': instance.recordedAt.toIso8601String(),
      'event': instance.event,
    };
