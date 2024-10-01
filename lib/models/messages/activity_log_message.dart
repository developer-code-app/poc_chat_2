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
    required this.member,
    super.deletedAt,
    super.addedByEventRecordNumber,
    super.updatedByEventRecordNumber,
  });

  final ChatRoomMember member;
}

class ActivityLogEditMemberRoleMessage extends ActivityLogMessage {
  ActivityLogEditMemberRoleMessage({
    required super.id,
    required super.owner,
    required super.createdAt,
    required super.updatedAt,
    required this.member,
    required this.newRole,
    super.deletedAt,
    super.addedByEventRecordNumber,
    super.updatedByEventRecordNumber,
  });

  final ChatRoomMember member;
  final ChatRoomMemberRole newRole;
}

class ActivityLogRemoveMemberMessage extends ActivityLogMessage {
  ActivityLogRemoveMemberMessage({
    required super.id,
    required super.owner,
    required super.createdAt,
    required super.updatedAt,
    required this.member,
    super.deletedAt,
    super.addedByEventRecordNumber,
    super.updatedByEventRecordNumber,
  });

  final ChatRoomMember member;
}
