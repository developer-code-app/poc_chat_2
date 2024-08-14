import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:poc_chat_2/providers/ruejai_chat/entities/rue_jai_chat_event_entity.dart';

part 'rue_jai_chat_recorded_event_entity.g.dart';

@JsonSerializable()
class RueJaiChatRecordedEventEntity extends Equatable {
  const RueJaiChatRecordedEventEntity({
    required this.recordNumber,
    required this.recordedAt,
    required this.event,
  });

  factory RueJaiChatRecordedEventEntity.fromJson(Map<String, dynamic> json) =>
      _$RueJaiChatRecordedEventEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RueJaiChatRecordedEventEntityToJson(this);

  final int recordNumber;
  final DateTime recordedAt;
  final RueJaiChatEventEntity event;

  @override
  List<Object?> get props => [
        recordNumber,
        recordedAt,
        event,
      ];
}
