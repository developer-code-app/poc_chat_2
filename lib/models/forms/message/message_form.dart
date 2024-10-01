import 'package:poc_chat_2/models/chat_room_member.dart';

class MessageForm {
  MessageForm({
    required this.owner,
    required this.createdAt,
    required this.createdByEventId,
    this.createdByEventRecordNumber,
  });

  final ChatRoomMember owner;
  final DateTime createdAt;
  final String createdByEventId;

  final int? createdByEventRecordNumber;
}
