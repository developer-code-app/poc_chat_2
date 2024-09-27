import 'dart:math';

import 'package:dfunc/dfunc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_chat_2/cubits/assets_picker_cubit.dart';
import 'package:poc_chat_2/cubits/photos_clipboard_cubit.dart';
import 'package:poc_chat_2/cubits/reply_message_cubit.dart';
import 'package:poc_chat_2/models/message.dart';
import 'package:poc_chat_2/pages/chat_room/bloc/chat_room_page_bloc.dart';
import 'package:poc_chat_2/pages/chat_room/chat_room_page_presenter.dart';
import 'package:poc_chat_2/pages/chat_summary/bloc/chat_summary_page_bloc.dart'
    as chat_summary_bloc;
import 'package:poc_chat_2/pages/chat_summary/chat_summary_page.dart';
import 'package:poc_chat_2/pages/chat_summary/photos_and_videos_subpage/bloc/photos_and_videos_subpage_bloc.dart'
    as photos_and_videos_subpage_bloc;
import 'package:poc_chat_2/pages/chat_summary/topics_subpage/bloc/topics_subpage_bloc.dart'
    as topics_subpage_bloc;
import 'package:poc_chat_2/pages/photo_view_gallery_page.dart';
import 'package:poc_chat_2/widgets/loading_with_blocking_widget.dart';
import 'package:poc_chat_2/widgets/shimmer_loading_widget.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

enum MessageAlignment { left, center, right }

class ChatRoomPage extends StatefulWidget {
  const ChatRoomPage({super.key});

  @override
  State<ChatRoomPage> createState() => _ChatRoomPageState();
}

class _ChatRoomPageState extends State<ChatRoomPage> {
  final scrollController = ScrollController();

  void _onMessageSubmitted() {
    final bloc = context.read<ChatRoomPageBloc>();

    bloc.add(MessageSentEvent());

    clearKeyboard();
  }

  void clearKeyboard() {
    final bloc = context.read<ChatRoomPageBloc>();

    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );

