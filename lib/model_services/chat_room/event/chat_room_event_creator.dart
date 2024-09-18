import 'package:poc_chat_2/models/events/event.dart';
import 'package:poc_chat_2/models/events/message_event.dart' as message_event;
import 'package:poc_chat_2/models/events/room_event.dart'
    as room_management_event;
import 'package:poc_chat_2/models/rue_jai_user.dart';

class ChatRoomEventCreator {
  ChatRoomEventCreator({
    required this.chatRoomId,
    required RueJaiUser rueJaiUser,
  }) : owner = Owner(
          rueJaiUserId: rueJaiUser.rueJaiUserId,
          rueJaiUserType: rueJaiUser.rueJaiUserType,
        );

  final int chatRoomId;
  final Owner owner;

  room_management_event.InviteMemberEvent createInviteMemberEvent({
    required String name,
    required String thumbnailUrl,
    required room_management_event.ChatRoomMember member,
  }) {
    return room_management_event.InviteMemberEvent(
      id: generateEventId(),
      owner: owner,
      createdAt: getCreatedAt(),
      member: member,
    );
  }

  message_event.CreateTextMessageEvent createCreateTextMessageEvent({
    required String text,
  }) {
    return message_event.CreateTextMessageEvent(
      id: generateEventId(),
      owner: owner,
      createdAt: getCreatedAt(),
      text: text,
    );
  }

  DateTime getCreatedAt() {
    return DateTime.now();
  }

  String generateEventId() {
    return 'event_id';
  }
}
