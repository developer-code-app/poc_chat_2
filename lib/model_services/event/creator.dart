import 'package:poc_chat_2/models/events/event.dart';
import 'package:poc_chat_2/models/events/room_event.dart'
    as room_management_event;
import 'package:poc_chat_2/models/events/room_event.dart';
import 'package:poc_chat_2/models/forms/chat_room_form.dart';
import 'package:poc_chat_2/models/rue_jai_user.dart';

class EventCreator {
  EventCreator({
    required RueJaiUser rueJaiUser,
  }) : owner = Owner(
          rueJaiUserId: rueJaiUser.rueJaiUserId,
          rueJaiUserType: rueJaiUser.rueJaiUserType,
        );

  final Owner owner;

  room_management_event.CreateRoomEvent createCreateRoomEventFromForm({
    required ChatRoomForm form,
  }) {
    return room_management_event.CreateRoomEvent(
      id: generateEventId(),
      owner: owner,
      createdAt: getCreatedAt(),
      name: form.name,
      thumbnailUrl: form.thumbnailUrl,
      members: form.members
          .map(
            (form) => ChatRoomMember(
              role: form.role,
              rueJaiUserId: form.rueJaiUserId,
              rueJaiUserType: form.rueJaiUserType,
            ),
          )
          .toList(),
    );
  }

  DateTime getCreatedAt() {
    return DateTime.now();
  }

  String generateEventId() {
    return 'event_id';
  }
}
