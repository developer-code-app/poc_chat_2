import 'package:poc_chat_2/models/chat_room_latest_event_record_info.dart';

import 'package:poc_chat_2/models/events/message_event.dart';
import 'package:poc_chat_2/models/events/read_event.dart';
import 'package:poc_chat_2/models/events/room_management_event.dart';
import 'package:poc_chat_2/providers/ruejai_chat/ruejai_chat_provider.dart';

class ServerChatRepository {
  ServerChatRepository({required this.provider});

  final RuejaiChatApiProvider provider;

  // GET /chats/chat-rooms/{chatRoomId}/latest-event-record-info
  Future<ChatRoomLatestEventRecordInfo> getChatRoomLatestEventRecordInfo({
    required int chatRoomId,
  }) async {
    return ChatRoomLatestEventRecordInfo(
      messageRecordNumber: 0,
      roomManagementRecordNumber: 0,
    );
  }

  // GET /chats/chat-rooms
  Future<List<int>> getAllChatRoomIds() async {
    return [];
  }

  //  WS /chats
  Future<void> publishMessageEvent({
    required int chatRoomId,
    required MessageEvent event,
  }) async {}

  //  WS /chats
  Future<void> publishReadMessageEvent({
    required int chatRoomId,
    required ReadMessageEvent event,
  }) async {}

  //  WS /chats
  Future<void> publishRoomManagementEvent({
    required int chatRoomId,
    required RoomManagementEvent event,
  }) async {}

  //  WS /chats
  Future<void> publishCreateChatRoomEvent({
    required CreateRoomEvent event,
  }) async {}
}
