part of 'chat_room_page_bloc.dart';

sealed class ChatRoomPageState {}

final class InitialState extends _State {}

final class LoadSuccessState extends _State {
  LoadSuccessState({
    required this.chatRoom,
  }) : presenter = ChatRoomPagePresenter.fromModel(chatRoom);

  final ChatRoom chatRoom;
  final ChatRoomPagePresenter presenter;
}
