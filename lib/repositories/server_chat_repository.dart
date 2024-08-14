import 'package:poc_chat_2/models/chat_room_latest_event_record_info.dart';
import 'package:poc_chat_2/models/events/event.dart';

import 'package:poc_chat_2/models/events/message_event.dart';
import 'package:poc_chat_2/models/events/read_event.dart';
import 'package:poc_chat_2/models/events/room_management_event.dart';
import 'package:poc_chat_2/providers/ruejai_chat/ruejai_chat_provider.dart';

class ServerChatRepository {
  ServerChatRepository({required this.provider});

  final RuejaiChatApiProvider provider;

  Future<ChatRoomLatestEventRecordInfo> getChatRoomLatestEventRecordInfo({
    required int chatRoomId,
  }) async {
    return provider.chat
        .getChatRoomLatestEventRecordInfo(chatRoomId)
        .then((response) => response.result)
        .then((entity) => ChatRoomLatestEventRecordInfo.fromEntity(entity));
  }

  Future<List<int>> getAllChatRoomIds() async {
    return provider.chat.getChatRooms().then((response) => response.result);
  }

  Future<List<String>> getChatRoomEventFileUrls({
    required int chatRoomId,
    required ChatRoomEventType eventType,
    required int startEventRecordNumber,
  }) async {
    return provider.chat
        .getChatRoomEventFileUrls(
          chatRoomId,
          eventType.toString(),
          startEventRecordNumber,
        )
        .then((response) => response.result);
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
