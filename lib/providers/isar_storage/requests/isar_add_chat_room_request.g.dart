// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_add_chat_room_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IsarAddChatRoomRequest _$IsarAddChatRoomRequestFromJson(
        Map<String, dynamic> json) =>
    IsarAddChatRoomRequest(
      chatRoomId: (json['chat_room_id'] as num).toInt(),
      name: json['name'] as String,
      thumbnailUrl: json['thumbnail_url'] as String?,
    );

Map<String, dynamic> _$IsarAddChatRoomRequestToJson(
    IsarAddChatRoomRequest instance) {
  final val = <String, dynamic>{
    'chat_room_id': instance.chatRoomId,
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('thumbnail_url', instance.thumbnailUrl);
  return val;
}
