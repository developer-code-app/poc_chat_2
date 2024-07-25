import 'package:poc_chat_2/model_services/chat_room/chat_room_inquiry.dart';
import 'package:poc_chat_2/model_services/chat_room/member/chat_room_member_lister.dart';
import 'package:poc_chat_2/model_services/chat_room/member/inquiry.dart';
import 'package:poc_chat_2/model_services/chat_room/message/chat_room_message_lister.dart';

class MemberService {
  MemberService({
    required this.memberId,
    required this.chatRoomId,
  })  : chatRoomMemberLister = ChatRoomMemberLister(chatRoomId: chatRoomId),
        chatRoomMessageLister = ChatRoomMessageLister(chatRoomId: chatRoomId),
        chatRoomMemberInquiry = ChatRoomMemberInquiry(
          chatRoomId: chatRoomId,
          memberId: memberId,
        ),
        chatRoomInquiry = ChatRoomInquiry(chatRoomId: chatRoomId);

  final int memberId;
  final int chatRoomId;

  final ChatRoomMemberLister chatRoomMemberLister;
  final ChatRoomMessageLister chatRoomMessageLister;
  final ChatRoomMemberInquiry chatRoomMemberInquiry;
  final ChatRoomInquiry chatRoomInquiry;
}
