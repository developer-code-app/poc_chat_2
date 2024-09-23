import 'dart:async';

import 'package:poc_chat_2/broadcaster/broadcaster.dart' as broadcaster;
import 'package:poc_chat_2/cubits/alert_dialog_cubit.dart';
import 'package:poc_chat_2/models/chat_room.dart';
import 'package:poc_chat_2/models/chat_room_member.dart';
import 'package:poc_chat_2/models/forms/chat_room_form.dart';
import 'package:poc_chat_2/models/rue_jai_user.dart';
import 'package:poc_chat_2/pages/chats/chats_page_presenter.dart';
import 'package:poc_chat_2/services/member/member_service.dart';
import 'package:poc_chat_2/services/member/roles/basic_member_service.dart';
import 'package:poc_chat_2/services/rue_jai_user_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_chat_2/services/system_service.dart';

part 'chats_page_event.dart';
part 'chats_page_state.dart';

typedef _Event = ChatsPageEvent;
typedef _State = ChatsPageState;

class ChatsPageBloc extends Bloc<_Event, _State> {
  ChatsPageBloc({
    required this.currentRueJaiUser,
    required this.alertDialogCubit,
    required this.rueJaiUserService,
    required this.memberService,
    required this.systemService,
  }) : super(InitialState()) {
    on<StartedEvent>(_onStartedEvent);
    on<DataLoadedEvent>(_onDataLoaded);
    on<ErrorOccurredEvent>(_onErrorOccurred);
    on<DataLoadingRetriedEvent>(_onDataLoadingRetried);
    on<RefreshStartedEvent>(_onRefreshStartedEvent);
    on<CreateRoomRequestedEvent>(_onRoomCreatedEvent);

    broadcaster.Broadcaster.instance.stream.listen(
      onBroadcasterMessageReceived,
    );
  }

  final RueJaiUser currentRueJaiUser;
  final AlertDialogCubit alertDialogCubit;
  final RueJaiUserService rueJaiUserService;
  final MemberService memberService;
  final SystemService systemService;

  void onBroadcasterMessageReceived(broadcaster.BroadcasterMessage message) {
    switch (message) {
      case broadcaster.CreatedAndSyncedNewChatRooms():
        _refresh();
    }
  }

  Future<void> _onStartedEvent(
    StartedEvent event,
    Emitter<_State> emit,
  ) async {
    emit(LoadInProgressState());

    unawaited(_fetchChatsRoom());
  }

  Future<void> _onDataLoaded(
    DataLoadedEvent event,
    Emitter<_State> emit,
  ) async {
    emit(LoadSuccessState(
      chatRoomWithUnreadMessageCounts: event.chatRoomWithUnreadMessageCounts,
    ));
  }

  Future<void> _onErrorOccurred(
    ErrorOccurredEvent event,
    Emitter<_State> emit,
  ) async {
    emit(LoadFailureState(error: event.error));
  }

  Future<void> _onDataLoadingRetried(
    DataLoadingRetriedEvent event,
    Emitter<_State> emit,
  ) async {}

  Future<void> _onRefreshStartedEvent(
    RefreshStartedEvent event,
    Emitter<_State> emit,
  ) async {
    emit(LoadInProgressState());

    unawaited(_fetchChatsRoom());
  }

  Future<void> _onRoomCreatedEvent(
    CreateRoomRequestedEvent event,
    Emitter<_State> emit,
  ) async {
    try {
      final form = ChatRoomForm(
        name: event.name,
        members: [
          ChatRoomMemberForm(
            role: ChatRoomMemberRole.member,
            rueJaiUserId: currentRueJaiUser.rueJaiUserId,
            rueJaiUserType: currentRueJaiUser.rueJaiUserType,
          ),
        ],
      );

      rueJaiUserService.createChatRoom(form: form);
    } on Exception catch (error) {
      alertDialogCubit.errorAlert(error: error);
    }
  }

  Future<void> _fetchChatsRoom() async {
    try {
      final chatRooms = await rueJaiUserService.getChatRooms();
      final chatRoomWithUnreadMessageCounts = await Future.wait(
        chatRooms.map(
          (chatRoom) async => (
            chatRoom,
            await memberService.getUnreadMessageCount(),
          ),
        ),
      );

      add(DataLoadedEvent(
        chatRoomWithUnreadMessageCounts: chatRoomWithUnreadMessageCounts,
      ));
    } on Exception catch (error) {
      add(ErrorOccurredEvent(error: error));
    }
  }

  Future<void> _refresh() async {
    try {
      final chatRooms = await rueJaiUserService.getChatRooms();
      final chatRoomWithUnreadMessageCounts = await Future.wait(
        chatRooms.map(
          (chatRoom) async => (
            chatRoom,
            await memberService.getUnreadMessageCount(),
          ),
        ),
      );

      add(DataLoadedEvent(
        chatRoomWithUnreadMessageCounts: chatRoomWithUnreadMessageCounts,
      ));
    } on Exception catch (error) {
      alertDialogCubit.errorSnackBar(error);
    }
  }
}
