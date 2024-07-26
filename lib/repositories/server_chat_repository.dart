import 'package:poc_chat_2/models/chat_room_latest_event_record_info.dart';

import 'package:poc_chat_2/models/events/message_event.dart';
import 'package:poc_chat_2/models/events/read_event.dart';
import 'package:poc_chat_2/models/events/room_management_event.dart';
import 'package:poc_chat_2/models/forms/chat_room_form.dart';

class ServerChatRepository {
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

  Future<void> createChatRoom({required ChatRoomForm form}) async {}
}
