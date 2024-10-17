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
    final invitedMember = await _getChatRoomMemberByRoomEventChatRoomMember(
      chatRoomId: chatRoomId,
      member: event.invitedMember,
    );

    return ActivityLogInviteMemberMessageForm(
      owner: owner,
      createdAt: recordedAt,
      createdByEventId: event.id,
      createdByEventRecordNumber: recordNumber,
      invitedMember: invitedMember,
    );
  }

  Future<ActivityLogUpdateMemberRoleMessageForm>
      _createActivityLogEditMemberRoleMessageFormFromEvent(
    room_event.UpdateMemberRoleEvent event, {
    required ChatRoomMember owner,
    required int recordNumber,
    required DateTime recordedAt,
  }) async {
    final updatedMember = await _getChatRoomMemberByRoomEventChatRoomMember(
      chatRoomId: chatRoomId,
      member: event.updatedMember,
    );

    return ActivityLogUpdateMemberRoleMessageForm(
      owner: owner,
      createdAt: recordedAt,
      createdByEventId: event.id,
      createdByEventRecordNumber: recordNumber,
      updatedMember: updatedMember,
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
    final uninvitedMember = await _getChatRoomMemberByRoomEventChatRoomMember(
      chatRoomId: chatRoomId,
      member: event.uninvitedMember,
    );

    return ActivityLogUninviteMemberMessageForm(
      owner: owner,
      createdAt: recordedAt,
      createdByEventId: event.id,
      createdByEventRecordNumber: recordNumber,
      uninvitedMember: uninvitedMember,
    );
  }

  Future<ChatRoomMember> _getChatRoomMemberByRoomEventChatRoomMember({
    required String chatRoomId,
    required room_event.ChatRoomMember member,
  }) async {
    return _chatRoomInquiry.getMemberByRueJaiUser(
      rueJaiUserId: member.rueJaiUserId,
      rueJaiUserType: member.rueJaiUserType,
    );
  }
}
