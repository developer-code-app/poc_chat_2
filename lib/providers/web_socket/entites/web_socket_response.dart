import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'web_socket_response.g.dart';

typedef Json = Map<String, dynamic>;

@JsonSerializable(createToJson: false, genericArgumentFactories: true)
class WebSocketResponse<T extends Equatable> extends Equatable {
  const WebSocketResponse(
    this.type,
    this.chatRoomId,
    this.payload,
  );

  factory WebSocketResponse.fromJson(
    Json json,
    T Function(Object? json) fromJson,
  ) =>
      _$WebSocketResponseFromJson(json, fromJson);

  final Type type;
  final String chatRoomId;
  final T payload;

  @override
  List<Object> get props => [type, chatRoomId, payload];
}

enum Type {
  @JsonValue('EVENT')
  event;
}
