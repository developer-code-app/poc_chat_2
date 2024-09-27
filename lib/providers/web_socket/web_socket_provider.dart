import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:poc_chat_2/cubits/alert_dialog_cubit.dart';
import 'package:poc_chat_2/providers/web_socket/bloc/web_socket_bloc.dart';
import 'package:poc_chat_2/flavor_constants.dart';

abstract class WebSocketProvider {
  static WebSocketBloc createWebSocketBloc(BuildContext context) {
    return WebSocketBloc(
      url: FlavorConfig.instance.variables[FlavorVariableKeys.webSocketBaseUrl],
      alertDialogCubit: context.read<AlertDialogCubit>(),
    );
  }
}
