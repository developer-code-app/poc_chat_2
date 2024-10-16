part of 'web_socket_bloc.dart';

sealed class WebSocketEvent {}

class ConnectingRequestedEvent extends WebSocketEvent {}

class ConnectedEvent extends WebSocketEvent {
  ConnectedEvent(this.webSocket);

  final WebSocket webSocket;
}

class ErrorOccurredEvent extends WebSocketEvent {
  ErrorOccurredEvent(this.error);

  final Exception error;
}
