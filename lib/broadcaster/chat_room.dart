part of 'broadcaster.dart';

sealed class ChatRoom extends BroadcasterMessage {
  ChatRoom({required this.chatRoomId});

  final String chatRoomId;
}
