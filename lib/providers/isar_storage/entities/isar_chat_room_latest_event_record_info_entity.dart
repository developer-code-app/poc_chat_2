import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'isar_chat_room_latest_event_record_info_entity.g.dart';

@JsonSerializable()
class IsarChatRoomLatestEventRecordInfo extends Equatable {
  const IsarChatRoomLatestEventRecordInfo({
    required this.latestRoomAndMessageEventRecordNumber,
  });

  factory IsarChatRoomLatestEventRecordInfo.fromJson(
          Map<String, dynamic> json) =>
      _$IsarChatRoomLatestEventRecordInfoFromJson(json);

  Map<String, dynamic> toJson() =>
      _$IsarChatRoomLatestEventRecordInfoToJson(this);

  final int latestRoomAndMessageEventRecordNumber;

  @override
  List<Object?> get props => [
        latestRoomAndMessageEventRecordNumber,
      ];
}
