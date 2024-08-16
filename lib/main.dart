import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:poc_chat_2/cubits/alert_dialog_cubit.dart';
import 'package:poc_chat_2/extensions/alert_dialog_convenience_showing.dart';
import 'package:poc_chat_2/flavor_constants.dart';
import 'package:poc_chat_2/mock_data.dart';
import 'package:poc_chat_2/models/events/recorded_event.dart';
import 'package:poc_chat_2/pages/chats/bloc/chats_page_bloc.dart';
import 'package:poc_chat_2/pages/chats/chats_page.dart';
import 'package:poc_chat_2/preference_keys.dart';
import 'package:poc_chat_2/providers/isar_storage/isar_storage_provider.dart';
import 'package:poc_chat_2/providers/rue_jai_chat_archive/ruejai_chat_provider.dart';
import 'package:poc_chat_2/providers/ruejai_chat/entities/rue_jai_chat_recorded_event_entity.dart';
import 'package:poc_chat_2/providers/ruejai_chat/ruejai_chat_provider.dart';
import 'package:poc_chat_2/repositories/local_chat_repository.dart';
import 'package:poc_chat_2/repositories/server_chat_repository.dart';
import 'package:poc_chat_2/services/member/member_service.dart';
import 'package:poc_chat_2/services/rue_jai_user_service.dart';
import 'package:poc_chat_2/widgets/action_sheet.dart' as action_sheet;
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FlavorConfig(
    variables: {
      FlavorVariableKeys.ruejaiChatApiBaseUrl: 'https://baanruejai.com/',
      FlavorVariableKeys.webSocketBaseUrl: 'https://baanruejai.com/',
    },
  );

  final prefs = await SharedPreferences.getInstance();

  prefs.setString(
    AuthPreferenceKeys.accessToken,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbklkIjoiTU9DS19CUkpfVVNFUl9BQ0NFU1NfVE9LRU5fSUQiLCJpZCI6IjI2NDEzIiwidHlwZSI6IkJSSl9VU0VSX0FDQ0VTU19UT0tFTiIsImlhdCI6MTcyMzYxMDc5MywiZXhwIjoxNzIzNjE0MzkzfQ.cvuPBranlznMKbSa3LVJBFXyv6_AJT6Yh5NVLqCw1ZM',
  );

  final ruejaiChatApiProvider = RuejaiChatApiProvider.basic(
    prefs: prefs,
  );
  final ruejaiChatArchiveProvider = RuejaiChatArchiveProvider.basic(
    prefs: prefs,
  );
  final isarProvider = IsarStorageProvider.basic();

  runApp(MultiRepositoryProvider(
    providers: [
      RepositoryProvider<LocalChatRepository>(
        create: (context) => LocalChatRepository(
          provider: isarProvider,
        ),
      ),
      RepositoryProvider<ServerChatRepository>(
        create: (context) => ServerChatRepository(
          chatApiProvider: ruejaiChatApiProvider,
          chatArchiveProvider: ruejaiChatArchiveProvider,
        ),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final rueJaiUser = MockData.rueJaiUser;

  WebSocket? webSocket;

  Future<void> connect() async {
    if (webSocket?.readyState == WebSocket.open) return;

    try {
      webSocket = await WebSocket.connect(
        FlavorConfig.instance.variables[FlavorVariableKeys.webSocketBaseUrl],
      );
      webSocket?.listen(
        (jsonString) {
          final json = jsonDecode(jsonString) as Map<String, dynamic>;
          final entity = RueJaiChatRecordedEventEntity.fromJson(json);
          final recordedEvent = RecordedEvent.fromEntity(entity: entity);
        },
        onError: (_) => reconnected(),
        onDone: () {
          reconnected().then((_) => syncEvent());
        },
      );

      unawaited(syncEvent());
    } catch (error) {
      print('Error: ${error.toString()}');
    }
  }

  Future<void> reconnected() async {
    await disconnect().then((_) => connect());
  }

  Future<void> disconnect() async {
    if (webSocket?.readyState == WebSocket.open) {
      await webSocket?.close();
      webSocket = null;
    }
  }

  Future<void> syncEvent() async {
    // TODO: implement sync event.
  }

  @override
  void initState() {
    super.initState();

    connect();
  }

  @override
  void dispose() {
    super.dispose();

    disconnect();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RueJai Chat PoC',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<AlertDialogCubit>(
            create: (context) => AlertDialogCubit(),
          ),
          BlocProvider<ChatsPageBloc>(
            create: (context) => ChatsPageBloc(
              alertDialogCubit: context.read<AlertDialogCubit>(),
              rueJaiUserService: RueJaiUserService(
                rueJaiUser: rueJaiUser,
                localChatRepository: context.read<LocalChatRepository>(),
                serverChatRepository: context.read<ServerChatRepository>(),
              ),
              memberService: MemberService(
                chatRoomId: 1,
                memberId: 1,
                localChatRepository: context.read<LocalChatRepository>(),
                serverChatRepository: context.read<ServerChatRepository>(),
              ),
            )..add(StartedEvent()),
          ),
        ],
        child: MultiBlocListener(
          listeners: [
            BlocListener<AlertDialogCubit, AlertData?>(
              listener: (context, state) {
                if (state == null) return;
                _showAlertFromData(context, data: state);
              },
            ),
          ],
          child: const ChatsPage(),
        ),
      ),
    );
  }

  void _showAlertFromData(
    BuildContext context, {
    required AlertData data,
  }) {
    if (data is DialogData) {
      AlertDialogConvenienceShowing.showAlertDialog(
        context: context,
        title: data.title,
        message: data.message,
        remark: data.remark,
        actions: data.actions,
        onDismissed: data.onDismissed,
        dismissible: data.dismissible,
      );
    } else if (data is ActionSheetData) {
      action_sheet.ActionSheet(
        title: data.title,
        message: data.message,
        actions: data.actions
            .map(
              (action) => action_sheet.Action(
                action.title,
                () => action.onPressed?.call(),
              ),
            )
            .toList(),
        cancel: action_sheet.Action(
          data.cancelAction.title,
          () => data.cancelAction.onPressed?.call(),
        ),
      ).show(context);
    } else if (data is SnackBarData) {
      _showSnackBar(context, data: data);
    }
  }

  void _showSnackBar(
    BuildContext context, {
    required SnackBarData data,
  }) {
    final prefixIcon = data.prefixIcon;

    final snackBar = SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (prefixIcon != null) ...[
            prefixIcon,
            const SizedBox(width: 8),
          ],
          Flexible(
            child: Text(
              data.title,
              maxLines: 3,
            ),
          ),
          Visibility(
            visible: data.action != null,
            child: Expanded(
              child: GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).removeCurrentSnackBar();
                  data.action?.onPressed?.call();
                },
                child: Text(
                  data.action?.title ?? '',
                  textAlign: TextAlign.right,
                ),
              ),
            ),
          ),
        ],
      ),
    );

    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
