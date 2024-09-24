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
