import 'dart:math';

import 'package:dfunc/dfunc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_chat_2/cubits/assets_picker_cubit.dart';
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
                child: _buildMessage(context, message: message),
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
            child: _buildMessage(context, message: message),
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
          child: _buildMessage(context, message: message),
        ),
      ],
    );
  }

  Widget _buildMessageBubble(
    BuildContext context, {
    required AlignmentGeometry alignment,
    required Widget child,
  }) {
    return Align(
      alignment: alignment,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: child,
        ),
      ),
    );
  }

  Widget _buildMessage(
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
    final bloc = context.read<ChatRoomPageBloc>();
    final isOwner = bloc.currentUser.id == textMessage.owner.id;
    final text = textMessage.text;

    if (text != null) {
      return _buildMessageBubble(
        context,
        alignment: isOwner ? Alignment.topRight : Alignment.topLeft,
        child: Text(
          text,
          style: const TextStyle(fontSize: 16),
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
    if (photoMessage.urls.length > 1) {
      return _buildPhotoGallery(context, urls: photoMessage.urls);
    } else {
      return GestureDetector(
        onTap: () => _viewPhotoGallery(
          context,
          urls: photoMessage.urls,
          index: 0,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.network(
            photoMessage.urls.first,
            fit: BoxFit.cover,
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
}
