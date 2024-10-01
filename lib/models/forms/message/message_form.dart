import 'package:poc_chat_2/models/chat_room_member.dart';

class MessageForm {
  MessageForm({
    required this.owner,
    required this.createdAt,
    required this.updatedAt,
    required this.createdByEventId,
    this.deletedAt,
    this.addedByEventRecordNumber,
    this.updatedByEventRecordNumber,
  });

  final ChatRoomMember owner;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String createdByEventId;
  final DateTime? deletedAt;
  final int? addedByEventRecordNumber;
  final int? updatedByEventRecordNumber;
}
