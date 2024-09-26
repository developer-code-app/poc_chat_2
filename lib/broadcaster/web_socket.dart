part of 'broadcaster.dart';

sealed class WebSocket extends BroadcasterMessage {}

class WebSocketConnected extends WebSocket {}

class WebSocketMessageReceived extends WebSocket {
  WebSocketMessageReceived({
    required this.chatRoomId,
    required this.recordedEvent,
  });

  final int chatRoomId;
  final RecordedEvent recordedEvent;
}

class WebSocketMessageSent extends WebSocket {
  WebSocketMessageSent({
    required this.chatRoomId,
    required this.message,
  });

  final int chatRoomId;
  final Message message;
}
