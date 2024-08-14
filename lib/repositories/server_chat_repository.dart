import 'package:poc_chat_2/models/chat_room_latest_event_record_info.dart';

import 'package:poc_chat_2/models/events/message_event.dart';
import 'package:poc_chat_2/models/events/read_event.dart';
import 'package:poc_chat_2/models/events/room_management_event.dart';
import 'package:poc_chat_2/providers/ruejai_chat/ruejai_chat_provider.dart';

class ServerChatRepository {
  ServerChatRepository({required this.provider});

  final RuejaiChatApiProvider provider;

  Future<ChatRoomLatestEventRecordInfo> getServerChatRoomLatestEventRecordInfo({
    required int chatRoomId,
  }) async {
    return ChatRoomLatestEventRecordInfo(
      messageRecordNumber: 0,
      roomManagementRecordNumber: 0,
    );
  }

  Future<void> publishMessageEvent({
    required int chatRoomId,
    required MessageEvent event,
  }) async {}

  Future<void> publishReadMessageEvent({
    required int chatRoomId,
    required ReadMessageEvent event,
  }) async {}

  Future<void> publishRoomManagementEvent({
    required int chatRoomId,
    required RoomManagementEvent event,
  }) async {}

  Future<void> publishCreateChatRoomEvent({
    required CreateRoomEvent event,
  }) async {}
}
