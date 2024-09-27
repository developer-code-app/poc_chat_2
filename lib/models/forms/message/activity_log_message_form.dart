import 'package:poc_chat_2/models/forms/message/message_form.dart';

sealed class ActivityLogMessageForm extends MessageForm {
  ActivityLogMessageForm({
    required super.owner,
    required super.createdAt,
    required super.updatedAt,
    required super.createdByEventId,
  });
}

class InviteMemberActivityLogMessageForm extends ActivityLogMessageForm {
  InviteMemberActivityLogMessageForm({
    required super.owner,
    required super.createdAt,
    required super.updatedAt,
    required super.createdByEventId,
  });
}
