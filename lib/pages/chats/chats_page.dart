import 'package:dfunc/dfunc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_chat_2/cubits/assets_picker_cubit.dart';
import 'package:poc_chat_2/cubits/photos_clipboard_cubit.dart';
import 'package:poc_chat_2/cubits/reply_message_cubit.dart';
import 'package:poc_chat_2/extensions/alert_dialog_convenience_showing.dart';
import 'package:poc_chat_2/models/chat_room.dart';
import 'package:poc_chat_2/pages/chat_room/bloc/chat_room_page_bloc.dart'
    as chat_room_bloc;
import 'package:poc_chat_2/pages/chat_room/chat_room_page.dart';
import 'package:poc_chat_2/pages/chats/bloc/chats_page_bloc.dart';
import 'package:poc_chat_2/pages/chats/chats_page_presenter.dart';
import 'package:poc_chat_2/providers/isar_storage/isar_storage_provider.dart';
import 'package:poc_chat_2/repositories/local_chat_repository.dart';
import 'package:poc_chat_2/repositories/server_chat_repository.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({super.key});

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
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
                  return _buildLoadSuccess(context, state);
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
    LoadSuccessState state,
  ) {
    final shouldShowPlaceholder = state.presenter.chatRooms.isEmpty;

    if (shouldShowPlaceholder) {
      return const Center(child: Text('Rooms not found.'));
    } else {
      return Column(
        children: state.presenter.chatRooms
            .map(
              (presenter) {
                final chatRoom = state.chatRoomWithUnreadMessageCounts
                    .firstWhere((element) => element.$1.id == presenter.id)
                    .$1;

                return _buildChatRoom(presenter, chatRoom);
              },
            )
            .intersperse(const Divider())
            .toList(),
      );
    }
  }

  Widget _buildChatRoom(
    ChatRoomPresenter presenter,
    ChatRoom chatRoom,
  ) {
    final latestMessage = presenter.latestMessage;

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => _navigationToChatRoomPage(chatRoom),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Column(
              children: [
                Text(
                  presenter.name,
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
      ),
    );
  }

  void _navigationToChatRoomPage(ChatRoom chatRoom) {
    final bloc = context.read<ChatsPageBloc>();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MultiRepositoryProvider(
          providers: [
            RepositoryProvider<LocalChatRepository>(
              create: (context) => LocalChatRepository(
                provider: IsarStorageProvider.basic(),
              ),
            ),
            BlocProvider<AssetsPickerCubit>(
              create: (context) => AssetsPickerCubit(),
            ),
            BlocProvider<ReplyMessageCubit>(
              create: (context) => ReplyMessageCubit(),
            ),
            BlocProvider<PhotosClipboardCubit>(
              create: (context) => PhotosClipboardCubit(),
            ),
          ],
          child: MultiBlocProvider(
            providers: [
              BlocProvider<chat_room_bloc.ChatRoomPageBloc>(
                create: (context) => chat_room_bloc.ChatRoomPageBloc(
                  serverChatRepository: context.read<ServerChatRepository>(),
                  localChatRepository: context.read<LocalChatRepository>(),
                  assetsPickerCubit: context.read<AssetsPickerCubit>(),
                  alertDialogCubit: bloc.alertDialogCubit,
                  replyMessageCubit: context.read<ReplyMessageCubit>(),
                  photosClipboardCubit: context.read<PhotosClipboardCubit>(),
                  chatRoom: chatRoom,
                )..add(chat_room_bloc.StartedEvent()),
              ),
            ],
            child: const ChatRoomPage(),
          ),
        ),
      ),
    );
  }
}
