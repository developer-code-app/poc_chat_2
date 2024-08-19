import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:poc_chat_2/providers/web_socket/bloc/web_socket_bloc.dart';
import 'package:poc_chat_2/flavor_constants.dart';
import 'package:poc_chat_2/repositories/local_chat_repository.dart';
import 'package:poc_chat_2/repositories/server_chat_repository.dart';
import 'package:poc_chat_2/services/system_service.dart';

abstract class WebSocketProvider {
  static WebSocketBloc createWebSocketBloc(BuildContext context) {
    final setting = WebSocketSetting(
      url: FlavorConfig.instance.variables[FlavorVariableKeys.webSocketBaseUrl],
    );

    return WebSocketBloc(
      setting: setting,
      systemService: SystemService(
        localChatRepository: context.read<LocalChatRepository>(),
        serverChatRepository: context.read<ServerChatRepository>(),
      ),
    );
  }
}
