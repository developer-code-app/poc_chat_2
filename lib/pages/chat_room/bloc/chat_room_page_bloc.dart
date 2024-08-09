import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_chat_2/extensions/alert_dialog_convenience_showing.dart';
import 'package:wechat_camera_picker/wechat_camera_picker.dart';

import 'package:poc_chat_2/app/image_picker/image_picker.dart';
import 'package:poc_chat_2/app/image_picker/ruejai_camera_picker_text_delegate.dart';
import 'package:poc_chat_2/broadcaster/broadcaster.dart' as broadcaster;
import 'package:poc_chat_2/model_services/chat_room/event/chat_room_unrecorded_event_action.dart';
import 'package:poc_chat_2/cubits/alert_dialog_cubit.dart';
import 'package:poc_chat_2/cubits/assets_picker_cubit.dart';
import 'package:poc_chat_2/mock_data.dart';
import 'package:poc_chat_2/models/chat_room.dart';
import 'package:poc_chat_2/models/chat_room_member.dart';
import 'package:poc_chat_2/models/events/message_event.dart';
import 'package:poc_chat_2/models/message.dart';
import 'package:poc_chat_2/models/rue_jai_user.dart';
import 'package:poc_chat_2/pages/chat_room/chat_room_page_presenter.dart';
import 'package:poc_chat_2/repositories/local_chat_repository.dart';
import 'package:poc_chat_2/repositories/server_chat_repository.dart';

part 'chat_room_page_event.dart';
part 'chat_room_page_state.dart';

typedef _Event = ChatRoomPageEvent;
typedef _State = ChatRoomPageState;

class ChatRoomPageBloc extends Bloc<ChatRoomPageEvent, ChatRoomPageState> {
  ChatRoomPageBloc({
    required this.serverChatRepository,
    required this.localChatRepository,
    required this.chatRoom,
    required this.assetsPickerCubit,
    required this.alertDialogCubit,
  }) : super(InitialState()) {
    on<StartedEvent>(_onStartedEvent);
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
    on<AssetsPickerRequestedEvent>(_onAssetsPickerRequestedEvent);
    on<RemoveAssetRequestedEvent>(_onRemoveAssetRequestedEvent);
    on<ConfirmedMessageActionRequestedEvent>(
        _onConfirmedMessageActionRequestedEvent);
    on<FailedMessageActionRequestedEvent>(_onFailedMessageActionRequestedEvent);

    broadcaster.Broadcaster.instance.stream.listen(
      onBroadcasterMessageReceived,
    );
  }

  final ServerChatRepository serverChatRepository;
  final LocalChatRepository localChatRepository;
  final ChatRoom chatRoom;
  final AssetsPickerCubit assetsPickerCubit;
  final AlertDialogCubit alertDialogCubit;
  final currentUser = MockData.khunPatPong;

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
    final chatRoom = MockData.chatRoom2;

