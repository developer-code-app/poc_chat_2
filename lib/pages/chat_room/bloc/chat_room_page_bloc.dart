import 'dart:async';

import 'package:dfunc/dfunc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:intl/intl.dart';
import 'package:linkify/linkify.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:poc_chat_2/cubits/photos_clipboard_cubit.dart';
import 'package:poc_chat_2/cubits/preview_metadata_cubit.dart';
import 'package:poc_chat_2/cubits/reply_message_cubit.dart';
import 'package:poc_chat_2/cubits/ui_blocking_cubit.dart';
import 'package:poc_chat_2/extensions/alert_dialog_convenience_showing.dart';
import 'package:poc_chat_2/extensions/extended_data_reader.dart';
import 'package:poc_chat_2/extensions/extended_permission_handler.dart';
import 'package:poc_chat_2/extensions/ruejai_metadata_fetch.dart';
import 'package:poc_chat_2/services/member/member_service.dart';
import 'package:poc_chat_2/services/member/roles/basic_member_service.dart';
import 'package:super_clipboard/super_clipboard.dart';
import 'package:wechat_camera_picker/wechat_camera_picker.dart';
import 'package:poc_chat_2/app/image_picker/image_picker.dart';
import 'package:poc_chat_2/app/image_picker/ruejai_camera_picker_text_delegate.dart';
import 'package:poc_chat_2/broadcaster/broadcaster.dart' as broadcaster;
import 'package:poc_chat_2/cubits/alert_dialog_cubit.dart';
import 'package:poc_chat_2/cubits/assets_picker_cubit.dart';
import 'package:poc_chat_2/models/chat_room.dart';
import 'package:poc_chat_2/models/chat_room_member.dart';
import 'package:poc_chat_2/models/messages/message.dart';
import 'package:poc_chat_2/models/rue_jai_user.dart';
import 'package:poc_chat_2/pages/chat_room/chat_room_page_presenter.dart';

part 'chat_room_page_event.dart';
part 'chat_room_page_state.dart';

typedef _Event = ChatRoomPageEvent;
typedef _State = ChatRoomPageState;

class ChatRoomPageBloc extends Bloc<ChatRoomPageEvent, ChatRoomPageState> {
  ChatRoomPageBloc({
    required this.chatRoomId,
    required this.assetsPickerCubit,
    required this.alertDialogCubit,
    required this.replyMessageCubit,
    required this.photosClipboardCubit,
    required this.uiBlockingCubit,
    required this.previewMetadataCubit,
    required this.memberService,
  }) : super(InitialState()) {
    on<StartedEvent>(_onStartedEvent);
    on<DataLoadedEvent>(_onDataLoadedEvent);
    on<ErrorOccurredEvent>(_onErrorOccurredEvent);
    on<MessageSentEvent>(_onMessageSentEvent);
    on<ChatRoomBasicInfoUpdatedEvent>(_onChatRoomBasicInfoUpdatedEvent);
    on<ChatRoomMemberAddedEvent>(_onChatRoomMemberAddedEvent);
    on<ChatRoomMemberUpdatedEvent>(_onChatRoomMemberUpdatedEvent);
    on<ChatRoomMemberRemovedEvent>(_onChatRoomMemberRemovedEvent);
    on<ChatRoomMemberLastReadMessageUpdatedEvent>(
        _onChatRoomMemberLastReadMessageUpdatedEvent);
    on<ChatRoomConfirmedMessageAddedEvent>(
        _onChatRoomConfirmedMessageAddedEvent);
    on<ChatRoomConfirmedMessageEditedEvent>(
        _onChatRoomConfirmedMessageEditedEvent);
    on<ChatRoomConfirmedMessageRemovedEvent>(
        _onChatRoomConfirmedMessageRemovedEvent);
    on<ChatRoomSendingMessageAddedEvent>(_onChatRoomSendingMessageAddedEvent);
    on<ChatRoomSendingMessageTimeOutEvent>(
        _onChatRoomSendingMessageTimeOutEvent);
    on<ChatRoomFailedMessageRetriedEvent>(_onChatRoomFailedMessageRetriedEvent);
    on<ChatRoomFailedMessageRemovedEvent>(_onChatRoomFailedMessageRemovedEvent);
    on<UpdateSendingMessageToFailedMessageEvent>(
        _onUpdateSendingMessageToFailedMessageEvent);
    on<AssetsPickerRequestedEvent>(_onAssetsPickerRequestedEvent);
    on<AssetRemovedEvent>(_onAssetRemovedEvent);
    on<ConfirmedMessageSelectActionRequestedEvent>(
        _onConfirmedMessageSelectActionRequestedEvent);
    on<FailedMessageSelectActionRequestedEvent>(
        _onFailedMessageSelectActionRequestedEvent);
    on<PhotosSavedEvent>(_onPhotosSavedEvent);
    on<MessageRepliedEvent>(_onMessageRepliedEvent);
    on<MessageReplyRemovedEvent>(_onMessageReplyRemovedEvent);
    on<MessageCopiedEvent>(_onMessageCopiedEvent);
    on<MessagePastedEvent>(_onMessagePastedEvent);
    on<PhotoSelectActionRequestedEvent>(_onPhotoSelectActionRequestedEvent);
    on<AddPreviewMetadataRequestedEvent>(_onAddPreviewMetadataRequestedEvent);
    on<MessageResentEvent>(_onMessageResentEvent);
    on<MessageUnsendEvent>(_onMessageUnsendEvent);

    broadcaster.Broadcaster.instance.stream.listen(
      onBroadcasterMessageReceived,
    );
  }

