import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_chat_2/models/events/recorded_event.dart';
import 'package:poc_chat_2/providers/ruejai_chat/entities/rue_jai_chat_recorded_event_entity.dart';

part 'web_socket_event.dart';
part 'web_socket_state.dart';

typedef _Event = WebSocketEvent;
typedef _State = WebSocketState;

class WebSocketBloc extends Bloc<_Event, _State> {
  WebSocketBloc({
    required this.setting,
  })  : _messageStreamController = StreamController.broadcast(),
        super(InitialState()) {
    on<ConnectingRequestedEvent>(_onConnectingRequestedEvent);
    on<ConnectedEvent>(_onConnectedEvent);
    on<ErrorOccurredEvent>(_onErrorOccurredEvent);
    on<ConnectingRetriedEvent>(_onConnectingRetriedEvent);
  }

  final WebSocketSetting setting;

  final StreamController<RecordedEvent> _messageStreamController;

  Stream<RecordedEvent> get messageStream => _messageStreamController.stream;

  Future<void> _onConnectingRequestedEvent(
    ConnectingRequestedEvent event,
    Emitter<_State> emit,
  ) async {
    emit(ConnectingState());
    unawaited(connect());
  }

  Future<void> _onConnectedEvent(
    ConnectedEvent event,
    Emitter<_State> emit,
  ) async {
    emit(ConnectionSuccessState(event.webSocket));

    event.webSocket.listen(
      (jsonString) {
        final json = jsonDecode(jsonString) as Map<String, dynamic>;
        final entity = RueJaiChatRecordedEventEntity.fromJson(json);
        final recordedEvent = RecordedEvent.fromEntity(entity: entity);

        _messageStreamController.add(recordedEvent);
      },
      onError: (_) => reconnected(),
      onDone: () {
        reconnected().then((_) => syncEvent());
      },
    );
  }

  Future<void> connect() async {
    // if (webSocket?.readyState == WebSocket.open) return;

    // try {
    //   webSocket = await WebSocket.connect(
    //     FlavorConfig.instance.variables[FlavorVariableKeys.webSocketBaseUrl],
    //   );
    //   webSocket?.listen(
    //     (jsonString) {
    //       final json = jsonDecode(jsonString) as Map<String, dynamic>;
    //       final entity = RueJaiChatRecordedEventEntity.fromJson(json);
    //       final recordedEvent = RecordedEvent.fromEntity(entity: entity);
    //     },
    //     onError: (_) => reconnected(),
    //     onDone: () {
    //       reconnected().then((_) => syncEvent());
    //     },
    //   );

    //   unawaited(syncEvent());
    // } catch (error) {
    //   print('Error: ${error.toString()}');
    // }
  }

  Future<void> syncEvent() async {
    // TODO: implement sync event.
  }

  Future<void> reconnected() async {
    await disconnect().then((_) => connect());
  }

  Future<void> disconnect() async {
    final state = this.state;

    if (state is ConnectionSuccessState &&
        state.webSocket.readyState == WebSocket.open) {
      await state.webSocket.close();
      // add disconnect state
    }
  }

  // Future<void> connect() async {
  //   if (webSocket?.readyState == WebSocket.open) return;

  //   try {
  //     webSocket = await WebSocket.connect(
  //       FlavorConfig.instance.variables[FlavorVariableKeys.webSocketBaseUrl],
  //     );
  //     webSocket?.listen(
  //       (jsonString) {
  //         final json = jsonDecode(jsonString) as Map<String, dynamic>;
  //         final entity = RueJaiChatRecordedEventEntity.fromJson(json);
  //         final recordedEvent = RecordedEvent.fromEntity(entity: entity);
  //       },
  //       onError: (_) => reconnected(),
  //       onDone: () {
  //         reconnected().then((_) => syncEvent());
  //       },
  //     );

  //     unawaited(syncEvent());
  //   } catch (error) {
  //     print('Error: ${error.toString()}');
  //   }
  // }

  // Future<void> syncEvent() async {
  //   // TODO: implement sync event.
  // }

  // Future<void> reconnected() async {
  //   await disconnect().then((_) => connect());
  // }

  // Future<void> disconnect() async {
  //   if (webSocket?.readyState == WebSocket.open) {
  //     await webSocket?.close();
  //     webSocket = null;
  //   }
  // }

  Future<void> _onErrorOccurredEvent(
    ErrorOccurredEvent event,
    Emitter<_State> emit,
  ) async {
    emit(ConnectionFailureState(event.error));
  }

  Future<void> _onConnectingRetriedEvent(
    ConnectingRetriedEvent event,
    Emitter<_State> emit,
  ) async {
    emit(ConnectingState());
    unawaited(connect());
  }

  // Future<void> connectWebSocket() async {
  //   try {
  //     final webSocket = await WebSocket.connect(
  //       setting.url,
  //       headers: setting.headers,
  //     );

  //     add(ConnectedEvent(webSocket));
  //   } on Exception catch (error) {
  //     add(ErrorOccurredEvent(error));
  //   }
  // }
}

class WebSocketSetting {
  WebSocketSetting({
    required this.url,
    this.headers,
  });

  final String url;
  final Map<String, dynamic>? headers;
}