    FocusScope.of(context).unfocus();
    bloc.textEditingController.clear();
    bloc.replyMessageCubit.clear();
  }

  bool _shouldShowUserAvatar({
    required List<MessagePresenter> messages,
    required MessagePresenter message,
  }) {
    final index = messages.indexOf(message);
    final previousMessage = index > 0 ? messages[index - 1] : null;

    if (previousMessage == null) return message is MemberMessagePresenter;

    if (message is! MemberMessagePresenter) return false;

    if (previousMessage is! MemberMessagePresenter) return true;

    return previousMessage.owner.id != message.owner.id;
  }

  MessageAlignment _messageAlignment({required MessagePresenter message}) {
    final bloc = context.read<ChatRoomPageBloc>();

    if (message is MemberMessagePresenter) {
      return bloc.memberService.memberId == message.owner.id
          ? MessageAlignment.right
          : MessageAlignment.left;
    } else {
      return MessageAlignment.center;
    }
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
      appBar: AppBar(
        title: Text(appBarTitle ?? ''),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () => _navigationToChatSummaryPage(),
              icon: const Icon(
                Icons.menu,
                color: Colors.grey,
                size: 32,
              ),
            ),
          )
        ],
      ),
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
    return LoadingWithBlockingWidget(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            _buildMessages(context, state),
            _buildChatMessageInput(context),
          ],
        ),
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
                shouldShowUser: _shouldShowUserAvatar(
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
    return Column(
      children: [
        _buildPhotosSelectedInputIfNeed(context),
        _buildReplyMessageInputIfNeed(context),
        _buildPhotosFromClipboardIfNeed(context),
        SizedBox(
          height: 60,
          width: double.maxFinite,
          child: Row(
            children: [
              _buildPhotoPickerButton(context),
              const SizedBox(width: 8),
              Expanded(child: _buildInputTextField(context)),
              const SizedBox(width: 8),
              _buildSubmitMessageButton(context),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPhotoPickerButton(BuildContext context) {
    final bloc = context.read<ChatRoomPageBloc>();

    return SizedBox(
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
    );
  }

  Widget _buildInputTextField(BuildContext context) {
    final bloc = context.read<ChatRoomPageBloc>();

    return TextField(
      controller: bloc.textEditingController,
      decoration: const InputDecoration(hintText: 'Aa'),
      contextMenuBuilder: (context, textState) {
        return AdaptiveTextSelectionToolbar.editable(
          clipboardStatus: ClipboardStatus.pasteable,
          onCopy: () {
            textState.copySelection(SelectionChangedCause.tap);
            textState.hideToolbar();
          },
          onPaste: () {
            bloc.add(MessagePastedEvent(editableTextState: textState));
            textState.hideToolbar();
          },
          onCut: () {
            textState.cutSelection(SelectionChangedCause.tap);
            textState.hideToolbar();
          },
          onSelectAll: () {
            textState.selectAll(SelectionChangedCause.tap);
            textState.hideToolbar();
          },
          onLookUp: null,
          onSearchWeb: null,
          onShare: null,
          onLiveTextInput: null,
          anchors: textState.contextMenuAnchors,
        );
      },
    );
  }

  Widget _buildSubmitMessageButton(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 80,
      child: GestureDetector(
        onTap: _onMessageSubmitted,
        child: Icon(
          Icons.send,
          color: Colors.grey.shade700,
        ),
      ),
    );
  }

  Widget _buildPhotosFromClipboardIfNeed(BuildContext context) {
    final bloc = context.read<ChatRoomPageBloc>();

    return BlocBuilder<PhotosClipboardCubit, List<Uint8List>>(
      builder: (context, photos) {
        final scale = MediaQuery.of(context).devicePixelRatio;

        return Visibility(
          visible: photos.isNotEmpty,
          child: _buildPhotoInputGridView(
            context,
            onRemoved: (index) => bloc.photosClipboardCubit.remove(
              photos[index],
            ),
            children: photos
                .map((photo) => Image.memory(photo, scale: scale))
                .toList(),
          ),
        );
      },
    );
  }

  Widget _buildPhotosSelectedInputIfNeed(BuildContext context) {
    final bloc = context.read<ChatRoomPageBloc>();

    return BlocBuilder<AssetsPickerCubit, List<AssetEntity>>(
      builder: (context, assets) {
        return Visibility(
          visible: assets.isNotEmpty,
          child: _buildPhotoInputGridView(
            context,
            onRemoved: (index) => bloc.add(
              AssetRemovedEvent(
                asset: assets[index],
              ),
            ),
            children: assets
                .map(
                  (asset) => Image(
                    image: AssetEntityImageProvider(asset, isOriginal: false),
                    fit: BoxFit.cover,
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }

  Widget _buildConfirmedMessage(
    BuildContext context, {
    required MessagePresenter message,
    required bool shouldShowUser,
  }) {
    final bloc = context.read<ChatRoomPageBloc>();

    return Column(
      children: [
        if (shouldShowUser && message is MemberMessagePresenter)
          _buildUserAvatar(
            context,
            member: message.owner,
          ),
        _buildMessageAlignment(
          context,
          messageAlignment: _messageAlignment(message: message),
          child: GestureDetector(
            onLongPress: () => bloc.add(
              ConfirmedMessageSelectActionRequestedEvent(messageId: message.id),
            ),
            child: _buildMessage(context, message: message),
          ),
        ),
      ],
    );
  }

  Widget _buildFailedMessages(
    BuildContext context, {
    required MessagePresenter message,
  }) {
    final bloc = context.read<ChatRoomPageBloc>();

    return _buildMessageAlignment(
      context,
      messageAlignment: MessageAlignment.right,
      child: GestureDetector(
        onLongPress: () => bloc.add(
          FailedMessageSelectActionRequestedEvent(messageId: message.id),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              Icons.refresh,
              color: Colors.grey.shade700,
            ),
            const SizedBox(width: 8),
            _buildMessage(context, message: message),
          ],
        ),
      ),
    );
  }

  Widget _buildSendingMessages(
    BuildContext context, {
    required MessagePresenter message,
  }) {
    return _buildMessageAlignment(
      context,
      messageAlignment: MessageAlignment.right,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(
            Icons.timelapse,
            color: Colors.grey.shade700,
          ),
          const SizedBox(width: 8),
          _buildMessage(context, message: message),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(
    BuildContext context, {
    required bool isOwner,
    required Widget child,
    required Color color,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: color,
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
  }) {
    if (message is MemberMessagePresenter && message.deletedAt != null) {
      return _buildUnsendMessage(context, message: message);
    }

    switch (message) {
      case MemberTextMessagePresenter():
        return _buildTextMessage(context, textMessage: message);
      case MemberTextReplyMessagePresenter():
        return _buildTextReplyMessage(context, textReplyMessage: message);
      case MemberPhotoMessagePresenter():
        return _buildPhotoMessage(context, photoMessage: message);
      case MemberVideoMessagePresenter():
        return _buildVideoMessage(context, videoMessage: message);
      case MemberFileMessagePresenter():
        return _buildFileMessage(context, fileMessage: message);
      case MemberMiniAppMessagePresenter():
        return _buildMiniAppMessage(context, miniAppMessage: message);
      case ActivityLogMessagePresenter():
        return _buildActivityLogMessage(context, activityLogMessage: message);
    }
  }

  Widget _buildTextMessageSkeletonView(BuildContext context) {
    return const AspectRatio(
      aspectRatio: 6,
      child: ShimmerLoadingWidget(borderRadius: 8),
    );
  }

  Widget _buildTextReplyMessageSkeletonView(BuildContext context) {
    return const AspectRatio(
      aspectRatio: 6,
      child: ShimmerLoadingWidget(borderRadius: 8),
    );
  }

  Widget _buildPhotoMessageSkeletonView(BuildContext context) {
    return const AspectRatio(
      aspectRatio: 1,
      child: ShimmerLoadingWidget(borderRadius: 8),
    );
  }

  Widget _buildVideoMessageSkeletonView(BuildContext context) {
    return const AspectRatio(
      aspectRatio: 1,
      child: ShimmerLoadingWidget(borderRadius: 8),
    );
  }

  Widget _buildFileMessageSkeletonView(BuildContext context) {
    return const AspectRatio(
      aspectRatio: 3,
      child: ShimmerLoadingWidget(borderRadius: 8),
    );
  }

  Widget _buildMiniAppMessageSkeletonView(BuildContext context) {
    return const AspectRatio(
      aspectRatio: 1,
      child: ShimmerLoadingWidget(borderRadius: 8),
    );
  }

  Widget _buildTextMessage(
    BuildContext context, {
    required MemberTextMessagePresenter textMessage,
  }) {
    final bloc = context.read<ChatRoomPageBloc>();
    final isOwner = bloc.memberService.memberId == textMessage.owner.id;
    final text = textMessage.text;

    return text == null
        ? _buildTextMessageSkeletonView(context)
        : _buildMessageBubble(
            context,
            isOwner: isOwner,
            color: isOwner ? Colors.deepOrangeAccent : Colors.grey.shade200,
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16,
                color: isOwner ? Colors.white : Colors.black,
              ),
            ),
          );
  }

  Widget _buildTextReplyMessage(
    BuildContext context, {
    required MemberTextReplyMessagePresenter textReplyMessage,
  }) {
    final bloc = context.read<ChatRoomPageBloc>();
    final text = textReplyMessage.text;
    final isOwner = bloc.memberService.memberId == textReplyMessage.owner.id;

    return text == null
        ? _buildTextReplyMessageSkeletonView(context)
        : Column(
            crossAxisAlignment:
                isOwner ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Text('Replied to ${textReplyMessage.repliedMessage.owner.name}'),
              const SizedBox(height: 8),
              Opacity(
                opacity: 0.6,
                child: _buildMessage(
                  context,
                  message: textReplyMessage.repliedMessage,
                ),
              ),
              _buildMessageBubble(
                context,
                isOwner: isOwner,
                color: isOwner ? Colors.deepOrangeAccent : Colors.grey.shade200,
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
  }

  Widget _buildPhotoMessage(
    BuildContext context, {
    required MemberPhotoMessagePresenter photoMessage,
  }) {
    final urls = photoMessage.urls;

    return urls == null
        ? _buildPhotoMessageSkeletonView(context)
        : urls.length > 1
            ? _buildPhotoGallery(context, urls: urls)
            : GestureDetector(
                onTap: () => _viewPhotoGallery(
                  context,
                  urls: urls,
                  index: 0,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    urls.first,
                    fit: BoxFit.cover,
                  ),
                ),
              );
  }

  Widget _buildVideoMessage(
    BuildContext context, {
    required MemberVideoMessagePresenter videoMessage,
  }) {
    return videoMessage.url == null
        ? _buildVideoMessageSkeletonView(context)
        : Container();
  }

  Widget _buildFileMessage(
    BuildContext context, {
    required MemberFileMessagePresenter fileMessage,
  }) {
    return fileMessage.url == null
        ? _buildFileMessageSkeletonView(context)
        : Container();
  }

  Widget _buildMiniAppMessage(
    BuildContext context, {
    required MemberMiniAppMessagePresenter miniAppMessage,
  }) {
    return _buildMiniAppMessageSkeletonView(context);
  }

  Widget _buildUnsendMessage(
    BuildContext context, {
    required MessagePresenter message,
  }) {
    return Container(
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
    );
  }

  Widget _buildUserAvatar(
    BuildContext context, {
    required MemberPresenter member,
  }) {
    final bloc = context.read<ChatRoomPageBloc>();
    final isOwner = bloc.memberService.memberId == member.id;
    final thumbnail = member.thumbnail;

    if (isOwner) return Container();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          if (thumbnail != null)
            SizedBox(
              width: 40,
              height: 40,
              child: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(thumbnail),
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
    final bloc = context.read<ChatRoomPageBloc>();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PhotoViewGalleryPage(
          imageUrls: urls,
          initialIndex: index,
          onImageDownloaded: (currentIndex) => bloc.add(
            PhotoSelectActionRequestedEvent(
              urls: urls,
              index: currentIndex,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildReplyMessageInputIfNeed(BuildContext context) {
    final bloc = context.read<ChatRoomPageBloc>();

    return BlocBuilder<ReplyMessageCubit, MemberMessage?>(
      builder: (context, message) {
        if (message == null) return Container();

        final messagePresenter = MemberMessagePresenter.fromModel(message);

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: SizedBox(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Replying to ${message.owner.name}'),
                      const SizedBox(height: 8),
                      _buildReplyMessage(
                        context,
                        message: messagePresenter,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  onPressed: () => bloc.add(MessageReplyRemovedEvent()),
                  icon: const Icon(
                    Icons.cancel,
                    color: Colors.grey,
                    size: 28,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildReplyMessage(
    BuildContext context, {
    required MemberMessagePresenter message,
  }) {
    if (message is MemberTextMessagePresenter) {
      final text = message.text;

      if (text != null) {
        return Text(text);
      } else {
        return Container();
      }
    } else if (message is MemberPhotoMessagePresenter) {
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
                  message.urls!.first,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      );
    } else if (message is MemberMiniAppMessagePresenter) {
      return const Text('Package');
    } else {
      return Container();
    }
  }

  Widget _buildActivityLogMessage(
    BuildContext context, {
    required ActivityLogMessagePresenter activityLogMessage,
  }) {
    return Row(
      children: [
        const Expanded(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Divider(),
          ),
        ),
        Text(activityLogMessage.log),
        const Expanded(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Divider(),
          ),
        ),
      ],
    );
  }

  Widget _buildPhotoInputGridView(
    BuildContext context, {
    required List<Widget> children,
    required Function(int) onRemoved,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        child: GridView.count(
          crossAxisCount: 4,
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          children: List.generate(children.length, (index) {
            return Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: children[index],
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () => onRemoved(index),
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
      ),
    );
  }

  Widget _buildMessageAlignment(
    BuildContext context, {
    required MessageAlignment messageAlignment,
    required Widget child,
  }) {
    if (messageAlignment == MessageAlignment.left) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(child: child),
          ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 50),
          ),
        ],
      );
    } else if (messageAlignment == MessageAlignment.center) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Expanded(child: child)],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 50),
          ),
          Flexible(child: child),
        ],
      );
    }
  }

  void _navigationToChatSummaryPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MultiBlocProvider(
          providers: [
            BlocProvider<topics_subpage_bloc.TopicsSubpageBloc>(
              create: (context) => topics_subpage_bloc.TopicsSubpageBloc()
                ..add(topics_subpage_bloc.StartedEvent()),
            ),
            BlocProvider<
                photos_and_videos_subpage_bloc.PhotosAndVideosSubpageBloc>(
              create: (context) =>
                  photos_and_videos_subpage_bloc.PhotosAndVideosSubpageBloc()
                    ..add(photos_and_videos_subpage_bloc.StartedEvent()),
            ),
            BlocProvider<chat_summary_bloc.ChatSummaryPageBloc>(
              create: (context) => chat_summary_bloc.ChatSummaryPageBloc(
                  topicsSubpageBloc:
                      context.read<topics_subpage_bloc.TopicsSubpageBloc>(),
                  photosAndVideosSubpageBloc: context.read<
                      photos_and_videos_subpage_bloc
                      .PhotosAndVideosSubpageBloc>())
                ..add(chat_summary_bloc.StartedEvent()),
            ),
          ],
          child: const ChatSummaryPage(),
        ),
      ),
    );
  }
}
