import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:poc_chat_2/pages/chats/bloc/chats_page_bloc.dart';
import 'package:poc_chat_2/pages/chats/chats_page_presenter.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ChatsPageBloc>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Chats"),
        actions: [
          TextButton(
            onPressed: () => bloc.add(RefreshStartedEvent()),
            child: const Text('Reload'),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<ChatsPageBloc, ChatsPageState>(
            builder: (context, state) {
              switch (state) {
                case InitialState():
                  return const Center(child: Text("Initial State"));
                case LoadInProgressState():
                  return const Center(child: CircularProgressIndicator());
                case LoadSuccessState():
                  return _buildLoadSuccess(context, state.presenter);
                case LoadFailureState():
                  return Text(state.error.toString());
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildLoadSuccess(
    BuildContext context,
    ChatsPagePresenter presenter,
  ) {
    final shouldShowPlaceholder = presenter.chatRooms.isEmpty;

    return shouldShowPlaceholder
        ? const Center(child: Text('Rooms not found.'))
        : Column(children: presenter.chatRooms.map(_buildChatRoom).toList());
  }

  Widget _buildChatRoom(ChatRoomPresenter chatRoom) {
    final latestMessage = chatRoom.latestMessage;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Column(
            children: [
              Text(chatRoom.name),
              if (latestMessage != null) Text(latestMessage.text),
            ],
          ),
        ],
      ),
    );
  }
}
