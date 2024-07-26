import 'package:dfunc/dfunc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_chat_2/extensions/alert_dialog_convenience_showing.dart';

import 'package:poc_chat_2/pages/chats/bloc/chats_page_bloc.dart';
import 'package:poc_chat_2/pages/chats/chats_page_presenter.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ChatsPageBloc>();
    final textEditingController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Chats"),
        actions: [
          TextButton(
            onPressed: () {
              AlertDialogConvenienceShowing.showAlertDialog(
                context: context,
                inputField: TextField(controller: textEditingController),
                actions: [
                  AlertAction('Cancel'),
                  AlertAction(
                    'Create Room',
                    shouldValidation: true,
                    onPressed: () => bloc.add(
                      CreateRoomRequestedEvent(
                        name: textEditingController.text,
                      ),
                    ),
                  ),
                ],
              );
            },
            child: const Icon(Icons.add),
          ),
          TextButton(
            onPressed: () => bloc.add(RefreshStartedEvent()),
            child: const Icon(Icons.refresh),
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
        : Column(
            children: presenter.chatRooms
                .map(_buildChatRoom)
                .intersperse(const Divider())
                .toList());
  }

  Widget _buildChatRoom(ChatRoomPresenter chatRoom) {
    final latestMessage = chatRoom.latestMessage;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Column(
            children: [
              Text(
                chatRoom.name,
                style: const TextStyle(color: Colors.black),
              ),
              if (latestMessage != null)
                Text(
                  latestMessage.text,
                  style: const TextStyle(color: Colors.grey),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
