import 'package:dfunc/dfunc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_chat_2/cubits/assets_picker_cubit.dart';
import 'package:poc_chat_2/cubits/photos_clipboard_cubit.dart';
import 'package:poc_chat_2/cubits/reply_message_cubit.dart';
import 'package:poc_chat_2/cubits/ui_blocking_cubit.dart';
import 'package:poc_chat_2/extensions/alert_dialog_convenience_showing.dart';
import 'package:poc_chat_2/extensions/extended_date_time.dart';
import 'package:poc_chat_2/extensions/extended_nullable.dart';
import 'package:poc_chat_2/mock_data.dart';
import 'package:poc_chat_2/model_services/chat_room/event/chat_room_event_creator.dart';
import 'package:poc_chat_2/models/chat_room.dart';
import 'package:poc_chat_2/pages/chat_room/bloc/chat_room_page_bloc.dart'
    as chat_room_bloc;
import 'package:poc_chat_2/pages/chat_room/chat_room_page.dart';
import 'package:poc_chat_2/pages/chats/bloc/chats_page_bloc.dart';
import 'package:poc_chat_2/pages/chats/chats_page_presenter.dart';
import 'package:poc_chat_2/providers/isar_storage/isar_storage_provider.dart';
import 'package:poc_chat_2/repositories/local_chat_repository.dart';
import 'package:poc_chat_2/repositories/server_chat_repository.dart';
import 'package:poc_chat_2/services/member/member_service.dart';

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
                  return Center(child: Text(state.error.toString()));
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
      return const Center(child: Text('No Rooms'));
    } else {
      return ListView(
        children: state.presenter.chatRooms
            .map(
              (presenter) {
                final chatRoom = state.chatRoomWithUnreadMessageCounts
                    .firstWhere((element) => element.$1.id == presenter.id)
                    .$1;

                return _buildChatRoom(presenter, chatRoom);
              },
            )
            .intersperse(afterLast: true, const Divider())
            .toList(),
      );
    }
  }

  Widget _buildChatRoom(
    ChatRoomPresenter presenter,
    ChatRoom chatRoom,
  ) {
    final latestMessage = presenter.latestMessage;
    final thumbnailUrl = presenter.thumbnailUrl;

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => _navigationToChatRoomPage(chatRoom),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            if (thumbnailUrl != null) ...[
              SizedBox(
                width: 48,
                height: 48,
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(thumbnailUrl),
                ),
              ),
              const SizedBox(width: 8),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    presenter.name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  if (latestMessage != null) ...[
                    Text(
                      latestMessage.text,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      latestMessage.createdAt.toRelativeTime(context),
                      style: const TextStyle(color: Colors.grey),
                      maxLines: 1,
                    ),
                  ]
                ],
              ),
            ),
            if (presenter.unreadMessageCount != 0) ...[
              const SizedBox(width: 8),
              _buildUnreadMessageBadge(),
            ]
          ],
        ),
      ),
    );
  }

  Widget _buildUnreadMessageBadge() {
    return Container(
      width: 8,
      height: 8,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.red,
      ),
    );
  }

  void _navigationToChatRoomPage(ChatRoom chatRoom) {
    final bloc = context.read<ChatsPageBloc>();
    final memberId = chatRoom.members
        .where((member) => member.id == MockData.currentRueJaiUser.id)
        .firstOrNull
        .getOrThrow(errorMessage: 'Member not found.')
        .id;

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
                  assetsPickerCubit: context.read<AssetsPickerCubit>(),
                  alertDialogCubit: bloc.alertDialogCubit,
                  replyMessageCubit: context.read<ReplyMessageCubit>(),
                  photosClipboardCubit: context.read<PhotosClipboardCubit>(),
                  uiBlockingCubit: context.read<UIBlockingCubit>(),
                  chatRoom: chatRoom,
                  memberService: MemberService(
                    memberId: memberId,
                    chatRoomId: chatRoom.id,
                    serverChatRepository: context.read<ServerChatRepository>(),
                    localChatRepository: context.read<LocalChatRepository>(),
                  ),
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
