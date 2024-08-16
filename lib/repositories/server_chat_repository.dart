import 'package:poc_chat_2/models/chat_room_latest_event_record_info.dart';
import 'package:poc_chat_2/models/events/event.dart';

import 'package:poc_chat_2/models/events/message_event.dart';
import 'package:poc_chat_2/models/events/read_event.dart';
import 'package:poc_chat_2/models/events/recorded_event.dart';
import 'package:poc_chat_2/models/events/room_management_event.dart';
import 'package:poc_chat_2/providers/rue_jai_chat_archive/ruejai_chat_provider.dart';
import 'package:poc_chat_2/providers/ruejai_chat/ruejai_chat_provider.dart';

class ServerChatRepository {
  ServerChatRepository({
    required this.chatApiProvider,
    required this.chatArchiveProvider,
  });

  final RuejaiChatApiProvider chatApiProvider;
  final RuejaiChatArchiveProvider chatArchiveProvider;

  Future<ChatRoomLatestEventRecordInfo> getChatRoomLatestEventRecordInfo({
    required int chatRoomId,
  }) async {
    return chatApiProvider.chat
        .getChatRoomLatestEventRecordInfo(chatRoomId)
        .then((response) => response.result)
        .then((entity) => ChatRoomLatestEventRecordInfo.fromEntity(entity));
  }

  Future<List<int>> getAllChatRoomIds() async {
    return chatApiProvider.chat
        .getChatRooms()
        .then((response) => response.result);
  }

  Future<List<String>> getChatRoomEventFileUrls({
    required int chatRoomId,
    required ChatRoomEventType eventType,
    required int startEventRecordNumber,
  }) async {
    return chatApiProvider.chat
        .getChatRoomEventFileUrls(
          chatRoomId,
          eventType.toString(),
          startEventRecordNumber,
        )
        .then((response) => response.result);
  }

  Future<List<RecordedEvent>> getChatRoomEventsFromUrl({
    required String url,
  }) async {
    return chatArchiveProvider.event
        .getChatRoomEventsFromUrl(url)
        .then((response) => response.result)
        .then((entities) => entities
            .map((entity) => RecordedEvent.fromEntity(entity: entity))
            .toList());
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
