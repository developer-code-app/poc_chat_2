import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rue_jai_chat_room_entity.g.dart';

@JsonSerializable()
class RueJaiChatRoomEntity extends Equatable {
  const RueJaiChatRoomEntity({
    required this.id,
    required this.name,
    this.thumbnailUrl,
  });

  factory RueJaiChatRoomEntity.fromJson(Map<String, dynamic> json) =>
      _$RueJaiChatRoomEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RueJaiChatRoomEntityToJson(this);

  final int id;
  final String name;
  final String? thumbnailUrl;

  @override
  List<Object?> get props => [
        id,
        name,
        thumbnailUrl,
      ];
}
