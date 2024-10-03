import 'package:poc_chat_2/models/chat_room_state.dart';
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

  Future<int> getChatRoomLatestRoomAndMessageEventRecordNumber({
    required String chatRoomId,
  }) async {
    return chatApiProvider.chat
        .getChatRoomLatestRoomAndMessageEventRecordNumber(chatRoomId)
        .then((response) => response.result);
  }

  Future<List<ChatRoomState>> getServerChatRoomStates() async {
    return chatApiProvider.chat.getServerChatRoomStates().then(
        (response) => response.result.map(ChatRoomState.fromEntity).toList());
  }

  Future<List<String>> getChatRoomEventArchiveUrls({
    required String chatRoomId,
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

  Future<ChatRoomState> publishCreateChatRoomEvent({
    required CreateRoomEvent event,
  }) async {
    final request = RuejaiChatCreateChatRoomRequest.fromEvent(event);

    return chatApiProvider.chat
        .createChatRoom(request)
        .then((response) => response.result)
        .then(ChatRoomState.fromEntity);
  }

  //  WS /chats
  Future<void> publishReadMessageEvent({
    required String chatRoomId,
    required ReadMessageEvent event,
  }) async {}

  //  WS /chats
  Future<void> publishRoomManagementEvent({
    required String chatRoomId,
    required RoomEvent event,
  }) async {}
}
