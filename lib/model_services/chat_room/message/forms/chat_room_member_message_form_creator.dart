part of 'chat_room_message_form_creator.dart';

extension ChatRoomMemberMessageFormCreator on ChatRoomMessageFormCreator {
  Future<MessageForm> createMessageFormFromRecordedEvent({
    required RecordedEvent recordedEvent,
  }) async {
    final event = recordedEvent.event;
    final ownerMember = await _getChatRoomMemberByEventOwner(
      chatRoomId: chatRoomId,
      owner: event.owner,
    );

    if (event is CreateTextMessageEvent) {
      return _createTextMessageFormFromEvent(
        event,
        member: ownerMember,
        recordNumber: recordedEvent.recordNumber,
        recordedAt: recordedEvent.recordedAt,
      );
    } else if (event is CreateTextReplyMessageEvent) {
      return _createTextReplyMessageFormFromEvent(
        event,
        chatRoomId: chatRoomId,
        member: ownerMember,
        recordNumber: recordedEvent.recordNumber,
        recordedAt: recordedEvent.recordedAt,
      );
    } else if (event is CreatePhotoMessageEvent) {
      return _createPhotoMessageFormFromEvent(
        event,
        member: ownerMember,
        recordNumber: recordedEvent.recordNumber,
        recordedAt: recordedEvent.recordedAt,
      );
    } else if (event is CreateVideoMessageEvent) {
      return _createVideoMessageFormFromEvent(
        event,
        member: ownerMember,
        recordNumber: recordedEvent.recordNumber,
        recordedAt: recordedEvent.recordedAt,
      );
    } else if (event is CreateFileMessageEvent) {
      return _createFileMessageFormFromEvent(
        event,
        member: ownerMember,
        recordNumber: recordedEvent.recordNumber,
        recordedAt: recordedEvent.recordedAt,
      );
    } else if (event is CreateMiniAppMessageEvent) {
      return _createMiniAppMessageFormFromEvent(
        event,
        member: ownerMember,
        recordNumber: recordedEvent.recordNumber,
        recordedAt: recordedEvent.recordedAt,
      );
    } else if (event is room_event.CreateRoomEvent) {
      throw UnimplementedError();
    } else if (event is room_event.InviteMemberEvent) {
      throw UnimplementedError();
    } else if (event is room_event.UpdateMemberRoleEvent) {
      throw UnimplementedError();
    } else if (event is room_event.RemoveMemberEvent) {
      throw UnimplementedError();
    }

    throw UnprocessableEventError('Event is not a message event');
  }

  TextMessageForm _createTextMessageFormFromEvent(
    CreateTextMessageEvent event, {
    required ChatRoomMember member,
    int? recordNumber,
    DateTime? recordedAt,
  }) {
    final text = event.text;

    if (text == null) throw Exception();

    return TextMessageForm(
      owner: member,
      createdAt: recordedAt ?? event.createdAt,
      createdByEventId: event.id,
      createdByEventRecordNumber: recordNumber,
      text: text,
    );
  }

  Future<TextReplyMessageForm> _createTextReplyMessageFormFromEvent(
    CreateTextReplyMessageEvent event, {
    required int chatRoomId,
    required ChatRoomMember member,
    int? recordNumber,
    DateTime? recordedAt,
  }) async {
    final text = event.text;

    if (text == null) throw Exception();

    final repliedMessage = await localChatRepository.getMessage(
      chatRoomId: chatRoomId,
      recordNumber: event.repliedMessageAddedByEventRecordNumber,
    );

    if (repliedMessage == null) throw Exception();

    return TextReplyMessageForm(
      owner: member,
      createdAt: recordedAt ?? event.createdAt,
      createdByEventId: event.id,
      repliedMessage: repliedMessage,
      createdByEventRecordNumber: recordNumber,
      text: text,
    );
  }

  PhotoMessageForm _createPhotoMessageFormFromEvent(
    CreatePhotoMessageEvent event, {
    required ChatRoomMember member,
    int? recordNumber,
    DateTime? recordedAt,
  }) {
    final urls = event.urls;

    if (urls == null) throw Exception();

    return PhotoMessageForm(
      owner: member,
      createdAt: recordedAt ?? event.createdAt,
      createdByEventId: event.id,
      createdByEventRecordNumber: recordNumber,
      urls: urls,
    );
  }

  VideoMessageForm _createVideoMessageFormFromEvent(
    CreateVideoMessageEvent event, {
    required ChatRoomMember member,
    int? recordNumber,
    DateTime? recordedAt,
  }) {
    final url = event.url;

    if (url == null) throw Exception();

    return VideoMessageForm(
      owner: member,
      createdAt: recordedAt ?? event.createdAt,
      createdByEventId: event.id,
      createdByEventRecordNumber: recordNumber,
      url: url,
    );
  }

  FileMessageForm _createFileMessageFormFromEvent(
    CreateFileMessageEvent event, {
    required ChatRoomMember member,
    int? recordNumber,
    DateTime? recordedAt,
  }) {
    final url = event.url;

    if (url == null) throw Exception();

    return FileMessageForm(
      owner: member,
      createdAt: recordedAt ?? event.createdAt,
      createdByEventId: event.id,
      createdByEventRecordNumber: recordNumber,
      url: url,
    );
  }

  MiniAppMessageForm _createMiniAppMessageFormFromEvent(
    CreateMiniAppMessageEvent event, {
    required ChatRoomMember member,
    int? recordNumber,
    DateTime? recordedAt,
  }) {
    return MiniAppMessageForm(
      owner: member,
      createdAt: recordedAt ?? event.createdAt,
      createdByEventId: event.id,
      createdByEventRecordNumber: recordNumber,
      miniApp: MiniApp(),
    );
  }

  Future<ChatRoomMember> _getChatRoomMemberByEventOwner({
    required int chatRoomId,
    required Owner owner,
  }) async {
    return _chatRoomInquiry.getMemberByRueJaiUser(
      rueJaiUserId: owner.rueJaiUserId,
      rueJaiUserType: owner.rueJaiUserType,
    );
  }
}
