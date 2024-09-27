import 'package:poc_chat_2/models/events/message_event.dart';
import 'package:poc_chat_2/models/events/read_event.dart';
import 'package:poc_chat_2/models/events/room_event.dart';
import 'package:poc_chat_2/models/rue_jai_user.dart';
import 'package:poc_chat_2/providers/ruejai_chat/entities/rue_jai_chat_event_entity.dart';

abstract class Event {
  Event({
    required this.id,
    required this.owner,
    required this.createdAt,
  });

  factory Event.fromEntity({required RueJaiChatEventEntity entity}) {
    switch (entity) {
      case RueJaiChatCreateTextMessageEventEntity():
        return CreateTextMessageEvent.fromEntity(entity: entity);
      case RueJaiChatCreateTextReplyMessageEventEntity():
        return CreateTextReplyMessageEvent.fromEntity(entity: entity);
      case RueJaiChatCreatePhotoMessageEventEntity():
        return CreatePhotoMessageEvent.fromEntity(entity: entity);
      case RueJaiChatCreateVideoMessageEventEntity():
        return CreateVideoMessageEvent.fromEntity(entity: entity);
      case RueJaiChatCreateFileMessageEventEntity():
        return CreateFileMessageEvent.fromEntity(entity: entity);
      case RueJaiChatCreateHomeCareMessageEventEntity():
        return CreateMiniAppMessageEvent.fromEntity(entity: entity);
      case RueJaiChatTextEditedEventEntity():
        return UpdateTextMessageEvent.fromEntity(entity: entity);
      case RueJaiChatDeleteMessageEventEntity():
        return DeleteMessageEvent.fromEntity(entity: entity);
      case RueJaiChatReadMessageEventEntity():
        return ReadMessageEvent.fromEntity(entity: entity);
      case RueJaiChatCreateRoomEventEntity():
        return CreateRoomEvent.fromEntity(entity: entity);
      case RueJaiChatRoleEditedEventEntity():
        return UpdateMemberRoleEvent.fromEntity(entity: entity);
      case RueJaiChatInviteEventEntity():
        return InviteMemberEvent.fromEntity(entity: entity);
      case RueJaiChatRejectEventEntity():
        return RemoveMemberEvent.fromEntity(entity: entity);
      default:
        throw Exception('Unsupported event: ${entity.type}');
    }
  }

  final String id;
  final Owner owner;
  final DateTime createdAt;
}

class Owner {
  Owner({
    required this.rueJaiUserId,
    required this.rueJaiUserType,
  });

  factory Owner.fromEntity({
    required RueJaiChatOwnerEntity entity,
  }) {
    return Owner(
      rueJaiUserId: entity.rueJaiUserId,
      rueJaiUserType: entity.rueJaiUserType,
    );
  }

  final String rueJaiUserId;
  final RueJaiUserType rueJaiUserType;
}
