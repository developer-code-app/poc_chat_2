import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dfunc/dfunc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_chat_2/broadcaster/broadcaster.dart' as broadcaster;
import 'package:poc_chat_2/cubits/alert_dialog_cubit.dart';
import 'package:poc_chat_2/models/events/recorded_event.dart';
import 'package:poc_chat_2/preference_keys.dart';
import 'package:poc_chat_2/providers/ruejai_chat/entities/rue_jai_chat_recorded_event_entity.dart';
import 'package:poc_chat_2/providers/ruejai_chat/interceptors/authentication_interceptor.dart';
import 'package:poc_chat_2/providers/web_socket/entites/web_socket_response.dart';
import 'package:poc_chat_2/providers/web_socket/requests/web_socket_sending_message_added_request.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'web_socket_event.dart';
part 'web_socket_state.dart';

typedef _Event = WebSocketEvent;
typedef _State = WebSocketState;

class WebSocketBloc extends Bloc<_Event, _State> {
  WebSocketBloc({
    required this.url,
    required this.alertDialogCubit,
  }) : super(InitialState()) {
    on<ConnectingRequestedEvent>(_onConnectingRequestedEvent);
    on<ConnectedEvent>(_onConnectedEvent);
    on<ErrorOccurredEvent>(_onErrorOccurredEvent);

    broadcaster.Broadcaster.instance.stream.listen(
      _onBroadcasterMessageReceived,
    );
  }

  final String url;
  final AlertDialogCubit alertDialogCubit;

  bool get isConnected {
    final state = this.state;

    return state is ConnectionSuccessState &&
        state.webSocket.readyState == WebSocket.open;
  }

  WebSocket? get _webSocket {
    final state = this.state;

    return state is ConnectionSuccessState ? state.webSocket : null;
  }

  void _onBroadcasterMessageReceived(broadcaster.BroadcasterMessage message) {
    switch (message) {
      case broadcaster.WebSocketMessageSent():
        _onWebSocketMessageSent(message);
        break;
    }
  }

  void _onWebSocketMessageSent(broadcaster.WebSocketMessageSent message) {
    final request = WebSocketSendingMessageAddedRequest.fromModel(message);

    _webSocket?.add(json.encode(request.toJson()));
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

    alertDialogCubit.snackBar(title: 'Web Socket Connected');
    broadcaster.Broadcaster.instance.add(broadcaster.WebSocketConnected());

    webSocket.listen(
      (data) => _handleWebSocketListener(data),
      onError: (_) => _reconnect(webSocket),
      onDone: () => _reconnect(webSocket),
    );
  }

  Future<void> _onErrorOccurredEvent(
    ErrorOccurredEvent event,
    Emitter<_State> emit,
  ) async {
    emit(ConnectionFailureState(event.error));

    alertDialogCubit.snackBar(title: event.error.toString());
  }

  Future<void> _reconnect(WebSocket webSocket) async {
    if (webSocket.readyState == WebSocket.open) await webSocket.close();

    add(ConnectingRequestedEvent());
  }

  Future<void> _connect() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final headers = prefs
          .getString(AuthPreferenceKeys.accessToken)
          ?.let((token) => AuthorizationHeader(token: token))
          .let((header) => [header.mapEntry])
          .let(Map<String, dynamic>.fromEntries);
      final webSocket = await WebSocket.connect(
        url,
        headers: headers,
      );

      add(ConnectedEvent(webSocket));
    } on Exception catch (error) {
      add(ErrorOccurredEvent(error));
    }
  }

  void _handleWebSocketListener(String data) {
    try {
      final json = jsonDecode(data) as Json;
      final response = WebSocketResponse.fromJson(
        json,
        (fromJson) => RueJaiChatRecordedEventEntity.fromJson(fromJson as Json),
      );
      final recordedEvent = RecordedEvent.fromEntity(entity: response.payload);

      broadcaster.Broadcaster.instance.add(broadcaster.WebSocketMessageReceived(
        chatRoomId: response.chatRoomId,
        recordedEvent: recordedEvent,
      ));
    } on Exception catch (error) {
      alertDialogCubit.snackBar(title: error.toString());
    }
  }
}
