import 'package:poc_chat_2/models/chat_room_member.dart';
import 'package:poc_chat_2/models/forms/message/message_form.dart';

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

  final ChatRoomMember invitedMember;
}

class ActivityLogEditMemberRoleMessageForm extends ActivityLogMessageForm {
  ActivityLogEditMemberRoleMessageForm({
    required super.owner,
    required super.createdAt,
    required super.createdByEventId,
    required super.createdByEventRecordNumber,
    required this.editedMember,
    required this.newRole,
  });

  final ChatRoomMember editedMember;
  final ChatRoomMemberRole newRole;
}

class ActivityLogRemoveMemberMessageForm extends ActivityLogMessageForm {
  ActivityLogRemoveMemberMessageForm({
    required super.owner,
    required super.createdAt,
    required super.createdByEventId,
    required super.createdByEventRecordNumber,
    required this.removedMember,
  });

  final ChatRoomMember removedMember;
}
