import 'package:poc_chat_2/models/events/event.dart';
import 'package:poc_chat_2/providers/ruejai_chat/entities/rue_jai_chat_event_entity.dart';

class ReadMessageEvent extends Event {
  ReadMessageEvent({
    required super.id,
    required super.owner,
    required super.createdAt,
    required this.readMessageRecordNumber,
  });

  factory ReadMessageEvent.fromEntity({
    required RueJaiChatReadMessageEventEntity entity,
  }) {
    return ReadMessageEvent(
      id: entity.id,
      owner: Owner.fromEntity(entity: entity.owner),
      createdAt: entity.createdAt,
      readMessageRecordNumber: entity.readMessageRecordNumber,
    );
  }

  final int readMessageRecordNumber;
}