  final textEditingController = TextEditingController();
  final scrollController = ScrollController();

  final String chatRoomId;
  final AssetsPickerCubit assetsPickerCubit;
  final AlertDialogCubit alertDialogCubit;
  final ReplyMessageCubit replyMessageCubit;
  final PhotosClipboardCubit photosClipboardCubit;
  final UIBlockingCubit uiBlockingCubit;
  final PreviewMetadataCubit previewMetadataCubit;
  final MemberService memberService;

  StreamSubscription? _broadcasterSubscription;

  @override
  Future<void> close() {
    _broadcasterSubscription?.cancel();

    return super.close();
  }

  Future<void> _onStartedEvent(
    StartedEvent event,
    Emitter<_State> emit,
  ) async {
    emit(LoadInProgressState());

    unawaited(_fetchChatRoom());
  }

  Future<void> _onMessageSentEvent(
    MessageSentEvent event,
    Emitter<_State> emit,
  ) async {
    try {
      if (textEditingController.text.isNotEmpty) {
        unawaited(memberService.sendTextMessage(
          text: textEditingController.text,
        ));
        clearKeyboard();
      }
    } on Exception catch (error) {
      alertDialogCubit.snackBar(title: error.toString());
    }
  }

  Future<void> _fetchChatRoom() async {
    try {
      final chatRoom = await memberService.chatRoomInquiry.getChatRoom(
        chatRoomId: chatRoomId,
      );

      add(DataLoadedEvent(chatRoom: chatRoom));
    } on Exception catch (error) {
      add(ErrorOccurredEvent(error: error));
    }
  }

  Future<void> _refresh() async {
    try {
      final chatRoom = await memberService.chatRoomInquiry.getChatRoom(
        chatRoomId: chatRoomId,
      );

      add(DataLoadedEvent(chatRoom: chatRoom));
    } on Exception catch (error) {
      alertDialogCubit.snackBar(title: error.toString());
    }
  }

  void clearKeyboard() {
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );

