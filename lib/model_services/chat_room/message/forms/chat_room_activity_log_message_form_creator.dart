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

  Future<ActivityLogInviteMemberMessageForm>
      _createActivityLogInviteMemberMessageFormFromEvent(
    room_event.InviteMemberEvent event, {
    required ChatRoomMember owner,
    required int recordNumber,
    required DateTime recordedAt,
    required ChatRoomMember invitedMember,
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

  Future<ActivityLogEditMemberRoleMessageForm>
      _createActivityLogEditMembeRoleMessageFormFromEvent(
    room_event.UpdateMemberRoleEvent event, {
    required ChatRoomMember owner,
    required int recordNumber,
    required DateTime recordedAt,
  }) async {
    final editedMember = await _getChatRoomMemberByRoomEventChatRoomMember(
      chatRoomId: chatRoomId,
      member: event.updatedMember,
    );

    return ActivityLogEditMemberRoleMessageForm(
      owner: owner,
      createdAt: recordedAt,
      createdByEventId: event.id,
      createdByEventRecordNumber: recordNumber,
      editedMember: editedMember,
      newRole: event.updatedMember.role,
    );
  }

  Future<ActivityLogRemoveMemberMessageForm>
      _createActivityLogRemoveMemberMessageFormFromEvent(
    room_event.RemoveMemberEvent event, {
    required ChatRoomMember owner,
    required int recordNumber,
    required DateTime recordedAt,
  }) async {
    final removedMember = await _getChatRoomMemberByRoomEventChatRoomMember(
      chatRoomId: chatRoomId,
      member: event.removedMember,
    );

    return ActivityLogRemoveMemberMessageForm(
      owner: owner,
      createdAt: recordedAt,
      createdByEventId: event.id,
      createdByEventRecordNumber: recordNumber,
      removedMember: removedMember,
    );
  }

  Future<ChatRoomMember> _getChatRoomMemberByRoomEventChatRoomMember({
    required int chatRoomId,
    required room_event.ChatRoomMember member,
  }) async {
    return _chatRoomInquiry.getMemberByRueJaiUser(
      rueJaiUserId: member.rueJaiUserId,
      rueJaiUserType: member.rueJaiUserType,
    );
  }
}
