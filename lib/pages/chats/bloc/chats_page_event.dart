part of 'chats_page_bloc.dart';

sealed class ChatsPageEvent {}

class StartedEvent extends _Event {}

class DataLoadedEvent extends _Event {
  DataLoadedEvent({
    required this.chatRoomWithUnreadMessageCounts,
  });

  final List<(ChatRoom, int)> chatRoomWithUnreadMessageCounts;
}

class ErrorOccurredEvent extends _Event {}

class DataLoadingRetriedEvent extends _Event {}
