import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_chat_2/pages/chats/bloc/chats_page_bloc.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chats"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<ChatsPageBloc, ChatsPageState>(
          builder: (context, state) {
            switch (state) {
              case InitialState():
                return const Text("initial state");
              case LoadInProgressState():
                return const Text("loading");
              case LoadSuccessState():
                return const Text("success");
              case LoadFailureState():
                return const Text("failure");
            }
          },
        ),
      ),
    );
  }
}