    FocusManager.instance.primaryFocus?.unfocus();
    textEditingController.clear();
    replyMessageCubit.clear();
  }

  Future<void> _onDataLoadedEvent(
    DataLoadedEvent event,
    Emitter<_State> emit,
  ) async {
    emit(LoadSuccessState(chatRoom: event.chatRoom));
  }

  Future<void> _onErrorOccurredEvent(
    ErrorOccurredEvent event,
    Emitter<_State> emit,
  ) async {
    emit(LoadFailureState(error: event.error));
  }

  Future<void> _onChatRoomBasicInfoUpdatedEvent(
    ChatRoomBasicInfoUpdatedEvent event,
    Emitter<_State> emit,
  ) async {
    final state = this.state;

    if (state is LoadSuccessState) {
      emit(
        LoadSuccessState(
          chatRoom: state.chatRoom.copyWith(
            name: event.name,
            thumbnailUrl: event.thumbnailUrl,
          ),
        ),
      );
    }
  }

  Future<void> _onChatRoomMemberAddedEvent(
    ChatRoomMemberAddedEvent event,
    Emitter<_State> emit,
  ) async {
    final state = this.state;

    if (state is LoadSuccessState) {
      emit(
        LoadSuccessState(
          chatRoom: state.chatRoom.copyWith(
            members: state.chatRoom.members..add(event.member),
          ),
        ),
      );
    }
  }

  Future<void> _onChatRoomMemberUpdatedEvent(
    ChatRoomMemberUpdatedEvent event,
    Emitter<_State> emit,
  ) async {
    final state = this.state;

    if (state is LoadSuccessState) {
      final members = state.chatRoom.members;
      final memberIndex =
          members.indexWhere((member) => member.id == event.memberId);
      final member = members[memberIndex].copyWith(role: event.role)
        ..rueJaiUser.copyWith(
          name: event.name,
          thumbnailUrl: event.thumbnailUrl,
        );

      members.removeAt(memberIndex);
      members.insert(memberIndex, member);

      emit(
        LoadSuccessState(
          chatRoom: state.chatRoom.copyWith(members: members),
        ),
      );
    }
  }

  Future<void> _onChatRoomMemberRemovedEvent(
    ChatRoomMemberRemovedEvent event,
    Emitter<_State> emit,
  ) async {
    final state = this.state;

    if (state is LoadSuccessState) {
      emit(
        LoadSuccessState(
          chatRoom: state.chatRoom.copyWith(
            members: state.chatRoom.members
              ..removeWhere((member) => member.id == event.memberId),
          ),
        ),
      );
    }
  }

  Future<void> _onChatRoomMemberLastReadMessageUpdatedEvent(
    ChatRoomMemberLastReadMessageUpdatedEvent event,
    Emitter<_State> emit,
  ) async {
    final state = this.state;

    if (state is LoadSuccessState) {
      final members = state.chatRoom.members;
      final memberIndex =
          members.indexWhere((member) => member.id == event.memberId);
      final member = members[memberIndex].copyWith(
          lastReadMessageRecordNumber: event.lastReadMessageRecordNumber);

      members.removeAt(memberIndex);
      members.insert(memberIndex, member);

      emit(
        LoadSuccessState(
          chatRoom: state.chatRoom.copyWith(members: members),
        ),
      );
    }
  }

  Future<void> _onChatRoomConfirmedMessageAddedEvent(
    ChatRoomConfirmedMessageAddedEvent event,
    Emitter<_State> emit,
  ) async {
    final state = this.state;

    if (state is LoadSuccessState) {
      final confirmedMessages = state.chatRoom.confirmedMessages;

      confirmedMessages.add(event.message);

      emit(
        LoadSuccessState(
          chatRoom: state.chatRoom.copyWith(
            confirmedMessages: confirmedMessages,
          ),
        ),
      );
    }
  }

  Future<void> _onChatRoomConfirmedMessageEditedEvent(
    ChatRoomConfirmedMessageEditedEvent event,
    Emitter<_State> emit,
  ) async {
    final state = this.state;
    final message = event.message;

    if (state is LoadSuccessState && message is MemberTextMessage) {
      final confirmedMessages = state.chatRoom.confirmedMessages;
      final messageIndex = confirmedMessages
          .indexWhere((message) => message.id == event.message.id);
      final confirmedMessage = confirmedMessages[messageIndex];

      if (confirmedMessage is MemberTextMessage) {
        message.copyWith(text: confirmedMessage.text);
      }

      confirmedMessages.removeAt(messageIndex);
      confirmedMessages.insert(messageIndex, message);

      emit(
        LoadSuccessState(
          chatRoom: state.chatRoom.copyWith(
            confirmedMessages: confirmedMessages,
          ),
        ),
      );
    } else {
      throw Exception('Message is not text message.');
    }
  }

  Future<void> _onChatRoomConfirmedMessageRemovedEvent(
    ChatRoomConfirmedMessageRemovedEvent event,
    Emitter<_State> emit,
  ) async {
    final state = this.state;

    if (state is LoadSuccessState) {
      final confirmedMessages = state.chatRoom.confirmedMessages;

      confirmedMessages.removeWhere((message) => message.id == event.messageId);

      emit(
        LoadSuccessState(
          chatRoom: state.chatRoom.copyWith(
            confirmedMessages: confirmedMessages,
          ),
        ),
      );
    }
  }

  Future<void> _onChatRoomSendingMessageAddedEvent(
    ChatRoomSendingMessageAddedEvent event,
    Emitter<_State> emit,
  ) async {
    final state = this.state;

    if (state is LoadSuccessState) {
      final sendingMessages = state.chatRoom.sendingMessages;

      sendingMessages.add(event.message);

      emit(
        LoadSuccessState(
          chatRoom: state.chatRoom.copyWith(
            sendingMessages: sendingMessages,
          ),
        ),
      );
    }
  }

  Future<void> _onChatRoomSendingMessageTimeOutEvent(
    ChatRoomSendingMessageTimeOutEvent event,
    Emitter<_State> emit,
  ) async {
    final state = this.state;

    if (state is LoadSuccessState) {
      final sendingMessages = state.chatRoom.sendingMessages;
      final failedMessages = state.chatRoom.failedMessages;
      final message = sendingMessages.firstWhere(
        (message) => message.id == event.messageId,
      );

      sendingMessages.remove(message);
      failedMessages.add(message);

      emit(
        LoadSuccessState(
          chatRoom: state.chatRoom.copyWith(
            sendingMessages: sendingMessages,
            failedMessages: failedMessages,
          ),
        ),
      );
    }
  }

  Future<void> _onChatRoomFailedMessageRetriedEvent(
    ChatRoomFailedMessageRetriedEvent event,
    Emitter<_State> emit,
  ) async {
    final state = this.state;

    if (state is LoadSuccessState) {
      final failedMessages = state.chatRoom.failedMessages;
      final sendingMessages = state.chatRoom.sendingMessages;
      final message = failedMessages.firstWhere(
        (message) => message.id == event.messageId,
      );

      failedMessages.remove(message);
      sendingMessages.add(message);

      emit(
        LoadSuccessState(
          chatRoom: state.chatRoom.copyWith(
            sendingMessages: sendingMessages,
            failedMessages: failedMessages,
          ),
        ),
      );
    }
  }

  Future<void> _onChatRoomFailedMessageRemovedEvent(
    ChatRoomFailedMessageRemovedEvent event,
    Emitter<_State> emit,
  ) async {
    final state = this.state;

    if (state is LoadSuccessState) {
      final failedMessages = state.chatRoom.failedMessages;

      failedMessages.removeWhere((message) => message.id == event.messageId);

      emit(
        LoadSuccessState(
          chatRoom: state.chatRoom.copyWith(
            failedMessages: failedMessages,
          ),
        ),
      );
    }
  }

  Future<void> _onUpdateSendingMessageToFailedMessageEvent(
    UpdateSendingMessageToFailedMessageEvent event,
    Emitter<_State> emit,
  ) async {
    _refresh();
  }

  Future<void> _onAssetsPickerRequestedEvent(
    AssetsPickerRequestedEvent event,
    Emitter<_State> emit,
  ) async {
    final selectedAssets = assetsPickerCubit.state;
    final assets = await ImagePicker.show(
      event.context,
      maxAssets: 10,
      selectedAssets: selectedAssets,
      onPressedCameraPicker: (context) async {
        final result = await CameraPicker.pickFromCamera(
          context,
          pickerConfig: CameraPickerConfig(
            textDelegate: RuejaiCameraPickerTextDelegate(context),
          ),
        );

        if (result != null) {
          // ignore: use_build_context_synchronously
          Navigator.of(context).pop();
          assetsPickerCubit.addAssets([result] + selectedAssets);
        }
      },
    );

    if (assets != null) {
      assetsPickerCubit.addAssets(assets);
    }
  }

  Future<void> _onAssetRemovedEvent(
    AssetRemovedEvent event,
    Emitter<_State> emit,
  ) async {
    assetsPickerCubit.remove(event.asset);
  }

  Future<void> _onConfirmedMessageSelectActionRequestedEvent(
    ConfirmedMessageSelectActionRequestedEvent event,
    Emitter<_State> emit,
  ) async {
    final state = this.state;

    if (state is LoadSuccessState) {
      final message = state.chatRoom.confirmedMessages
          .whereType<MemberMessage>()
          .firstWhere((message) => message.id == event.messageId);
      final isOwner = memberService.memberId == message.owner.id;

      alertDialogCubit.alertActionSheet(
        actions: [
          AlertAction(
            'Reply',
            onPressed: () => add(MessageRepliedEvent(message: message)),
          ),
          if (message is MemberPhotoMessage)
            AlertAction(
              message.urls!.length > 1 ? 'Save all' : 'Save',
              onPressed: () => add(
                PhotosSavedEvent(urls: message.urls ?? []),
              ),
            ),
          AlertAction(
            'Copy',
            onPressed: () => add(MessageCopiedEvent(message: message)),
          ),
          if (isOwner) AlertAction('Unsend'),
        ],
      );
    }
  }

  Future<void> _onFailedMessageSelectActionRequestedEvent(
    FailedMessageSelectActionRequestedEvent event,
    Emitter<_State> emit,
  ) async {
    final state = this.state;

    if (state is LoadSuccessState) {
      final message = state.chatRoom.failedMessages
          .whereType<MemberMessage>()
          .firstWhere((element) => element.id == event.messageId);

      alertDialogCubit.alertActionSheet(
        actions: [
          AlertAction(
            'Resend',
            onPressed: () => add(
              MessageResentEvent(messageId: event.messageId),
            ),
          ),
          if (message is MemberPhotoMessage && message.urls != null)
            AlertAction(
              message.urls!.length > 1 ? 'Save all' : 'Save',
              onPressed: () => add(
                PhotosSavedEvent(urls: message.urls ?? []),
              ),
            ),
          AlertAction(
            'Copy',
            onPressed: () => add(MessageCopiedEvent(message: message)),
          ),
          AlertAction(
            'Unsend',
            onPressed: () => add(
              MessageUnsendEvent(messageId: event.messageId),
            ),
          ),
        ],
      );
    }
  }

  Future<void> _onMessageRepliedEvent(
    MessageRepliedEvent event,
    Emitter<_State> emit,
  ) async {
    replyMessageCubit.reply(event.message);
  }

  Future<void> _onMessageReplyRemovedEvent(
    MessageReplyRemovedEvent event,
    Emitter<_State> emit,
  ) async {
    replyMessageCubit.clear();
  }

  Future<void> _onMessageCopiedEvent(
    MessageCopiedEvent event,
    Emitter<_State> emit,
  ) async {
    final message = event.message;

    if (message is MemberTextMessage) {
      _copyTextMessage(textMessage: message);
    } else if (message is MemberPhotoMessage) {
      _copyPhotoMessage(photoMessage: message);
    } else {
      alertDialogCubit.errorAlert(
        error: Exception('Clipboard is not available'),
      );
    }
  }

  Future<void> _onMessagePastedEvent(
    MessagePastedEvent event,
    Emitter<_State> emit,
  ) async {
    final clipboard = SystemClipboard.instance;

    if (clipboard != null) {
      final reader = await clipboard.read();
      final List<Uint8List> photos = [];

      for (var item in reader.items) {
        final text = await item.readValue(Formats.plainText);
        final photo = await item.readFile(Formats.jpeg);

        if (text != null) {
          event.editableTextState.pasteText(SelectionChangedCause.tap);
        } else if (photo != null) {
          photos.add(photo);
        } else {
          alertDialogCubit.errorAlert(
            error: Exception('Clipboard is not available on this platform'),
          );
        }
      }

      if (photos.isNotEmpty) photosClipboardCubit.addPhotos(photos);
    }
  }

  Future<void> _onPhotoSelectActionRequestedEvent(
    PhotoSelectActionRequestedEvent event,
    Emitter<_State> emit,
  ) async {
    alertDialogCubit.alertActionSheet(
      title: 'Select Action',
      actions: [
        AlertAction(
          'Save only this image',
          onPressed: () => add(
            PhotosSavedEvent(urls: [event.urls[event.index]]),
          ),
        ),
        AlertAction(
          'Save all',
          onPressed: () => add(PhotosSavedEvent(urls: event.urls)),
        ),
      ],
    );
  }

  Future<void> _onPhotosSavedEvent(
    PhotosSavedEvent event,
    Emitter<_State> emit,
  ) async {
    final photoPermission = await ExtendedPermission.photos;

    PermissionStatus photoPermissionStatus = await photoPermission.status;

    if (photoPermissionStatus.isDenied) {
      photoPermissionStatus = await photoPermission.request();
    }

    uiBlockingCubit.block();

    await Future.forEach(event.urls, _savePhoto);

    uiBlockingCubit.unblock();

    alertDialogCubit.alert(message: 'Save image success');
  }

  Future<void> _onAddPreviewMetadataRequestedEvent(
    AddPreviewMetadataRequestedEvent event,
    Emitter<_State> emit,
  ) async {
    final metadata = await linkify(event.text)
        .whereType<UrlElement>()
        .firstOrNull
        ?.url
        .let(RuejaiMetadataFetch.extract);

    if (metadata != null) {
      previewMetadataCubit.addPreviewMetadata(
        messageId: event.messageId,
        metadata: metadata,
      );
    }
  }

  Future<void> _onMessageResentEvent(
    MessageResentEvent event,
    Emitter<_State> emit,
  ) async {
    final state = this.state;
    final message = await memberService.chatRoomMessageAction.resendMessage(
      messageId: event.messageId,
    );

    if (state is LoadSuccessState) {
      final failedMessages = state.chatRoom.failedMessages
        ..removeWhere((message) => message.id == event.messageId);
      final sendingMessages = state.chatRoom.sendingMessages..add(message);

      emit(LoadSuccessState(
        chatRoom: state.chatRoom.copyWith(
          failedMessages: failedMessages,
          sendingMessages: sendingMessages,
        ),
      ));
    }
  }

  Future<void> _onMessageUnsendEvent(
    MessageUnsendEvent event,
    Emitter<_State> emit,
  ) async {}

  Future _savePhoto(String url) async {
    final fileName = 'ruejai_chat_${DateFormat('yyyymmdd_HHmmss').format(
      DateTime.now(),
    )}';
    final response = await Dio().get(
      url,
      options: Options(responseType: ResponseType.bytes),
    );

    await ImageGallerySaver.saveImage(
      Uint8List.fromList(response.data),
      name: fileName,
    );
  }

  Future<void> _copyTextMessage({
    required MemberTextMessage textMessage,
  }) async {
    final text = textMessage.text;

    if (text == null) return;

    final clipboard = SystemClipboard.instance;

    if (clipboard != null) {
      final item = DataWriterItem()..add(Formats.plainText(text));

      await clipboard.write([item]);

      alertDialogCubit.snackBar(title: 'Copied to clipboard successfully');
    } else {
      alertDialogCubit.errorAlert(
        error: Exception('Clipboard is not available on this platform'),
      );
    }
  }

  Future<void> _copyPhotoMessage({
    required MemberPhotoMessage photoMessage,
  }) async {
    final clipboard = SystemClipboard.instance;
    final urls = photoMessage.urls;

    if (clipboard != null && urls != null) {
      if (urls.length > 1) {
        final items = await Future.wait(urls.map(_createDataWriterItem));

        await clipboard.write(items);
      } else {
        final item = await _createDataWriterItem(urls.first);

        await clipboard.write([item]);
      }

      alertDialogCubit.snackBar(title: 'Copied to clipboard successfully');
    }
  }

  Future<DataWriterItem> _createDataWriterItem(String url) async {
    final image = await _createImageData(url: url);

    return DataWriterItem()..add(Formats.jpeg(image));
  }

  Future<Uint8List> _createImageData({required String url}) async {
    final imageByteData = await NetworkAssetBundle(Uri.parse(url)).load(url);
    final Uint8List data = (imageByteData).buffer.asUint8List();

    return data.buffer.asUint8List();
  }

  void onBroadcasterMessageReceived(broadcaster.BroadcasterMessage message) {
    switch (message) {
      case broadcaster.ChatRoom():
        onChatRoomMessageReceived(message);
      case broadcaster.UpdateSendingMessageToFailedMessage():
        add(UpdateSendingMessageToFailedMessageEvent());
    }
  }

  void onChatRoomMessageReceived(broadcaster.ChatRoom message) {
    final isCurrentChatRoomMessage = message.chatRoomId == chatRoomId;

    if (!isCurrentChatRoomMessage) return;

    switch (message) {
      case broadcaster.ChatRoomBasicInfo():
        onChatRoomBasicInfoBroadcasterMessageReceived(message);
      case broadcaster.ChatRoomMessage():
        onChatRoomMessageBroadcasterMessageReceived(message);
    }
  }

  void onChatRoomBasicInfoBroadcasterMessageReceived(
    broadcaster.ChatRoomBasicInfo message,
  ) {
    switch (message) {
      case broadcaster.ChatRoomBasicInfoUpdated():
        add(ChatRoomBasicInfoUpdatedEvent(
          chatRoomId: message.chatRoomId,
          name: message.name,
          thumbnailUrl: message.thumbnailUrl,
        ));
      case broadcaster.ChatRoomMemberAdded():
        add(ChatRoomMemberAddedEvent(
          chatRoomId: message.chatRoomId,
          member: message.member,
        ));
      case broadcaster.ChatRoomMemberUpdated():
        add(ChatRoomMemberUpdatedEvent(
          chatRoomId: message.chatRoomId,
          memberId: message.memberId,
          name: message.name,
          thumbnailUrl: message.thumbnailUrl,
        ));
      case broadcaster.ChatRoomMemberRemoved():
        add(ChatRoomMemberRemovedEvent(
          chatRoomId: message.chatRoomId,
          memberId: message.memberId,
        ));
      case broadcaster.ChatRoomMemberLastReadMessageUpdated():
        add(ChatRoomMemberLastReadMessageUpdatedEvent(
          chatRoomId: message.chatRoomId,
          memberId: message.memberId,
          lastReadMessageRecordNumber: message.lastReadMessageId,
        ));
    }
  }

  void onChatRoomMessageBroadcasterMessageReceived(
    broadcaster.ChatRoomMessage message,
  ) {
    switch (message) {
      case broadcaster.ChatRoomConfirmedMessageAdded():
        add(ChatRoomConfirmedMessageAddedEvent(
          chatRoomId: message.chatRoomId,
          message: message.message,
        ));
      case broadcaster.ChatRoomConfirmedMessageEdited():
        add(ChatRoomConfirmedMessageEditedEvent(
          chatRoomId: message.chatRoomId,
          message: message.message,
        ));
      case broadcaster.ChatRoomConfirmedMessageRemoved():
        add(ChatRoomConfirmedMessageRemovedEvent(
          chatRoomId: message.chatRoomId,
          messageId: message.messageId,
        ));
      case broadcaster.ChatRoomSendingMessageAdded():
        add(ChatRoomSendingMessageAddedEvent(
          chatRoomId: message.chatRoomId,
          message: message.message,
        ));
      case broadcaster.ChatRoomSendingMessageTimeOut():
        add(ChatRoomSendingMessageTimeOutEvent(
          chatRoomId: message.chatRoomId,
          messageId: message.messageId,
        ));
      case broadcaster.ChatRoomFailedMessageRetried():
        add(ChatRoomFailedMessageRetriedEvent(
          chatRoomId: message.chatRoomId,
          messageId: message.messageId,
        ));
      case broadcaster.ChatRoomFailedMessageRemoved():
        add(ChatRoomFailedMessageRemovedEvent(
          chatRoomId: message.chatRoomId,
          messageId: message.messageId,
        ));
    }
  }
}
