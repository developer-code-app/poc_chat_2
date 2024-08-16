part of 'web_socket_bloc.dart';

sealed class WebSocketState {
  const WebSocketState();
}

class InitialState extends WebSocketState {}

class ConnectingState extends WebSocketState {}

class ConnectionSuccessState extends WebSocketState {
  ConnectionSuccessState(this.webSocket);

  final WebSocket webSocket;
}

class ConnectionFailureState extends WebSocketState {
  ConnectionFailureState(this.error);

  final Exception error;
}
