import 'package:poc_chat_2/models/chat_room_member.dart';
import 'package:poc_chat_2/models/events/event.dart';
import 'package:poc_chat_2/models/rue_jai_user.dart';

abstract class RoomManagementEvent extends Event {
  RoomManagementEvent({
    required super.id,
    required super.owner,
    required super.createdAt,
  });
}

class CreateRoomEvent extends RoomManagementEvent {
  CreateRoomEvent({
    required super.id,
    required super.owner,
    required super.createdAt,
    required this.name,
    required this.thumbnailUrl,
    required this.members,
  });

  final String name;
  final String thumbnailUrl;
  final List<Member> members;
}

class InviteMemberEvent extends RoomManagementEvent {
  InviteMemberEvent({
    required super.id,
    required super.owner,
    required super.createdAt,
    required this.member,
  });

  final Member member;
}

class UpdateMemberRoleEvent extends RoomManagementEvent {
  UpdateMemberRoleEvent({
    required super.id,
    required super.owner,
    required super.createdAt,
    required this.updatedMemberRecordNumber,
    required this.memberRole,
  });

  final int updatedMemberRecordNumber;
  final ChatRoomMemberRole memberRole;
}

class RemoveMemberEvent extends RoomManagementEvent {
  RemoveMemberEvent({
    required super.id,
    required super.owner,
    required super.createdAt,
    required this.removedMemberRecordNumber,
  });

  final int removedMemberRecordNumber;
}

class Member {
  Member({
    required this.role,
    required this.rueJaiUserId,
    required this.rueJaiUserType,
  });

  final ChatRoomMemberRole role;
  final String rueJaiUserId;
  final RueJaiUserType rueJaiUserType;
}
