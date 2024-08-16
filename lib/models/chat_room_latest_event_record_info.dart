import 'package:poc_chat_2/providers/ruejai_chat/entities/rue_jai_chat_room_latest_event_record_info_entity.dart';

class ChatRoomLatestEventRecordInfo {
  ChatRoomLatestEventRecordInfo({
    required this.messageRecordNumber,
    required this.roomManagementRecordNumber,
  });

  factory ChatRoomLatestEventRecordInfo.fromEntity(
    RueJaiChatRoomLatestEventRecordInfoEntity entity,
  ) {
    return ChatRoomLatestEventRecordInfo(
      messageRecordNumber: entity.latestMessageEventRecordNumber,
      roomManagementRecordNumber: entity.latestRoomManagementEventRecordNumber,
    );
  }

  final int messageRecordNumber;
  final int roomManagementRecordNumber;
}
