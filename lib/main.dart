import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_chat_2/mock_data.dart';
import 'package:poc_chat_2/pages/chats/bloc/chats_page_bloc.dart';
import 'package:poc_chat_2/pages/chats/chats_page.dart';
import 'package:poc_chat_2/providers/isar_storage/isar_storage_provider.dart';
import 'package:poc_chat_2/repositories/local_chat_repository.dart';
import 'package:poc_chat_2/repositories/server_chat_repository.dart';
import 'package:poc_chat_2/services/member/member_service.dart';
import 'package:poc_chat_2/services/rue_jai_user_service.dart';

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
        child: BlocProvider(
          create: (context) => ChatsPageBloc(
            rueJaiUserService: RueJaiUserService(
              rueJaiUser: MockData.rueJaiUser,
              localChatRepository: context.read<LocalChatRepository>(),
              serverChatRepository: context.read<ServerChatRepository>(),
            ),
            memberService: MemberService(
              chatRoomId: 1,
              rueJaiUser: MockData.rueJaiUser,
              memberId: 1,
              localChatRepository: context.read<LocalChatRepository>(),
            ),
          )..add(StartedEvent()),
          child: const ChatsPage(),
        ),
      ),
    );
  }
}
