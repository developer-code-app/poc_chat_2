part of 'chats_page_bloc.dart';

sealed class ChatsPageState {}

final class InitialState extends _State {}

final class LoadInProgressState extends _State {}

final class LoadSuccessState extends _State {
  LoadSuccessState({
    required this.chatRoomWithUnreadMessageCounts,
  }) : presenter =
            ChatsPagePresenter.fromModel(chatRoomWithUnreadMessageCounts);

  final List<(ChatRoom, int)> chatRoomWithUnreadMessageCounts;
  final ChatsPagePresenter presenter;
}

final class LoadFailureState extends _State {
  LoadFailureState({required this.error});

  final Exception error;
}
