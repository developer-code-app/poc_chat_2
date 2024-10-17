part of 'chat_room_message_form_creator.dart';

extension ChatRoomMemberMessageFormCreator on ChatRoomMessageFormCreator {
  TextMessageForm _createTextMessageFormFromEvent(
    CreateTextMessageEvent event, {
    required ChatRoomMember owner,
    int? recordNumber,
    DateTime? recordedAt,
  }) {
    final text = event.text;

    return TextMessageForm(
      owner: owner,
      createdAt: recordedAt ?? event.createdAt,
      createdByEventId: event.id,
      createdByEventRecordNumber: recordNumber,
      text: text,
    );
  }

  Future<TextReplyMessageForm> _createTextReplyMessageFormFromEvent(
    CreateTextReplyMessageEvent event, {
    required String chatRoomId,
    required ChatRoomMember owner,
    int? recordNumber,
    DateTime? recordedAt,
  }) async {
    final text = event.text;

    final repliedMessage = await localChatRepository.getMessage(
      chatRoomId: chatRoomId,
      recordNumber: event.repliedMessageCreatedByEventRecordNumber,
    );

    if (repliedMessage == null) throw Exception();

    return TextReplyMessageForm(
      owner: owner,
      createdAt: recordedAt ?? event.createdAt,
      createdByEventId: event.id,
      repliedMessage: repliedMessage,
      createdByEventRecordNumber: recordNumber,
      text: text,
    );
  }

  PhotoMessageForm _createPhotoMessageFormFromEvent(
    CreatePhotoMessageEvent event, {
    required ChatRoomMember owner,
    int? recordNumber,
    DateTime? recordedAt,
  }) {
    final urls = event.urls;

    return PhotoMessageForm(
      owner: owner,
      createdAt: recordedAt ?? event.createdAt,
      createdByEventId: event.id,
      createdByEventRecordNumber: recordNumber,
      urls: urls,
    );
  }

  VideoMessageForm _createVideoMessageFormFromEvent(
    CreateVideoMessageEvent event, {
    required ChatRoomMember owner,
    int? recordNumber,
    DateTime? recordedAt,
  }) {
    final url = event.url;

    return VideoMessageForm(
      owner: owner,
      createdAt: recordedAt ?? event.createdAt,
      createdByEventId: event.id,
      createdByEventRecordNumber: recordNumber,
      url: url,
    );
  }

  FileMessageForm _createFileMessageFormFromEvent(
    CreateFileMessageEvent event, {
    required ChatRoomMember owner,
    int? recordNumber,
    DateTime? recordedAt,
  }) {
    final url = event.url;

    return FileMessageForm(
      owner: owner,
      createdAt: recordedAt ?? event.createdAt,
      createdByEventId: event.id,
      createdByEventRecordNumber: recordNumber,
      url: url,
    );
  }

  MiniAppMessageForm _createMiniAppMessageFormFromEvent(
    CreateMiniAppMessageEvent event, {
    required ChatRoomMember owner,
    int? recordNumber,
    DateTime? recordedAt,
  }) {
    return MiniAppMessageForm(
      owner: owner,
      createdAt: recordedAt ?? event.createdAt,
      createdByEventId: event.id,
      createdByEventRecordNumber: recordNumber,
      miniApp: MiniApp(),
    );
  }

  Future<ChatRoomMember> _getChatRoomMemberByEventOwner({
    required String chatRoomId,
    required Owner owner,
  }) async {
    return _chatRoomInquiry.getMemberByRueJaiUser(
      rueJaiUserId: owner.rueJaiUserId,
      rueJaiUserType: owner.rueJaiUserType,
    );
  }
}
