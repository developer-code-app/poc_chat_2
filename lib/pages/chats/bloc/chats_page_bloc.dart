import 'dart:async';

import 'package:poc_chat_2/models/chat_room.dart';
import 'package:poc_chat_2/pages/chats/chats_page_presenter.dart';
import 'package:poc_chat_2/services/member/member_service.dart';
import 'package:poc_chat_2/services/member/roles/basic_member_service.dart';
import 'package:poc_chat_2/services/rue_jai_user_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'chats_page_event.dart';
part 'chats_page_state.dart';

typedef _Event = ChatsPageEvent;
typedef _State = ChatsPageState;

class ChatsPageBloc extends Bloc<_Event, _State> {
  ChatsPageBloc({
    required this.rueJaiUserService,
    required this.memberService,
  }) : super(InitialState()) {
    on<StartedEvent>(_onStartedEvent);
    on<DataLoadedEvent>(_onDataLoaded);
    on<ErrorOccurredEvent>(_onErrorOccurred);
    on<DataLoadingRetriedEvent>(_onDataLoadingRetried);
  }

  final RueJaiUserService rueJaiUserService;
  final MemberService memberService;

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
  ) async {}

  Future<void> _onDataLoadingRetried(
    DataLoadingRetriedEvent event,
    Emitter<_State> emit,
  ) async {}

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
    } catch (error) {
      add(ErrorOccurredEvent());
    }
  }
}
