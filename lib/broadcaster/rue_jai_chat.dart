part of 'broadcaster.dart';

sealed class RueJaiChat extends BroadcasterMessage {}

class CreatedAndSyncedNewChatRooms extends RueJaiChat {}
