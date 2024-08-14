import 'package:json_annotation/json_annotation.dart';

part 'rue_jai_chat_room_latest_event_record_info_entity.g.dart';

@JsonSerializable()
class RueJaiChatRoomLatestEventRecordInfoEntity {
  RueJaiChatRoomLatestEventRecordInfoEntity({
    required this.latestMessageEventRecordNumber,
    required this.latestRoomManagementEventRecordNumber,
  });

  factory RueJaiChatRoomLatestEventRecordInfoEntity.fromJson(
          Map<String, dynamic> json) =>
      _$RueJaiLatestEventRecordInfoEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RueJaiLatestEventRecordInfoEntityToJson(this);

  final int latestMessageEventRecordNumber;
  final int latestRoomManagementEventRecordNumber;
}
