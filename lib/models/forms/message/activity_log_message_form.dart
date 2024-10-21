import 'package:poc_chat_2/models/chat_room_member.dart';
import 'package:poc_chat_2/models/forms/message/message_form.dart';
import 'package:poc_chat_2/models/messages/message.dart';

sealed class ActivityLogMessageForm extends MessageForm {
  ActivityLogMessageForm({
    required super.owner,
    required super.createdAt,
    required super.createdByEventId,
    required super.createdByEventRecordNumber,
  });
}

class ActivityLogCreateRoomMessageForm extends ActivityLogMessageForm {
  ActivityLogCreateRoomMessageForm({
    required super.owner,
    required super.createdAt,
    required super.createdByEventId,
    required super.createdByEventRecordNumber,
  });
}

class ActivityLogUpdateRoomMessageForm extends ActivityLogMessageForm {
  ActivityLogUpdateRoomMessageForm({
    required super.owner,
    required super.createdAt,
    required super.createdByEventId,
    required super.createdByEventRecordNumber,
  });
}

class ActivityLogInviteMemberMessageForm extends ActivityLogMessageForm {
  ActivityLogInviteMemberMessageForm({
    required super.owner,
    required super.createdAt,
    required super.createdByEventId,
    required super.createdByEventRecordNumber,
    required this.invitedMember,
  });

  final ActivityLogMember invitedMember;
}

class ActivityLogUpdateMemberRoleMessageForm extends ActivityLogMessageForm {
  ActivityLogUpdateMemberRoleMessageForm({
    required super.owner,
    required super.createdAt,
    required super.createdByEventId,
    required super.createdByEventRecordNumber,
    required this.updatedMember,
    required this.newRole,
  });

  final ActivityLogMember updatedMember;
  final ChatRoomMemberRole newRole;
}

class ActivityLogUninviteMemberMessageForm extends ActivityLogMessageForm {
  ActivityLogUninviteMemberMessageForm({
    required super.owner,
    required super.createdAt,
    required super.createdByEventId,
    required super.createdByEventRecordNumber,
    required this.uninvitedMember,
  });

  final ActivityLogMember uninvitedMember;
}
