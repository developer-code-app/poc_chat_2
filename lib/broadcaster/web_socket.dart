part of 'broadcaster.dart';

sealed class WebSocket extends BroadcasterMessage {}

class WebSocketConnected extends WebSocket {}

class WebSocketMessageReceived extends WebSocket {
  WebSocketMessageReceived({
    required this.chatRoomId,
    required this.recordedEvent,
  });

  final String chatRoomId;
  final RecordedEvent recordedEvent;
}

class WebSocketMessageSent extends WebSocket {
  WebSocketMessageSent({
    required this.chatRoomId,
    required this.message,
    required this.createdByEventId,
  });

  final String chatRoomId;
  final Message message;
  final String createdByEventId;
}
