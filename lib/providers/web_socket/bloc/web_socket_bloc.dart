import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_chat_2/models/events/recorded_event.dart';
import 'package:poc_chat_2/providers/ruejai_chat/entities/rue_jai_chat_recorded_event_entity.dart';
import 'package:poc_chat_2/providers/web_socket/entites/web_socket_response.dart';
import 'package:poc_chat_2/services/system_service.dart';

part 'web_socket_event.dart';
part 'web_socket_state.dart';

typedef _Event = WebSocketEvent;
typedef _State = WebSocketState;

class WebSocketBloc extends Bloc<_Event, _State> {
  WebSocketBloc({
    required this.setting,
    required this.systemService,
  }) : super(InitialState()) {
    on<ConnectingRequestedEvent>(_onConnectingRequestedEvent);
    on<ConnectedEvent>(_onConnectedEvent);
    on<ErrorOccurredEvent>(_onErrorOccurredEvent);
  }

  final WebSocketSetting setting;
  final SystemService systemService;

  bool get isConnected {
    final state = this.state;

    return state is ConnectionSuccessState &&
        state.webSocket.readyState == WebSocket.open;
  }

  Future<void> _onConnectingRequestedEvent(
    ConnectingRequestedEvent event,
    Emitter<_State> emit,
  ) async {
    emit(ConnectingState());
    unawaited(_connect());
  }

  Future<void> _onConnectedEvent(
    ConnectedEvent event,
    Emitter<_State> emit,
  ) async {
    final webSocket = event.webSocket;
    emit(ConnectionSuccessState(webSocket));

    webSocket.listen(
      (data) => _handleWebSocketListener(data),
      onError: () => _reconnect(webSocket),
      onDone: () => _reconnect(webSocket),
    );

    unawaited(systemService.syncChatRooms());
  }

  Future<void> _onErrorOccurredEvent(
    ErrorOccurredEvent event,
    Emitter<_State> emit,
  ) async {
    emit(ConnectionFailureState(event.error));

    print('Error: ${event.error.toString()}');
  }

  Future<void> _reconnect(WebSocket webSocket) async {
    if (webSocket.readyState == WebSocket.open) await webSocket.close();

    add(ConnectingRequestedEvent());
  }

  Future<void> _connect() async {
    try {
      final webSocket = await WebSocket.connect(
        setting.url,
        headers: setting.headers,
      );

      add(ConnectedEvent(webSocket));
    } on Exception catch (error) {
      add(ErrorOccurredEvent(error));
    }
  }

  void _handleWebSocketListener(String data) {
    final json = jsonDecode(data) as Json;
    final response = WebSocketResponse.fromJson(
      json,
      (fromJson) => RueJaiChatRecordedEventEntity.fromJson(fromJson as Json),
    );
    final recordedEvent = RecordedEvent.fromEntity(entity: response.payload);

    systemService.processRecordedEvent(
      chatRoomId: response.chatRoomId,
      recordedEvent: recordedEvent,
    );
  }
}

class WebSocketSetting {
  WebSocketSetting({
    required this.url,
    this.headers,
  });

  final String url;
  final Map<String, dynamic>? headers;
}
