class ChatRoomState {
  ChatRoomState({
    required this.id,
    required this.profileHash,
    required this.latestRoomAndMessageEventRecordNumber,
  });

  final String id;
  final String profileHash;
  final int latestRoomAndMessageEventRecordNumber;
}
