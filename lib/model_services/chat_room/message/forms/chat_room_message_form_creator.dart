import 'package:poc_chat_2/error.dart';
import 'package:poc_chat_2/model_services/chat_room/chat_room_inquiry.dart';
import 'package:poc_chat_2/models/chat_room_member.dart';
import 'package:poc_chat_2/models/events/event.dart';
import 'package:poc_chat_2/models/events/message_event.dart';
import 'package:poc_chat_2/models/events/recorded_event.dart';
import 'package:poc_chat_2/models/events/room_event.dart' as room_event;
import 'package:poc_chat_2/models/forms/message/activity_log_message_form.dart';
import 'package:poc_chat_2/models/forms/message/member_message_form.dart';
import 'package:poc_chat_2/models/forms/message/message_form.dart';
import 'package:poc_chat_2/models/mini_app.dart';
import 'package:poc_chat_2/repositories/local_chat_repository.dart';

part 'chat_room_member_message_form_creator.dart';
part 'chat_room_activity_log_message_form_creator.dart';

class ChatRoomMessageFormCreator {
  ChatRoomMessageFormCreator({
    required this.chatRoomId,
    required this.localChatRepository,
  }) : _chatRoomInquiry = ChatRoomInquiry(
          chatRoomId: chatRoomId,
          localChatRepository: localChatRepository,
        );

  final int chatRoomId;
  final LocalChatRepository localChatRepository;

  final ChatRoomInquiry _chatRoomInquiry;

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
    final recordNumber = recordedEvent.recordNumber;
    final recordedAt = recordedEvent.recordedAt;

    if (event is CreateTextMessageEvent) {
      return _createTextMessageFormFromEvent(
        event,
        member: member,
        recordNumber: recordNumber,
        recordedAt: recordedAt,
      );
    } else if (event is CreateTextReplyMessageEvent) {
      return _createTextReplyMessageFormFromEvent(
        event,
        chatRoomId: chatRoomId,
        member: member,
        recordNumber: recordNumber,
        recordedAt: recordedAt,
      );
    } else if (event is CreatePhotoMessageEvent) {
      return _createPhotoMessageFormFromEvent(
        event,
        member: member,
        recordNumber: recordNumber,
        recordedAt: recordedAt,
      );
    } else if (event is CreateVideoMessageEvent) {
      return _createVideoMessageFormFromEvent(
        event,
        member: member,
        recordNumber: recordNumber,
        recordedAt: recordedAt,
      );
    } else if (event is CreateFileMessageEvent) {
      return _createFileMessageFormFromEvent(
        event,
        member: member,
        recordNumber: recordNumber,
        recordedAt: recordedAt,
      );
    } else if (event is CreateMiniAppMessageEvent) {
      return _createMiniAppMessageFormFromEvent(
        event,
        member: member,
        recordNumber: recordNumber,
        recordedAt: recordedAt,
      );
    }

    throw UnprocessableEventError('Recorded event is not processable');
  }
}
