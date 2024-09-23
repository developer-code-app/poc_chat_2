// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rue_jai_chat_room_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RueJaiChatRoomEntity _$RueJaiChatRoomEntityFromJson(
        Map<String, dynamic> json) =>
    RueJaiChatRoomEntity(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      thumbnailUrl: json['thumbnail_url'] as String?,
    );

Map<String, dynamic> _$RueJaiChatRoomEntityToJson(
    RueJaiChatRoomEntity instance) {
  final val = <String, dynamic>{
    'id': instance.id,
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
