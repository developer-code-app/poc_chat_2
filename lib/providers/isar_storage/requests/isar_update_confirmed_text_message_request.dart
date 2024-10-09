class IsarUpdateConfirmedTextMessageRequest {
  IsarUpdateConfirmedTextMessageRequest({
    required this.targetMessageChatRoomId,
    required this.targetMessageCreatedByRecordNumber,
    required this.newUpdatedAt,
    required this.newLastUpdatedByRecordNumber,
    required this.newText,
  });

  final String targetMessageChatRoomId;
  final int targetMessageCreatedByRecordNumber;
  final String newText;
  final DateTime newUpdatedAt;
  final int newLastUpdatedByRecordNumber;
}
