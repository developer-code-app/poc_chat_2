import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_chat_2/cubits/alert_dialog_cubit.dart';
import 'package:poc_chat_2/extensions/alert_dialog_convenience_showing.dart';
import 'package:poc_chat_2/mock_data.dart';
import 'package:poc_chat_2/pages/chats/bloc/chats_page_bloc.dart';
import 'package:poc_chat_2/pages/chats/chats_page.dart';
import 'package:poc_chat_2/providers/isar_storage/isar_storage_provider.dart';
import 'package:poc_chat_2/repositories/local_chat_repository.dart';
import 'package:poc_chat_2/repositories/server_chat_repository.dart';
import 'package:poc_chat_2/services/member/member_service.dart';
import 'package:poc_chat_2/services/rue_jai_user_service.dart';
import 'package:poc_chat_2/widgets/action_sheet.dart' as action_sheet;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<LocalChatRepository>(
            create: (context) => LocalChatRepository(
              provider: IsarStorageProvider.basic(),
            ),
          ),
          RepositoryProvider<ServerChatRepository>(
            create: (context) => ServerChatRepository(),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<AlertDialogCubit>(
              create: (context) => AlertDialogCubit(),
            ),
            BlocProvider<ChatsPageBloc>(
              create: (context) => ChatsPageBloc(
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
