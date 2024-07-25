import 'package:poc_chat_2/error.dart';
import 'package:poc_chat_2/model_services/chat_room/chat_room_inquiry.dart';
import 'package:poc_chat_2/models/chat_room_member.dart';
import 'package:poc_chat_2/models/events/event.dart';
import 'package:poc_chat_2/models/events/message_event.dart';
import 'package:poc_chat_2/models/events/recorded_event.dart';
import 'package:poc_chat_2/models/forms/message_form.dart';
import 'package:poc_chat_2/models/mini_app.dart';
import 'package:poc_chat_2/providers/isar_storage/isar_storage_provider.dart';
import 'package:poc_chat_2/repositories/local_chat_repository.dart';

class ChatRoomMessageFormCreator {
  ChatRoomMessageFormCreator({
    required this.chatRoomId,
  }) : _chatRoomInquiry = ChatRoomInquiry(
          chatRoomId: chatRoomId,
        );

  final int chatRoomId;

  final ChatRoomInquiry _chatRoomInquiry;
  final _localChatRepository = LocalChatRepository(
    provider: IsarStorageProvider.basic(),
  );

  Future<MessageForm> createMessageFormFromUnrecordedEvent({
    required Event event,
  }) async {
    final member = await _getChatRoomMemberByEventOwner(
      chatRoomId: chatRoomId,
      owner: event.owner,
    );

    if (event is CreateTextMessageEvent) {
      return _createTextMessageFormFromEvent(
        event,
        member: member,
      );
    } else if (event is CreateTextReplyMessageEvent) {
      return _createTextReplyMessageFormFromEvent(
        event,
        chatRoomId: chatRoomId,
        member: member,
      );
    } else if (event is CreatePhotoMessageEvent) {
      return _createPhotoMessageFormFromEvent(
        event,
        member: member,
      );
    } else if (event is CreateVideoMessageEvent) {
      return _createVideoMessageFormFromEvent(
        event,
        member: member,
      );
    } else if (event is CreateFileMessageEvent) {
      return _createFileMessageFormFromEvent(
        event,
        member: member,
      );
    } else if (event is CreateMiniAppMessageEvent) {
      return _createMiniAppMessageFormFromEvent(
        event,
        member: member,
      );
    }

    throw UnprocessableEventError('Event is not a message event');
  }

  Future<MessageForm> createMessageFormFromRecordedEvent({
    required RecordedEvent recordedEvent,
  }) async {
    final event = recordedEvent.event;
    final member = await _getChatRoomMemberByEventOwner(
      chatRoomId: chatRoomId,
      owner: event.owner,
    );

    if (event is CreateTextMessageEvent) {
      return _createTextMessageFormFromEvent(
        event,
        member: member,
        recordNumber: recordedEvent.recordNumber,
        recordedAt: recordedEvent.recordedAt,
      );
    } else if (event is CreateTextReplyMessageEvent) {
      return _createTextReplyMessageFormFromEvent(
        event,
        chatRoomId: chatRoomId,
        member: member,
        recordNumber: recordedEvent.recordNumber,
        recordedAt: recordedEvent.recordedAt,
      );
    } else if (event is CreatePhotoMessageEvent) {
      return _createPhotoMessageFormFromEvent(
        event,
        member: member,
        recordNumber: recordedEvent.recordNumber,
        recordedAt: recordedEvent.recordedAt,
      );
    } else if (event is CreateVideoMessageEvent) {
      return _createVideoMessageFormFromEvent(
        event,
        member: member,
        recordNumber: recordedEvent.recordNumber,
        recordedAt: recordedEvent.recordedAt,
      );
    } else if (event is CreateFileMessageEvent) {
      return _createFileMessageFormFromEvent(
        event,
        member: member,
        recordNumber: recordedEvent.recordNumber,
        recordedAt: recordedEvent.recordedAt,
      );
    } else if (event is CreateMiniAppMessageEvent) {
      return _createMiniAppMessageFormFromEvent(
        event,
        member: member,
        recordNumber: recordedEvent.recordNumber,
        recordedAt: recordedEvent.recordedAt,
      );
    }

    throw UnprocessableEventError('Event is not a message event');
  }

  TextMessageForm _createTextMessageFormFromEvent(
    CreateTextMessageEvent event, {
    required ChatRoomMember member,
    int? recordNumber,
    DateTime? recordedAt,
  }) {
    return TextMessageForm(
      owner: member,
      createdAt: recordedAt ?? event.createdAt,
      updatedAt: recordedAt ?? event.createdAt,
      addedByEventRecordNumber: recordNumber,
      updatedByEventRecordNumber: recordNumber,
      text: event.text,
    );
  }

  Future<TextReplyMessageForm> _createTextReplyMessageFormFromEvent(
    CreateTextReplyMessageEvent event, {
    required int chatRoomId,
    required ChatRoomMember member,
    int? recordNumber,
    DateTime? recordedAt,
  }) async {
    final repliedMessage = await _localChatRepository.getMessage(
      chatRoomId: chatRoomId,
      recordNumber: event.repliedMessageAddedByEventRecordNumber,
    );

    if (repliedMessage == null) throw Exception();

    return TextReplyMessageForm(
      owner: member,
      createdAt: recordedAt ?? event.createdAt,
      updatedAt: recordedAt ?? event.createdAt,
      repliedMessage: repliedMessage,
      addedByEventRecordNumber: recordNumber,
      updatedByEventRecordNumber: recordNumber,
      text: event.text,
    );
  }

  PhotoMessageForm _createPhotoMessageFormFromEvent(
    CreatePhotoMessageEvent event, {
    required ChatRoomMember member,
    int? recordNumber,
    DateTime? recordedAt,
  }) {
    return PhotoMessageForm(
      owner: member,
      createdAt: recordedAt ?? event.createdAt,
      updatedAt: recordedAt ?? event.createdAt,
      addedByEventRecordNumber: recordNumber,
      updatedByEventRecordNumber: recordNumber,
      urls: event.urls,
    );
  }

  VideoMessageForm _createVideoMessageFormFromEvent(
    CreateVideoMessageEvent event, {
    required ChatRoomMember member,
    int? recordNumber,
    DateTime? recordedAt,
  }) {
    return VideoMessageForm(
      owner: member,
      createdAt: recordedAt ?? event.createdAt,
      updatedAt: recordedAt ?? event.createdAt,
      addedByEventRecordNumber: recordNumber,
      updatedByEventRecordNumber: recordNumber,
      url: event.url,
    );
  }

  FileMessageForm _createFileMessageFormFromEvent(
    CreateFileMessageEvent event, {
    required ChatRoomMember member,
    int? recordNumber,
    DateTime? recordedAt,
  }) {
    return FileMessageForm(
      owner: member,
      createdAt: recordedAt ?? event.createdAt,
      updatedAt: recordedAt ?? event.createdAt,
      addedByEventRecordNumber: recordNumber,
      updatedByEventRecordNumber: recordNumber,
      url: event.url,
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
      updatedAt: recordedAt ?? event.createdAt,
      addedByEventRecordNumber: recordNumber,
      updatedByEventRecordNumber: recordNumber,
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
