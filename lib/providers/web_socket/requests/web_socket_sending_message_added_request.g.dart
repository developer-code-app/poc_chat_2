// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_socket_sending_message_added_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WebSocketSendingMessageAddedRequest
    _$WebSocketSendingMessageAddedRequestFromJson(Map<String, dynamic> json) =>
        WebSocketSendingMessageAddedRequest(
          chatRoomId: (json['chat_room_id'] as num).toInt(),
          type: $enumDecode(_$WebSocketTypeEnumMap, json['type']),
          payload: WebSocketSendingMessagePayload.fromJson(
              json['payload'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$WebSocketSendingMessageAddedRequestToJson(
        WebSocketSendingMessageAddedRequest instance) =>
    <String, dynamic>{
      'chat_room_id': instance.chatRoomId,
      'type': _$WebSocketTypeEnumMap[instance.type]!,
      'payload': instance.payload,
    };

const _$WebSocketTypeEnumMap = {
  WebSocketType.event: 'EVENT',
};

WebSocketSendingMessagePayload _$WebSocketSendingMessagePayloadFromJson(
        Map<String, dynamic> json) =>
    WebSocketSendingMessagePayload(
      id: json['id'] as String,
      owner: OwnerRequest.fromJson(json['owner'] as Map<String, dynamic>),
      type: $enumDecode(_$EventTypeEnumMap, json['type']),
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$WebSocketSendingMessagePayloadToJson(
        WebSocketSendingMessagePayload instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner': instance.owner,
      'type': _$EventTypeEnumMap[instance.type]!,
      'created_at': instance.createdAt.toIso8601String(),
    };

const _$EventTypeEnumMap = {
  EventType.createTextMessage: 'CREATE_TEXT_MESSAGE',
  EventType.createTextReplyMessage: 'CREATE_TEXT_REPLY_MESSAGE',
  EventType.createPhotoMessage: 'CREATE_PHOTO_MESSAGE',
  EventType.createVideoMessage: 'CREATE_VIDEO_MESSAGE',
  EventType.createFileMessage: 'CREATE_FILE_MESSAGE',
  EventType.createHomeCareMessage: 'CREATE_HOME_CARE_MESSAGE',
  EventType.textEdited: 'TEXT_EDITED',
  EventType.deleteMessage: 'DELETE_MESSAGE',
  EventType.readMessage: 'READ_MESSAGE',
  EventType.createRoom: 'CREATE_ROOM',
  EventType.roleEdited: 'ROLE_EDITED',
  EventType.invite: 'INVITE',
  EventType.reject: 'REJECT',
};

WebSocketSendingTextMessagePayload _$WebSocketSendingTextMessagePayloadFromJson(
        Map<String, dynamic> json) =>
    WebSocketSendingTextMessagePayload(
      id: json['id'] as String,
      owner: OwnerRequest.fromJson(json['owner'] as Map<String, dynamic>),
      type: $enumDecode(_$EventTypeEnumMap, json['type']),
      createdAt: DateTime.parse(json['created_at'] as String),
      text: json['text'] as String,
    );

Map<String, dynamic> _$WebSocketSendingTextMessagePayloadToJson(
        WebSocketSendingTextMessagePayload instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner': instance.owner,
      'type': _$EventTypeEnumMap[instance.type]!,
      'created_at': instance.createdAt.toIso8601String(),
      'text': instance.text,
    };
