import 'package:poc_chat_2/models/chat_room_member.dart';
import 'package:poc_chat_2/models/forms/message/message_form.dart';

sealed class ActivityLogMessageForm extends MessageForm {
  ActivityLogMessageForm({
    required super.owner,
    required super.createdAt,
    required super.updatedAt,
    required super.createdByEventId,
    super.deletedAt,
    super.addedByEventRecordNumber,
    super.updatedByEventRecordNumber,
  });
}

class ActivityLogCreateRoomMessageForm extends ActivityLogMessageForm {
  ActivityLogCreateRoomMessageForm({
    required super.owner,
    required super.createdAt,
    required super.updatedAt,
    required super.createdByEventId,
    super.deletedAt,
    super.addedByEventRecordNumber,
    super.updatedByEventRecordNumber,
  });
}

class ActivityLogInviteMemberMessageForm extends ActivityLogMessageForm {
  ActivityLogInviteMemberMessageForm({
    required super.owner,
    required super.createdAt,
    required super.updatedAt,
    required super.createdByEventId,
    required this.member,
    super.deletedAt,
    super.addedByEventRecordNumber,
    super.updatedByEventRecordNumber,
  });

  final ChatRoomMember member;
}

class ActivityLogEditMemberRoleMessageForm extends ActivityLogMessageForm {
  ActivityLogEditMemberRoleMessageForm({
    required super.owner,
    required super.createdAt,
    required super.updatedAt,
    required super.createdByEventId,
    required this.member,
    required this.newRole,
    super.deletedAt,
    super.addedByEventRecordNumber,
    super.updatedByEventRecordNumber,
  });

  final ChatRoomMember member;
  final ChatRoomMemberRole newRole;
}

class ActivityLogRemoveMemberMessageForm extends ActivityLogMessageForm {
  ActivityLogRemoveMemberMessageForm({
    required super.owner,
    required super.createdAt,
    required super.updatedAt,
    required super.createdByEventId,
    required this.member,
    super.deletedAt,
    super.addedByEventRecordNumber,
    super.updatedByEventRecordNumber,
  });

  final ChatRoomMember member;
}
