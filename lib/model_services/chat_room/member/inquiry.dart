class ChatRoomMemberInquiry {
  ChatRoomMemberInquiry({
    required this.chatRoomId,
    required this.memberId,
  });

  final int chatRoomId;
  final int memberId;

  Future<int> getLastReadMessageId() async {
    return 0;
  }
}
