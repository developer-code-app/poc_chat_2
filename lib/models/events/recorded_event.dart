import 'package:poc_chat_2/models/events/event.dart';
import 'package:poc_chat_2/providers/ruejai_chat/entities/rue_jai_chat_recorded_event_entity.dart';

class RecordedEvent {
  RecordedEvent({
    required this.recordNumber,
    required this.recordedAt,
    required this.event,
  });

  factory RecordedEvent.fromEntity({
    required RueJaiChatRecordedEventEntity entity,
  }) {
    return RecordedEvent(
      recordNumber: entity.recordNumber,
      recordedAt: entity.recordedAt,
      event: Event.fromEntity(entity: entity.event),
    );
  }

  final int recordNumber;
  final DateTime recordedAt;
  final Event event;
}
