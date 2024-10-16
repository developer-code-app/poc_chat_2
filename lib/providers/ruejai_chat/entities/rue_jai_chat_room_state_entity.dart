import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rue_jai_chat_room_state_entity.g.dart';

@JsonSerializable()
class RueJaiChatRoomStateEntity extends Equatable {
  const RueJaiChatRoomStateEntity({
    required this.id,
    required this.latestRoomAndMessageEventRecordNumber,
    required this.profileHash,
  });

  factory RueJaiChatRoomStateEntity.fromJson(Map<String, dynamic> json) =>
      _$RueJaiChatRoomStateEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RueJaiChatRoomStateEntityToJson(this);

  final int id;
  final int latestRoomAndMessageEventRecordNumber;
  final String profileHash;

  @override
  List<Object?> get props => [
        id,
        latestRoomAndMessageEventRecordNumber,
        profileHash,
      ];
}
