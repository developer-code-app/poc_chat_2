import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_chat_2/pages/chat_room/bloc/chat_room_page_bloc.dart';

class ChatRoomPage extends StatefulWidget {
  const ChatRoomPage({super.key});

  @override
  State<ChatRoomPage> createState() => _ChatRoomPageState();
}

class _ChatRoomPageState extends State<ChatRoomPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatRoomPageBloc, ChatRoomPageState>(
      builder: (context, state) {
        switch (state) {
          case InitialState():
            return Container();
          case LoadSuccessState():
            return Container();
        }
      },
    );
  }
}
