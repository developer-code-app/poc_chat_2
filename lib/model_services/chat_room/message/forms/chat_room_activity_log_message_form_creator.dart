part of 'chat_room_message_form_creator.dart';

extension ChatRoomActivityLogMessageFormCreator on ChatRoomMessageFormCreator {
  ActivityLogCreateRoomMessageForm
      _createActivityLogCreateRoomMessageFormFromEvent(
    room_event.CreateRoomEvent event, {
    required ChatRoomMember owner,
    required int recordNumber,
    required DateTime recordedAt,
  }) {
    return ActivityLogCreateRoomMessageForm(
      owner: owner,
      createdAt: recordedAt,
      createdByEventId: event.id,
      createdByEventRecordNumber: recordNumber,
    );
  }

  ActivityLogUpdateRoomMessageForm
      _createActivityLogUpdateRoomMessageFormFromEvent(
    room_event.UpdateRoomEvent event, {
    required ChatRoomMember owner,
    required int recordNumber,
    required DateTime recordedAt,
  }) {
    return ActivityLogUpdateRoomMessageForm(
      owner: owner,
      createdAt: recordedAt,
      createdByEventId: event.id,
      createdByEventRecordNumber: recordNumber,
    );
  }

  Future<ActivityLogInviteMemberMessageForm>
      _createActivityLogInviteMemberMessageFormFromEvent(
    room_event.InviteMemberEvent event, {
    required ChatRoomMember owner,
    required int recordNumber,
    required DateTime recordedAt,
  }) async {
    return ActivityLogInviteMemberMessageForm(
      owner: owner,
      createdAt: recordedAt,
      createdByEventId: event.id,
      createdByEventRecordNumber: recordNumber,
      invitedMember: ActivityLogMember(
        role: event.invitedMember.role,
        rueJaiUserId: event.invitedMember.rueJaiUserId,
        rueJaiUserType: event.invitedMember.rueJaiUserType,
      ),
    );
  }

  Future<ActivityLogUpdateMemberRoleMessageForm>
      _createActivityLogEditMemberRoleMessageFormFromEvent(
    room_event.UpdateMemberRoleEvent event, {
    required ChatRoomMember owner,
    required int recordNumber,
    required DateTime recordedAt,
  }) async {
    return ActivityLogUpdateMemberRoleMessageForm(
      owner: owner,
      createdAt: recordedAt,
      createdByEventId: event.id,
      createdByEventRecordNumber: recordNumber,
      updatedMember: ActivityLogMember(
        role: event.updatedMember.role,
        rueJaiUserId: event.updatedMember.rueJaiUserId,
        rueJaiUserType: event.updatedMember.rueJaiUserType,
      ),
      newRole: event.updatedMember.role,
    );
  }

  Future<ActivityLogUninviteMemberMessageForm>
      _createActivityLogUninviteMemberMessageFormFromEvent(
    room_event.UninviteMemberEvent event, {
    required ChatRoomMember owner,
    required int recordNumber,
    required DateTime recordedAt,
  }) async {
    return ActivityLogUninviteMemberMessageForm(
      owner: owner,
      createdAt: recordedAt,
      createdByEventId: event.id,
      createdByEventRecordNumber: recordNumber,
      uninvitedMember: ActivityLogMember(
        role: event.uninvitedMember.role,
        rueJaiUserId: event.uninvitedMember.rueJaiUserId,
        rueJaiUserType: event.uninvitedMember.rueJaiUserType,
      ),
    );
  }
}
