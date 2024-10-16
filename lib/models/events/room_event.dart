import 'package:poc_chat_2/models/chat_room_member.dart';
import 'package:poc_chat_2/models/events/event.dart';
import 'package:poc_chat_2/models/rue_jai_user.dart';
import 'package:poc_chat_2/providers/ruejai_chat/entities/rue_jai_chat_event_entity.dart';

sealed class RoomEvent extends Event {
  RoomEvent({
    required super.id,
    required super.owner,
    required super.createdAt,
  });
}

class CreateRoomEvent extends RoomEvent {
  CreateRoomEvent({
    required super.id,
    required super.owner,
    required super.createdAt,
    required this.name,
    required this.members,
    this.thumbnailUrl,
  });

  factory CreateRoomEvent.fromEntity({
    required RueJaiChatCreateRoomEventEntity entity,
  }) {
    return CreateRoomEvent(
      id: entity.id,
      owner: Owner.fromEntity(entity: entity.owner),
      createdAt: entity.createdAt,
      name: entity.name,
      members: entity.members
          .map((entity) => ChatRoomMember.fromEntity(entity: entity))
          .toList(),
    );
  }

  final String name;
  final String? thumbnailUrl;
  final List<ChatRoomMember> members;
}

class UpdateRoomEvent extends RoomEvent {
  UpdateRoomEvent({
    required super.id,
    required super.owner,
    required super.createdAt,
    this.name,
    this.thumbnailUrl,
  });

  factory UpdateRoomEvent.fromEntity({
    required RueJaiChatUpdateRoomEventEntity entity,
  }) {
    return UpdateRoomEvent(
      id: entity.id,
      owner: Owner.fromEntity(entity: entity.owner),
      createdAt: entity.createdAt,
      name: entity.name,
      thumbnailUrl: entity.thumbnailUrl,
    );
  }

  final String? name;
  final String? thumbnailUrl;
}

class InviteMemberEvent extends RoomEvent {
  InviteMemberEvent({
    required super.id,
    required super.owner,
    required super.createdAt,
    required this.invitedMember,
  });

  factory InviteMemberEvent.fromEntity({
    required RueJaiChatInviteMemberEventEntity entity,
  }) {
    return InviteMemberEvent(
      id: entity.id,
      owner: Owner.fromEntity(entity: entity.owner),
      createdAt: entity.createdAt,
      invitedMember: ChatRoomMember.fromEntity(entity: entity.invitedMember),
    );
  }

  final ChatRoomMember invitedMember;
}

class UpdateMemberRoleEvent extends RoomEvent {
  UpdateMemberRoleEvent({
    required super.id,
    required super.owner,
    required super.createdAt,
    required this.updatedMember,
  });

  factory UpdateMemberRoleEvent.fromEntity({
    required RueJaiChatUpdateMemberRoleEventEntity entity,
  }) {
    return UpdateMemberRoleEvent(
      id: entity.id,
      owner: Owner.fromEntity(entity: entity.owner),
      createdAt: entity.createdAt,
      updatedMember: ChatRoomMember.fromEntity(entity: entity.updatedMember),
    );
  }

  final ChatRoomMember updatedMember;
}

class UninviteMemberEvent extends RoomEvent {
  UninviteMemberEvent({
    required super.id,
    required super.owner,
    required super.createdAt,
    required this.uninvitedMember,
  });

  factory UninviteMemberEvent.fromEntity({
    required RueJaiChatUninviteMemberEventEntity entity,
  }) {
    return UninviteMemberEvent(
      id: entity.id,
      owner: Owner.fromEntity(entity: entity.owner),
      createdAt: entity.createdAt,
      uninvitedMember:
          ChatRoomMember.fromEntity(entity: entity.uninvitedMember),
    );
  }

  final ChatRoomMember uninvitedMember;
}

class ChatRoomMember {
  ChatRoomMember({
    required this.role,
    required this.rueJaiUserId,
    required this.rueJaiUserType,
  });

  factory ChatRoomMember.fromEntity({
    required RueJaiChatRoomMemberEventEntity entity,
  }) {
    return ChatRoomMember(
      role: entity.role,
      rueJaiUserId: entity.rueJaiUserId,
      rueJaiUserType: entity.rueJaiUserType,
    );
  }

  final ChatRoomMemberRole role;
  final String rueJaiUserId;
  final RueJaiUserType rueJaiUserType;
}
