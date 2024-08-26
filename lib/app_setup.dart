import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_chat_2/cubits/alert_dialog_cubit.dart';
import 'package:poc_chat_2/cubits/ui_blocking_cubit.dart';
import 'package:poc_chat_2/providers/rue_jai_chat_archive/ruejai_chat_provider.dart';
import 'package:poc_chat_2/providers/web_socket/bloc/web_socket_bloc.dart';
import 'package:poc_chat_2/providers/isar_storage/isar_storage_provider.dart';
import 'package:poc_chat_2/providers/ruejai_chat/ruejai_chat_api_provider.dart';
import 'package:poc_chat_2/providers/web_socket/web_socket_provider.dart';
import 'package:poc_chat_2/repositories/local_chat_repository.dart';
import 'package:poc_chat_2/repositories/server_chat_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> setupApp(Widget app, {bool isMock = false}) async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final ruejaiChatApiProvider = RuejaiChatApiProvider.basic(
    prefs: prefs,
  );
  final ruejaiChatArchiveProvider = RuejaiChatArchiveProvider.basic(
    prefs: prefs,
  );
  final localProvider = IsarStorageProvider.basic();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then(
    (value) => runApp(
      MultiRepositoryProvider(
        providers: [
          RepositoryProvider<LocalChatRepository>(
            create: (context) => LocalChatRepository(
              provider: localProvider,
            ),
          ),
          RepositoryProvider<ServerChatRepository>(
            create: (context) => ServerChatRepository(
              chatApiProvider: ruejaiChatApiProvider,
              chatArchiveProvider: ruejaiChatArchiveProvider,
            ),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<AlertDialogCubit>(
              create: (context) => AlertDialogCubit(),
            ),
            BlocProvider<UIBlockingCubit>(
              create: (context) => UIBlockingCubit(),
            ),
            const BlocProvider<WebSocketBloc>(
              create: WebSocketProvider.createWebSocketBloc,
            ),
          ],
          child: app,
        ),
      ),
    ),
  );
}
