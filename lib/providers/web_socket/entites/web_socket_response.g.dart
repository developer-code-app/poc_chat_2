// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_socket_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WebSocketResponse<T> _$WebSocketResponseFromJson<T extends Equatable>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    WebSocketResponse<T>(
      $enumDecode(_$TypeEnumMap, json['type']),
      json['chat_room_id'] as String,
      fromJsonT(json['payload']),
    );

const _$TypeEnumMap = {
  Type.event: 'event',
};
