import 'package:json_annotation/json_annotation.dart';
import 'package:poc_chat_2/broadcaster/broadcaster.dart';
import 'package:poc_chat_2/models/event_type.dart';
import 'package:poc_chat_2/models/messages/message.dart';
import 'package:poc_chat_2/models/web_socket_type.dart';
import 'package:poc_chat_2/providers/ruejai_chat/requests/ruejai_chat_create_chat_room_request.dart';

part 'web_socket_sending_message_added_request.g.dart';

@JsonSerializable()
class WebSocketSendingMessageAddedRequest {
  WebSocketSendingMessageAddedRequest({
    required this.chatRoomId,
    required this.type,
    required this.payload,
  });

  factory WebSocketSendingMessageAddedRequest.fromModel(
    WebSocketMessageSent socketMessage,
  ) {
    final message = socketMessage.message;

    switch (message) {
      case MemberTextMessage():
        return WebSocketSendingMessageAddedRequest(
          chatRoomId: socketMessage.chatRoomId,
          type: WebSocketType.event,
          payload: WebSocketSendingTextMessagePayload.fromModel(
            createdByEventId: socketMessage.createdByEventId,
            message: message,
          ),
        );
      default:
        throw UnimplementedError('Unimplemented');
    }
  }

  factory WebSocketSendingMessageAddedRequest.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$WebSocketSendingMessageAddedRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$WebSocketSendingMessageAddedRequestToJson(this);

  final String chatRoomId;
  final WebSocketType type;
  final WebSocketSendingMessagePayload payload;
}

@JsonSerializable()
class WebSocketSendingMessagePayload {
  WebSocketSendingMessagePayload({
    required this.id,
    required this.owner,
    required this.type,
    required this.createdAt,
  });

  factory WebSocketSendingMessagePayload.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$WebSocketSendingMessagePayloadFromJson(json);

  Map<String, dynamic> toJson() => _$WebSocketSendingMessagePayloadToJson(this);

  final String id;
  final OwnerRequest owner;
  final EventType type;
  final DateTime createdAt;
}

@JsonSerializable()
class WebSocketSendingTextMessagePayload
    extends WebSocketSendingMessagePayload {
  WebSocketSendingTextMessagePayload({
    required super.id,
    required super.owner,
    required super.type,
    required super.createdAt,
    required this.text,
  });

  factory WebSocketSendingTextMessagePayload.fromModel({
    required String createdByEventId,
    required MemberTextMessage message,
  }) {
    return WebSocketSendingTextMessagePayload(
      id: createdByEventId,
      owner: OwnerRequest(
        rueJaiUserId: message.owner.rueJaiUser.rueJaiUserId,
        rueJaiUserType: message.owner.rueJaiUser.rueJaiUserType,
      ),
      type: EventType.createTextMessage,
      createdAt: message.createdAt,
      text: message.text!,
    );
  }

  factory WebSocketSendingTextMessagePayload.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$WebSocketSendingTextMessagePayloadFromJson(json);

  Map<String, dynamic> toJson() =>
      _$WebSocketSendingTextMessagePayloadToJson(this);

  final String text;
}
