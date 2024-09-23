import 'package:json_annotation/json_annotation.dart';

part 'isar_add_chat_room_request.g.dart';

@JsonSerializable()
class IsarAddChatRoomRequest {
  IsarAddChatRoomRequest({
    required this.chatRoomId,
    required this.name,
    this.thumbnailUrl,
  });

  factory IsarAddChatRoomRequest.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$IsarAddChatRoomRequestFromJson(json);

  Map<String, dynamic> toJson() => _$IsarAddChatRoomRequestToJson(this);

  final int chatRoomId;
  final String name;
  final String? thumbnailUrl;
}
