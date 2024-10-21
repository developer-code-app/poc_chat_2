part of 'message.dart';

sealed class ActivityLogMessage extends Message {
  ActivityLogMessage({
    required super.id,
    required super.owner,
    required super.createdAt,
    required super.updatedAt,
    super.deletedAt,
    super.addedByEventRecordNumber,
    super.updatedByEventRecordNumber,
  });
}

class ActivityLogCreateRoomMessage extends ActivityLogMessage {
  ActivityLogCreateRoomMessage({
    required super.id,
    required super.owner,
    required super.createdAt,
    required super.updatedAt,
    super.deletedAt,
    super.addedByEventRecordNumber,
    super.updatedByEventRecordNumber,
  });
}

class ActivityLogInviteMemberMessage extends ActivityLogMessage {
  ActivityLogInviteMemberMessage({
    required super.id,
    required super.owner,
    required super.createdAt,
    required super.updatedAt,
    this.member,
    super.deletedAt,
    super.addedByEventRecordNumber,
    super.updatedByEventRecordNumber,
  });

  final ActivityLogMember? member;
}

class ActivityLogEditMemberRoleMessage extends ActivityLogMessage {
  ActivityLogEditMemberRoleMessage({
    required super.id,
    required super.owner,
    required super.createdAt,
    required super.updatedAt,
    this.member,
    this.newRole,
    super.deletedAt,
    super.addedByEventRecordNumber,
    super.updatedByEventRecordNumber,
  });

  final ActivityLogMember? member;
  final ChatRoomMemberRole? newRole;
}

class ActivityLogRemoveMemberMessage extends ActivityLogMessage {
  ActivityLogRemoveMemberMessage({
    required super.id,
    required super.owner,
    required super.createdAt,
    required super.updatedAt,
    this.member,
    super.deletedAt,
    super.addedByEventRecordNumber,
    super.updatedByEventRecordNumber,
  });

  final ActivityLogMember? member;
}

class ActivityLogMember {
  ActivityLogMember({
    required this.role,
    required this.rueJaiUserId,
    required this.rueJaiUserType,
  });

  factory ActivityLogMember.fromIsarModel(IsarChatRoomMember member) {
    return ActivityLogMember(
      role: member.role,
      rueJaiUserId: member.rueJaiUserId,
      rueJaiUserType: member.rueJaiUserType,
    );
  }

  final ChatRoomMemberRole role;
  final String rueJaiUserId;
  final RueJaiUserType rueJaiUserType;
}
