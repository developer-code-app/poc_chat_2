import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rue_jai_chat_room_latest_event_record_info_entity.g.dart';

@JsonSerializable()
class RueJaiChatRoomLatestEventRecordInfoEntity extends Equatable {
  const RueJaiChatRoomLatestEventRecordInfoEntity({
    required this.latestMessageEventRecordNumber,
    required this.latestRoomManagementEventRecordNumber,
  });

  factory RueJaiChatRoomLatestEventRecordInfoEntity.fromJson(
          Map<String, dynamic> json) =>
      _$RueJaiChatRoomLatestEventRecordInfoEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RueJaiChatRoomLatestEventRecordInfoEntityToJson(this);

  final int latestMessageEventRecordNumber;
  final int latestRoomManagementEventRecordNumber;

  @override
  List<Object?> get props => [
        latestMessageEventRecordNumber,
        latestRoomManagementEventRecordNumber,
      ];
}
