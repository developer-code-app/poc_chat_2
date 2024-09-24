import 'package:poc_chat_2/models/chat_room.dart';
import 'package:poc_chat_2/models/chat_room_latest_event_record_info.dart';
import 'package:poc_chat_2/models/events/read_event.dart';
import 'package:poc_chat_2/models/events/recorded_event.dart';
import 'package:poc_chat_2/models/events/room_event.dart';
import 'package:poc_chat_2/providers/rue_jai_chat_archive/ruejai_chat_provider.dart';
import 'package:poc_chat_2/providers/ruejai_chat/requests/ruejai_chat_create_chat_room_request.dart';
import 'package:poc_chat_2/providers/ruejai_chat/ruejai_chat_api_provider.dart';

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
        .then(ChatRoomLatestEventRecordInfo.fromEntity);
  }

  Future<List<ChatRoom>> getAllChatRooms() async {
    return chatApiProvider.chat
        .getChatRooms()
        .then((response) => response.result.map(ChatRoom.fromEntity).toList());
  }

  Future<List<String>> getChatRoomEventArchiveUrls({
    required int chatRoomId,
    required int startEventRecordNumber,
  }) async {
    return chatApiProvider.chat
        .getChatRoomEventArchiveUrls(
          chatRoomId,
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

  Future<ChatRoom> publishCreateChatRoomEvent({
    required CreateRoomEvent event,
  }) async {
    final request = RuejaiChatCreateChatRoomRequest.fromEvent(event);

    return chatApiProvider.chat
        .createChatRoom(request)
        .then((response) => response.result)
        .then(ChatRoom.fromEntity);
  }

  //  WS /chats
  Future<void> publishReadMessageEvent({
    required int chatRoomId,
    required ReadMessageEvent event,
  }) async {}

  //  WS /chats
  Future<void> publishRoomManagementEvent({
    required int chatRoomId,
    required RoomEvent event,
  }) async {}
}
