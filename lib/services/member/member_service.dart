import 'package:poc_chat_2/model_services/chat_room/chat_room_inquiry.dart';
import 'package:poc_chat_2/model_services/chat_room/member/chat_room_member_lister.dart';
import 'package:poc_chat_2/model_services/chat_room/member/inquiry.dart';
import 'package:poc_chat_2/model_services/chat_room/message/chat_room_message_lister.dart';
import 'package:poc_chat_2/repositories/local_chat_repository.dart';
import 'package:poc_chat_2/repositories/server_chat_repository.dart';

class MemberService {
  MemberService({
    required this.memberId,
    required this.chatRoomId,
    required this.localChatRepository,
    required this.serverChatRepository,
  })  : chatRoomMemberLister = ChatRoomMemberLister(
          chatRoomId: chatRoomId,
          localChatRepository: localChatRepository,
        ),
        chatRoomMessageLister = ChatRoomMessageLister(
          chatRoomId: chatRoomId,
          localChatRepository: localChatRepository,
        ),
        chatRoomMemberInquiry = ChatRoomMemberInquiry(
          chatRoomId: chatRoomId,
          memberId: memberId,
          localChatRepository: localChatRepository,
        ),
        chatRoomInquiry = ChatRoomInquiry(
          chatRoomId: chatRoomId,
          localChatRepository: localChatRepository,
        );

  final int memberId;
  final int chatRoomId;
  final LocalChatRepository localChatRepository;
  final ServerChatRepository serverChatRepository;

  final ChatRoomMemberLister chatRoomMemberLister;
  final ChatRoomMessageLister chatRoomMessageLister;
  final ChatRoomMemberInquiry chatRoomMemberInquiry;
  final ChatRoomInquiry chatRoomInquiry;
}
