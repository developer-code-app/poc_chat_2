import 'package:poc_chat_2/models/events/event.dart';

class ReadMessageEvent extends Event {
  ReadMessageEvent({
    required super.id,
    required super.owner,
    required super.createdAt,
    required this.readMessageRecordNumber,
  });

  final int readMessageRecordNumber;
}
