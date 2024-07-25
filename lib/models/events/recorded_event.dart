import 'package:poc_chat_2/models/events/event.dart';

class RecordedEvent {
  RecordedEvent({
    required this.recordNumber,
    required this.recordedAt,
    required this.event,
  });

  final int recordNumber;
  final DateTime recordedAt;
  final Event event;
}
