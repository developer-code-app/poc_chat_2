import 'package:poc_chat_2/models/attachment.dart';
import 'package:poc_chat_2/models/chat_room_member.dart';
import 'package:poc_chat_2/models/message.dart';
import 'package:poc_chat_2/services/member/member_service.dart';

extension BasicMemberService on MemberService {
  Future<List<ChatRoomMember>> getChatRoomMembers() async {
    return chatRoomMemberLister.getChatRoomMembers();
  }

  Future<List<Message>> loadNewerMessages({
    required int start,
    required int size,
  }) async {
    return chatRoomMessageLister.loadNewerMessages(
      chatRoomId: chatRoomId,
      start: start,
      size: size,
    );
  }

  Future<List<Message>> loadOlderMessages({
    required int start,
    required int size,
  }) async {
    return chatRoomMessageLister.loadOlderMessages(
      chatRoomId: chatRoomId,
      start: start,
      size: size,
    );
  }

  Future<List<Message>> searchMessages({
    required String query,
  }) async {
    return chatRoomMessageLister.searchMessages(
      chatRoomId: chatRoomId,
      query: query,
    );
  }

  Future<void> sendMessage({
    required Message message,
  }) async {}

  Future<void> sendTextReplyMessage({
    required TextReplyMessage message,
  }) async {}

  Future<void> readMessages() async {}

  Future<void> editMessage({
    required Message message,
  }) async {}

  Future<void> deleteMessage({
    required Message message,
  }) async {}

  Future<List<VisualMediaAttachment>> getVisualMediaAttachments() async {
    return List.empty();
  }

  Future<List<FileAttachment>> getFileAttachments() async {
    return List.empty();
  }

  Future<List<MiniAppAttachment>> getMiniAppAttachments() async {
    return List.empty();
  }

  Future<int> getUnreadMessageCount() async {
    final lastReadMessageId =
        await chatRoomMemberInquiry.getLastReadMessageId();
    final messageCount = await chatRoomInquiry.messageCount();

    return messageCount - lastReadMessageId;
  }

  Future<void> turnOffNotification() async {}

  Future<void> turnOnNotification() async {}
}
