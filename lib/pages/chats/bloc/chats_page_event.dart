part of 'chats_page_bloc.dart';

sealed class ChatsPageEvent {}

class StartedEvent extends _Event {}

class DataLoadedEvent extends _Event {
  DataLoadedEvent({
    required this.chatRoomWithUnreadMessageCounts,
  });

  final List<(ChatRoom, int)> chatRoomWithUnreadMessageCounts;
}

class ErrorOccurredEvent extends _Event {
  ErrorOccurredEvent({required this.error});

  final Exception error;
}

class DataLoadingRetriedEvent extends _Event {}

class RefreshStartedEvent extends _Event {}