    emit(LoadSuccessState(chatRoom: chatRoom));
  }

  Future<void> _onMessageSentEvent(
    MessageSentEvent event,
    Emitter<_State> emit,
  ) async {
    unawaited(_processEvent(event.messageEvent));
  }

  Future<void> _onChatRoomBasicInfoUpdatedEvent(
    ChatRoomBasicInfoUpdatedEvent event,
    Emitter<_State> emit,
  ) async {
    emit(
      LoadSuccessState(
        chatRoom: chatRoom.copyWith(
          name: event.name,
          thumbnailUrl: event.thumbnailUrl,
        ),
      ),
    );
  }

  Future<void> _onChatRoomMemberAddedEvent(
    ChatRoomMemberAddedEvent event,
    Emitter<_State> emit,
  ) async {
    emit(
      LoadSuccessState(
        chatRoom: chatRoom.copyWith(
          members: chatRoom.members..add(event.member),
        ),
      ),
    );
  }

  Future<void> _onChatRoomMemberUpdatedEvent(
    ChatRoomMemberUpdatedEvent event,
    Emitter<_State> emit,
  ) async {
    final members = chatRoom.members;
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
        chatRoom: chatRoom.copyWith(members: members),
      ),
    );
  }

  Future<void> _onChatRoomMemberRemovedEvent(
    ChatRoomMemberRemovedEvent event,
    Emitter<_State> emit,
  ) async {
    emit(
      LoadSuccessState(
        chatRoom: chatRoom.copyWith(
          members: chatRoom.members
            ..removeWhere((member) => member.id == event.memberId),
        ),
      ),
    );
  }

  Future<void> _onChatRoomMemberLastReadMessageUpdatedEvent(
    ChatRoomMemberLastReadMessageUpdatedEvent event,
    Emitter<_State> emit,
  ) async {
    final members = chatRoom.members;
    final memberIndex =
        members.indexWhere((member) => member.id == event.memberId);
    final member = members[memberIndex]
        .copyWith(lastReadMessageId: event.lastReadMessageId);

    members.removeAt(memberIndex);
    members.insert(memberIndex, member);

    emit(
      LoadSuccessState(
        chatRoom: chatRoom.copyWith(members: members),
      ),
    );
  }

  Future<void> _onChatRoomConfirmedMessageAddedEvent(
    ChatRoomConfirmedMessageAddedEvent event,
    Emitter<_State> emit,
  ) async {
    final confirmedMessages = chatRoom.confirmedMessages;
    final sendingMessages = chatRoom.sendingMessages;
    final message = sendingMessages
        .where((message) => message.id == event.message.id)
        .firstOrNull;

    if (message != null) {
      sendingMessages.remove(message);
    }

    confirmedMessages.add(event.message);

    emit(
      LoadSuccessState(
        chatRoom: chatRoom.copyWith(
          confirmedMessages: confirmedMessages,
        ),
      ),
    );
  }

  Future<void> _onChatRoomConfirmedMessageEditedEvent(
    ChatRoomConfirmedMessageEditedEvent event,
    Emitter<_State> emit,
  ) async {
    final message = event.message;

    if (message is TextMessage) {
      final confirmedMessages = chatRoom.confirmedMessages;
      final messageIndex = confirmedMessages
          .indexWhere((message) => message.id == event.message.id);
      final confirmedMessage = confirmedMessages[messageIndex];

      if (confirmedMessage is TextMessage) {
        message.copyWith(text: confirmedMessage.text);
      }

      confirmedMessages.removeAt(messageIndex);
      confirmedMessages.insert(messageIndex, message);

      emit(
        LoadSuccessState(
          chatRoom: chatRoom.copyWith(
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
    final confirmedMessages = chatRoom.confirmedMessages;

    confirmedMessages.removeWhere((message) => message.id == event.messageId);

    emit(
      LoadSuccessState(
        chatRoom: chatRoom.copyWith(
          confirmedMessages: confirmedMessages,
        ),
      ),
    );
  }

  Future<void> _onChatRoomSendingMessageAddedEvent(
    ChatRoomSendingMessageAddedEvent event,
    Emitter<_State> emit,
  ) async {
    final sendingMessages = chatRoom.sendingMessages;

    sendingMessages.add(event.message);

    emit(
      LoadSuccessState(
        chatRoom: chatRoom.copyWith(
          sendingMessages: sendingMessages,
        ),
      ),
    );
  }

  Future<void> _onChatRoomSendingMessageTimeOutEvent(
    ChatRoomSendingMessageTimeOutEvent event,
    Emitter<_State> emit,
  ) async {
    final sendingMessages = chatRoom.sendingMessages;
    final failedMessages = chatRoom.failedMessages;
    final message = sendingMessages.firstWhere(
      (message) => message.id == event.messageId,
    );

    sendingMessages.remove(message);
    failedMessages.add(message);

    emit(
      LoadSuccessState(
        chatRoom: chatRoom.copyWith(
          sendingMessages: sendingMessages,
          failedMessages: failedMessages,
        ),
      ),
    );
  }

  Future<void> _onChatRoomFailedMessageRetriedEvent(
    ChatRoomFailedMessageRetriedEvent event,
    Emitter<_State> emit,
  ) async {
    final failedMessages = chatRoom.failedMessages;
    final sendingMessages = chatRoom.sendingMessages;
    final message = failedMessages.firstWhere(
      (message) => message.id == event.messageId,
    );

    failedMessages.remove(message);
    sendingMessages.add(message);

    emit(
      LoadSuccessState(
        chatRoom: chatRoom.copyWith(
          sendingMessages: sendingMessages,
          failedMessages: failedMessages,
        ),
      ),
    );
  }

  Future<void> _onChatRoomFailedMessageRemovedEvent(
    ChatRoomFailedMessageRemovedEvent event,
    Emitter<_State> emit,
  ) async {
    final failedMessages = chatRoom.failedMessages;

    failedMessages.removeWhere((message) => message.id == event.messageId);

    emit(
      LoadSuccessState(
        chatRoom: chatRoom.copyWith(
          failedMessages: failedMessages,
        ),
      ),
    );
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
          Navigator.of(context).pop();
          assetsPickerCubit.addAssets([result] + selectedAssets);
        }
      },
    );

    if (assets != null) {
      assetsPickerCubit.addAssets(assets);
    }
  }

  Future<void> _onRemoveAssetRequestedEvent(
    RemoveAssetRequestedEvent event,
    Emitter<_State> emit,
  ) async {
    assetsPickerCubit.remove(event.asset);
  }

  Future<void> _onConfirmedMessageActionRequestedEvent(
    ConfirmedMessageActionRequestedEvent event,
    Emitter<_State> emit,
  ) async {
    final state = this.state;

    if (state is LoadSuccessState) {
      final message = state.chatRoom.confirmedMessages
          .firstWhere((element) => element.id == event.messageId);
      final isOwner = currentUser.id == message.owner.id;

      alertDialogCubit.alertActionSheet(
        actions: [
          AlertAction('Reply'),
          if (message is PhotoMessage) AlertAction('Save All'),
          AlertAction('Copy'),
          if (isOwner) AlertAction('Unsend'),
        ],
      );
    }
  }

  Future<void> _onFailedMessageActionRequestedEvent(
    FailedMessageActionRequestedEvent event,
    Emitter<_State> emit,
  ) async {
    final state = this.state;

    if (state is LoadSuccessState) {
      final message = state.chatRoom.failedMessages
          .firstWhere((element) => element.id == event.messageId);

      alertDialogCubit.alertActionSheet(
        actions: [
          AlertAction('Resend'),
          if (message is PhotoMessage) AlertAction('Save All'),
          AlertAction('Copy'),
          AlertAction('Unsend'),
        ],
      );
    }
  }

  Future<void> _processEvent(MessageEvent event) async {
    try {
      await ChatRoomUnrecordedEventAction(
        chatRoomId: chatRoom.id,
        event: event,
        serverChatRepository: serverChatRepository,
        localChatRepository: localChatRepository,
      ).processEvent();
    } catch (error) {
      print(error);
    }
  }

  void onBroadcasterMessageReceived(broadcaster.BroadcasterMessage message) {
    final isCurrentChatRoomMessage =
        message is broadcaster.ChatRoom && message.chatRoomId == chatRoom.id;

    if (isCurrentChatRoomMessage) {
      switch (message) {
        case broadcaster.ChatRoomBasicInfo():
          onChatRoomBasicInfoBroadcasterMessageReceived(message);
          break;
        case broadcaster.ChatRoomMessage():
          onChatRoomMessageBroadcasterMessageReceived(message);
          break;
      }
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
          lastReadMessageId: message.lastReadMessageId,
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
