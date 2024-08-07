// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rue_jai_chat_recorded_event_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RueJaiChatRecordedEventEntity _$RueJaiChatRecordedEventEntityFromJson(
        Map<String, dynamic> json) =>
    RueJaiChatRecordedEventEntity(
      recordNumber: (json['recordNumber'] as num).toInt(),
      recordedAt: DateTime.parse(json['recordedAt'] as String),
      event:
          RueJaiChatEventEntity.fromJson(json['event'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RueJaiChatRecordedEventEntityToJson(
        RueJaiChatRecordedEventEntity instance) =>
    <String, dynamic>{
      'recordNumber': instance.recordNumber,
      'recordedAt': instance.recordedAt.toIso8601String(),
      'event': instance.event,
    };
