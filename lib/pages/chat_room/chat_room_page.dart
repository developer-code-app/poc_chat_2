import 'package:dfunc/dfunc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_chat_2/pages/chat_room/bloc/chat_room_page_bloc.dart';
import 'package:poc_chat_2/pages/chat_room/chat_room_page_presenter.dart';

class ChatRoomPage extends StatefulWidget {
  const ChatRoomPage({super.key});

  @override
  State<ChatRoomPage> createState() => _ChatRoomPageState();
}

class _ChatRoomPageState extends State<ChatRoomPage> {
  final textEditingController = TextEditingController();
  final scrollController = ScrollController();

  void _onMessageSubmitted() {
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );

    FocusScope.of(context).unfocus();
    textEditingController.clear();
  }

  bool _shouldShowUser({
    required List<MessagePresenter> messages,
    required MessagePresenter message,
  }) {
    final index = messages.indexOf(message);
    final previousMessage = index > 0 ? messages[index - 1] : null;

    return previousMessage?.owner.id != message.owner.id;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatRoomPageBloc, ChatRoomPageState>(
      builder: (context, state) {
        switch (state) {
          case InitialState():
            return _buildScaffold(
              context,
              child: const Center(child: Text("Initial State")),
            );
          case LoadSuccessState():
            return _buildScaffold(
              context,
              appBarTitle: state.presenter.name,
              child: _buildLoadSuccess(context, state),
            );
        }
      },
    );
  }

  Widget _buildScaffold(
    BuildContext context, {
    required Widget child,
    String? appBarTitle,
  }) {
    return Scaffold(
      appBar: AppBar(title: Text(appBarTitle ?? '')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: child,
        ),
      ),
    );
  }

  Widget _buildLoadSuccess(
    BuildContext context,
    LoadSuccessState state,
  ) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => FocusScope.of(context).unfocus(),
      child: Column(
        children: [
          _buildMessages(context, state),
          _buildChatMessageInput(context),
        ],
      ),
    );
  }

  Widget _buildMessages(
    BuildContext context,
    LoadSuccessState state,
  ) {
    return Expanded(
      child: Align(
        alignment: Alignment.topCenter,
        child: ListView(
          controller: scrollController,
          shrinkWrap: true,
          reverse: true,
          children: [
            ...state.presenter.sendingMessages.reversed.map(
                (message) => _buildSendingMessages(context, message: message)),
            ...state.presenter.failedMessages.reversed.map(
                (message) => _buildFailedMessages(context, message: message)),
            ...state.presenter.confirmedMessages.reversed.mapIndexed(
              (index, message) => _buildConfirmedMessage(
                context,
                message: message,
                shouldShowUser: _shouldShowUser(
                  messages: state.presenter.confirmedMessages.toList(),
                  message: message,
                ),
              ),
            ),
          ].intersperse(const SizedBox(height: 8)).toList(),
        ),
      ),
    );
  }

  Widget _buildChatMessageInput(BuildContext context) {
    return SizedBox(
      height: 60,
      width: double.maxFinite,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.camera_alt_outlined,
                color: Colors.grey.shade700,
              ),
            ),
          ),
          SizedBox(
            width: 50,
            height: 50,
            child: GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.photo_outlined,
                color: Colors.grey.shade700,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: textEditingController,
              decoration: const InputDecoration(hintText: 'Aa'),
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(
            width: 80,
            height: 80,
            child: GestureDetector(
              onTap: _onMessageSubmitted,
              child: Icon(
                Icons.send,
                color: Colors.grey.shade700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConfirmedMessage(
    BuildContext context, {
    required MessagePresenter message,
    required bool shouldShowUser,
  }) {
    final bloc = context.read<ChatRoomPageBloc>();
    final isOwner = bloc.currentUser.id == message.owner.id;

    return Column(
      children: [
        if (shouldShowUser) _buildUserAvatar(context, member: message.owner),
        Row(
          children: [
            if (isOwner) const Spacer(),
            Flexible(
              flex: 4,
              child: _buildMessageBubble(context, message: message),
            ),
            if (!isOwner) const Spacer(),
          ],
        ),
      ],
    );
  }

  Widget _buildFailedMessages(
    BuildContext context, {
    required MessagePresenter message,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // TODO: Implement this
        const Spacer(),
        Flexible(
          flex: 4,
          child: _buildMessageBubble(context, message: message),
        ),
      ],
    );
  }

  Widget _buildSendingMessages(
    BuildContext context, {
    required MessagePresenter message,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // TODO: Implement this
        const Spacer(),
        Flexible(
          flex: 4,
          child: _buildMessageBubble(context, message: message),
        ),
      ],
    );
  }

  Widget _buildMessageBubble(
    BuildContext context, {
    required MessagePresenter message,
  }) {
    final bloc = context.read<ChatRoomPageBloc>();
    final isOwner = bloc.currentUser.id == message.owner.id;

    return Align(
      alignment: isOwner ? Alignment.topRight : Alignment.topLeft,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: _buildMessageContent(
            context,
            message: message,
          ),
        ),
      ),
    );
  }

  Widget _buildMessageContent(
    BuildContext context, {
    required MessagePresenter message,
  }) {
    switch (message) {
      case TextMessagePresenter():
        return _buildTextMessage(context, textMessage: message);
      case TextReplyMessagePresenter():
        return _buildTextReplyMessage(context, textReplyMessage: message);
      case PhotoMessagePresenter():
        return _buildPhotoMessage(context, photoMessage: message);
      case VideoMessagePresenter():
        return _buildVideoMessage(context, videoMessage: message);
      case FileMessagePresenter():
        return _buildFileMessage(context, fileMessage: message);
      case MiniAppMessagePresenter():
        return _buildMiniAppMessage(context, miniAppMessage: message);
    }
  }

  Widget _buildTextMessage(
    BuildContext context, {
    required TextMessagePresenter textMessage,
  }) {
    final text = textMessage.text;

    if (text != null) {
      return Text(
        text,
        style: const TextStyle(fontSize: 16),
      );
    } else {
      return Container();
    }
  }

  Widget _buildTextReplyMessage(
    BuildContext context, {
    required TextReplyMessagePresenter textReplyMessage,
  }) {
    final text = textReplyMessage.text;

    if (text != null) {
      return Text(
        text,
        style: const TextStyle(fontSize: 16),
      );
    } else {
      return Container();
    }
  }

  Widget _buildPhotoMessage(
    BuildContext context, {
    required PhotoMessagePresenter photoMessage,
  }) {
    return Container();
  }

  Widget _buildVideoMessage(
    BuildContext context, {
    required VideoMessagePresenter videoMessage,
  }) {
    return Container();
  }

  Widget _buildFileMessage(
    BuildContext context, {
    required FileMessagePresenter fileMessage,
  }) {
    return Container();
  }

  Widget _buildMiniAppMessage(
    BuildContext context, {
    required MiniAppMessagePresenter miniAppMessage,
  }) {
    return Container();
  }

  Widget _buildUserAvatar(
    BuildContext context, {
    required MemberPresenter member,
  }) {
    final bloc = context.read<ChatRoomPageBloc>();
    final isOwner = bloc.currentUser.id == member.id;

    if (isOwner) return Container();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          SizedBox(
            width: 40,
            height: 40,
            child: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(member.thumbnail),
            ),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                member.name,
                style: const TextStyle(fontSize: 14),
              ),
              Text(
                member.userRole,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
