import 'dart:math';

import 'package:dfunc/dfunc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_chat_2/cubits/assets_picker_cubit.dart';
import 'package:poc_chat_2/cubits/reply_message_cubit.dart';
import 'package:poc_chat_2/models/message.dart';
import 'package:poc_chat_2/pages/chat_room/bloc/chat_room_page_bloc.dart';
import 'package:poc_chat_2/pages/chat_room/chat_room_page_presenter.dart';
import 'package:poc_chat_2/pages/photo_view_gallery_page.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class ChatRoomPage extends StatefulWidget {
  const ChatRoomPage({super.key});

  @override
  State<ChatRoomPage> createState() => _ChatRoomPageState();
}

class _ChatRoomPageState extends State<ChatRoomPage> {
  final textEditingController = TextEditingController();
  final scrollController = ScrollController();

  void _onMessageSubmitted() {
    final bloc = context.read<ChatRoomPageBloc>();

    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );

    FocusScope.of(context).unfocus();
    textEditingController.clear();
    bloc.replyMessageCubit.clear();
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
          padding: const EdgeInsets.symmetric(horizontal: 20),
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
    final bloc = context.read<ChatRoomPageBloc>();

    return Column(
      children: [
        BlocBuilder<AssetsPickerCubit, List<AssetEntity>>(
          builder: (context, assets) {
            return Visibility(
              visible: assets.isNotEmpty,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: _buildPhotosSelectedInput(
                  context,
                  assets: assets,
                ),
              ),
            );
          },
        ),
        BlocBuilder<ReplyMessageCubit, Message?>(
          builder: (context, message) {
            if (message != null) {
              final messagePresenter = MessagePresenter.fromModel(message);

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: _buildReplyMessageInput(
                  context,
                  message: messagePresenter,
                ),
              );
            } else {
              return Container();
            }
          },
        ),
        SizedBox(
          height: 60,
          width: double.maxFinite,
          child: Row(
            children: [
              SizedBox(
                width: 50,
                height: 50,
                child: GestureDetector(
                  onTap: () => bloc.add(
                    AssetsPickerRequestedEvent(context: context),
                  ),
                  child: Icon(
                    Icons.photo_outlined,
                    color: Colors.grey.shade700,
                    size: 32,
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
        ),
      ],
    );
  }

  Widget _buildPhotosSelectedInput(
    BuildContext context, {
    required List<AssetEntity> assets,
  }) {
    final bloc = context.read<ChatRoomPageBloc>();

    return SizedBox(
      child: GridView.count(
        crossAxisCount: 4,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        children: List.generate(assets.length, (index) {
          return Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image(
                    image: AssetEntityImageProvider(
                      assets[index],
                      isOriginal: false,
                    ),
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;

                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () => bloc.add(
                    RemoveAssetRequestedEvent(
                      asset: assets[index],
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.cancel,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildMemberJoinedChatRoom({required MemberPresenter member}) {
    return Row(
      children: [
        const Expanded(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Divider(),
          ),
        ),
        Text(
          '${member.name} (${member.userRole}) Joined the Chat',
        ),
        const Expanded(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Divider(),
          ),
        ),
      ],
    );
  }

  Widget _buildMemberLeaveChatRoom({required MemberPresenter member}) {
    return Row(
      children: [
        const Expanded(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Divider(),
          ),
        ),
        Text(
          '${member.name} (${member.userRole}) Leave the Chat',
        ),
        const Expanded(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Divider(),
          ),
        ),
      ],
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
              child: GestureDetector(
                onLongPress: () => bloc.add(
                  ConfirmedMessageActionRequestedEvent(messageId: message.id),
                ),
                child: Align(
                  alignment: isOwner ? Alignment.topRight : Alignment.topLeft,
                  child: _buildMessage(context, message: message),
                ),
              ),
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
    final bloc = context.read<ChatRoomPageBloc>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // TODO: Implement this
        const Spacer(),
        Flexible(
          flex: 4,
          child: GestureDetector(
            onLongPress: () => bloc.add(
              FailedMessageActionRequestedEvent(messageId: message.id),
            ),
            child: Align(
              alignment: Alignment.topRight,
              child: _buildMessage(context, message: message),
            ),
          ),
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
          child: Align(
            alignment: Alignment.topRight,
            child: _buildMessage(context, message: message),
          ),
        ),
      ],
    );
  }

  Widget _buildMessageBubble(
    BuildContext context, {
    required bool isOwner,
    required Widget child,
    bool isRepliedMessage = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: _bubbleMessageColor(
          isOwner: isOwner,
          isRepliedMessage: isRepliedMessage,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: child,
      ),
    );
  }

  Widget _buildMessage(
    BuildContext context, {
    required MessagePresenter message,
    bool isRepliedMessage = false,
  }) {
    if (message.deletedAt != null) {
      return _buildUnsendMessage(context, message: message);
    } else {
      switch (message) {
        case TextMessagePresenter():
          return _buildTextMessage(
            context,
            textMessage: message,
            isRepliedMessage: isRepliedMessage,
          );
        case TextReplyMessagePresenter():
          return _buildTextReplyMessage(context, textReplyMessage: message);
        case PhotoMessagePresenter():
          return _buildPhotoMessage(
            context,
            photoMessage: message,
            isRepliedMessage: isRepliedMessage,
          );
        case VideoMessagePresenter():
          return _buildVideoMessage(context, videoMessage: message);
        case FileMessagePresenter():
          return _buildFileMessage(context, fileMessage: message);
        case MiniAppMessagePresenter():
          return _buildMiniAppMessage(context, miniAppMessage: message);
      }
    }
  }

  Widget _buildTextMessage(
    BuildContext context, {
    required TextMessagePresenter textMessage,
    bool isRepliedMessage = false,
  }) {
    final bloc = context.read<ChatRoomPageBloc>();
    final isOwner = bloc.currentUser.id == textMessage.owner.id;
    final text = textMessage.text;

    if (text != null) {
      return _buildMessageBubble(
        context,
        isOwner: isOwner,
        isRepliedMessage: isRepliedMessage,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            color: _textMessageColor(
              isOwner: isOwner,
              isRepliedMessage: isRepliedMessage,
            ),
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _buildTextReplyMessage(
    BuildContext context, {
    required TextReplyMessagePresenter textReplyMessage,
  }) {
    final bloc = context.read<ChatRoomPageBloc>();
    final text = textReplyMessage.text;
    final isOwner = bloc.currentUser.id == textReplyMessage.owner.id;

    if (text != null) {
      return Column(
        crossAxisAlignment:
            isOwner ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text('Replied to ${textReplyMessage.repliedMessage.owner.name}'),
          const SizedBox(height: 8),
          _buildMessage(
            context,
            message: textReplyMessage.repliedMessage,
            isRepliedMessage: true,
          ),
          _buildMessageBubble(
            context,
            isOwner: isOwner,
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16,
                color: isOwner ? Colors.white : null,
              ),
            ),
          ),
        ],
      );
    } else {
      return Container();
    }
  }

  Widget _buildPhotoMessage(
    BuildContext context, {
    required PhotoMessagePresenter photoMessage,
    bool isRepliedMessage = false,
  }) {
    if (photoMessage.urls.length > 1) {
      return Opacity(
        opacity: isRepliedMessage ? 0.6 : 1.0,
        child: _buildPhotoGallery(context, urls: photoMessage.urls),
      );
    } else {
      return GestureDetector(
        onTap: () => _viewPhotoGallery(
          context,
          urls: photoMessage.urls,
          index: 0,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Opacity(
            opacity: isRepliedMessage ? 0.6 : 1.0,
            child: Image.network(
              photoMessage.urls.first,
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    }
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

  Widget _buildUnsendMessage(
    BuildContext context, {
    required MessagePresenter message,
  }) {
    final bloc = context.read<ChatRoomPageBloc>();
    final isOwner = bloc.currentUser.id == message.owner.id;

    return Align(
      alignment: isOwner ? Alignment.topRight : Alignment.topLeft,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey),
        ),
        child: const Padding(
          padding: EdgeInsets.all(8),
          child: Text(
            'Unsend a message',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ),
      ),
    );
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

  Widget _buildPhotoGallery(
    BuildContext context, {
    required List<String> urls,
  }) {
    const limitDisplayImage = 6;
    final shouldShowStaggeredGrid =
        urls.length < limitDisplayImage && urls.length.isOdd;

    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: shouldShowStaggeredGrid
          ? _buildStaggeredGridView(context, urls: urls)
          : _buildGridView(context, urls: urls),
    );
  }

  Widget _buildStaggeredGridView(
    BuildContext context, {
    required List<String> urls,
  }) {
    final gridViewImageUrls = urls.sublist(0, urls.length - 1);

    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Column(
        children: [
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              crossAxisCount: 2,
            ),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: gridViewImageUrls.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => _viewPhotoGallery(
                  context,
                  urls: urls,
                  index: index,
                ),
                child: Image.network(
                  urls[index],
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () => _viewPhotoGallery(
              context,
              urls: urls,
              index: urls.length - 1,
            ),
            child: AspectRatio(
              aspectRatio: 2,
              child: Image.network(
                urls.last,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGridView(
    BuildContext context, {
    required List<String> urls,
  }) {
    const limitDisplayImage = 6;
    final limitDisplayImageUrls =
        urls.sublist(0, min(urls.length, limitDisplayImage));

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        crossAxisCount: 2,
      ),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: limitDisplayImageUrls.length,
      itemBuilder: (context, index) {
        final isLastImageUrl = index == limitDisplayImage - 1;
        final shouldShowSeeMore =
            isLastImageUrl && urls.length > limitDisplayImage;

        return GestureDetector(
          onTap: () => _viewPhotoGallery(
            context,
            urls: urls,
            index: index,
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                urls[index],
                fit: BoxFit.cover,
              ),
              Visibility(
                visible: shouldShowSeeMore,
                child: Container(
                  color: Colors.black.withAlpha(150),
                  child: Center(
                    child: Text(
                      '+ ${urls.length - limitDisplayImage + 1}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _viewPhotoGallery(
    BuildContext context, {
    required List<String> urls,
    required int index,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PhotoViewGalleryPage(
          imageUrls: urls,
          initialIndex: index,
        ),
      ),
    );
  }

  Widget _buildReplyMessageInput(
    BuildContext context, {
    required MessagePresenter message,
  }) {
    final bloc = context.read<ChatRoomPageBloc>();

    return SizedBox(
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Replying to ${message.owner.name}'),
                const SizedBox(height: 8),
                _buildReplyMessage(context, message: message),
              ],
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            onPressed: () => bloc.add(RemoveReplyRequestedEvent()),
            icon: const Icon(
              Icons.cancel,
              color: Colors.grey,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReplyMessage(
    BuildContext context, {
    required MessagePresenter message,
  }) {
    if (message is TextMessagePresenter) {
      final text = message.text;

      if (text != null) {
        return Text(text);
      } else {
        return Container();
      }
    } else if (message is PhotoMessagePresenter) {
      return SizedBox(
        height: 60,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Image'),
            const Spacer(),
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.network(
                  message.urls.first,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      );
    } else if (message is MiniAppMessagePresenter) {
      return const Text('Package');
    } else {
      return Container();
    }
  }

  Color? _textMessageColor({
    required bool isOwner,
    bool isRepliedMessage = false,
  }) {
    if (isRepliedMessage) {
      return Colors.grey;
    } else if (isOwner) {
      return Colors.white;
    } else {
      return null;
    }
  }

  Color _bubbleMessageColor({
    required bool isOwner,
    bool isRepliedMessage = false,
  }) {
    if (isRepliedMessage) {
      return Colors.grey.shade100;
    } else if (isOwner) {
      return Colors.deepOrangeAccent;
    } else {
      return Colors.grey.shade200;
    }
  }
}
