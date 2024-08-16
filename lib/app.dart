import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_chat_2/cubits/alert_dialog_cubit.dart';
import 'package:poc_chat_2/extensions/alert_dialog_convenience_showing.dart';
import 'package:poc_chat_2/mock_data.dart';
import 'package:poc_chat_2/pages/chats/bloc/chats_page_bloc.dart';
import 'package:poc_chat_2/pages/chats/chats_page.dart';
import 'package:poc_chat_2/preference_keys.dart';
import 'package:poc_chat_2/providers/web_socket/bloc/web_socket_bloc.dart';
import 'package:poc_chat_2/repositories/local_chat_repository.dart';
import 'package:poc_chat_2/repositories/server_chat_repository.dart';
import 'package:poc_chat_2/services/member/member_service.dart';
import 'package:poc_chat_2/services/rue_jai_user_service.dart';
import 'package:poc_chat_2/widgets/action_sheet.dart' as action_sheet;
import 'package:shared_preferences/shared_preferences.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RueJai Chat PoC',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MultiBlocListener(
        listeners: [
          BlocListener<AlertDialogCubit, AlertData?>(
            listener: (context, state) {
              if (state == null) return;
              _showAlertFromData(context, data: state);
            },
          ),
        ],
        child: const _BaseApp(),
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

class _BaseApp extends StatefulWidget {
  const _BaseApp({super.key});

  @override
  State<_BaseApp> createState() => __BaseAppState();
}

class __BaseAppState extends State<_BaseApp> {
  WebSocket? webSocket;

  Future<void> saveAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    /* Account: notetest@gmail.com */
    // prefs.setString(
    //   AuthPreferenceKeys.accessToken,
    //   'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbklkIjoiTU9DS19CUkpfVVNFUl9BQ0NFU1NfVE9LRU5fSUQiLCJpZCI6IjI2NDE0IiwidHlwZSI6IkJSSl9VU0VSX0FDQ0VTU19UT0tFTiIsImlhdCI6MTcyMzYxMTAwNSwiZXhwIjoxNzIzNjE0NjA1fQ.N7Rpza5befZGYI2zvtASJuQR7KH9bOTQDmW-hFzJBA8',
    // );

    /* Account: 901@gmail.com */
    prefs.setString(
      AuthPreferenceKeys.accessToken,
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbklkIjoiTU9DS19CUkpfVVNFUl9BQ0NFU1NfVE9LRU5fSUQiLCJpZCI6IjI2NDEzIiwidHlwZSI6IkJSSl9VU0VSX0FDQ0VTU19UT0tFTiIsImlhdCI6MTcyMzYxMDc5MywiZXhwIjoxNzIzNjE0MzkzfQ.cvuPBranlznMKbSa3LVJBFXyv6_AJT6Yh5NVLqCw1ZM',
    );
  }

  @override
  void initState() {
    super.initState();

    saveAccessToken();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ChatsPageBloc>(
          create: (context) => ChatsPageBloc(
            webSocketBloc: context.read<WebSocketBloc>(),
            alertDialogCubit: context.read<AlertDialogCubit>(),
            rueJaiUserService: RueJaiUserService(
              rueJaiUser: MockData.rueJaiUser,
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
        )
      ],
      child: const ChatsPage(),
    );
  }
}
