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

  final String chatRoomId;
  final LocalChatRepository localChatRepository;

  final ChatRoomInquiry _chatRoomInquiry;

  Future<MessageForm> createMessageFormFromUnrecordedEvent({
    required Event event,
  }) async {
    final owner = await _getChatRoomMemberByEventOwner(
      chatRoomId: chatRoomId,
      owner: event.owner,
    );

    if (event is CreateTextMessageEvent) {
      return _createTextMessageFormFromEvent(
        event,
        owner: owner,
      );
    } else if (event is CreateTextReplyMessageEvent) {
      return _createTextReplyMessageFormFromEvent(
        event,
        chatRoomId: chatRoomId,
        owner: owner,
      );
    } else if (event is CreatePhotoMessageEvent) {
      return _createPhotoMessageFormFromEvent(
        event,
        owner: owner,
      );
    } else if (event is CreateVideoMessageEvent) {
      return _createVideoMessageFormFromEvent(
        event,
        owner: owner,
      );
    } else if (event is CreateFileMessageEvent) {
      return _createFileMessageFormFromEvent(
        event,
        owner: owner,
      );
    } else if (event is CreateMiniAppMessageEvent) {
      return _createMiniAppMessageFormFromEvent(
        event,
        owner: owner,
      );
    }

    throw UnprocessableEventError('Event is not a message event');
  }

  Future<MessageForm> createMessageFormFromRecordedEvent({
    required RecordedEvent recordedEvent,
  }) async {
    final event = recordedEvent.event;
    final owner = await _getChatRoomMemberByEventOwner(
      chatRoomId: chatRoomId,
      owner: event.owner,
    );
    final recordNumber = recordedEvent.recordNumber;
    final recordedAt = recordedEvent.recordedAt;

    if (event is CreateTextMessageEvent) {
      return _createTextMessageFormFromEvent(
        event,
        owner: owner,
        recordNumber: recordNumber,
        recordedAt: recordedAt,
      );
    } else if (event is CreateTextReplyMessageEvent) {
      return _createTextReplyMessageFormFromEvent(
        event,
        chatRoomId: chatRoomId,
        owner: owner,
        recordNumber: recordNumber,
        recordedAt: recordedAt,
      );
    } else if (event is CreatePhotoMessageEvent) {
      return _createPhotoMessageFormFromEvent(
        event,
        owner: owner,
        recordNumber: recordNumber,
        recordedAt: recordedAt,
      );
    } else if (event is CreateVideoMessageEvent) {
      return _createVideoMessageFormFromEvent(
        event,
        owner: owner,
        recordNumber: recordNumber,
        recordedAt: recordedAt,
      );
    } else if (event is CreateFileMessageEvent) {
      return _createFileMessageFormFromEvent(
        event,
        owner: owner,
        recordNumber: recordNumber,
        recordedAt: recordedAt,
      );
    } else if (event is CreateMiniAppMessageEvent) {
      return _createMiniAppMessageFormFromEvent(
        event,
        owner: owner,
        recordNumber: recordNumber,
        recordedAt: recordedAt,
      );
    } else if (event is room_event.CreateRoomEvent) {
      return _createActivityLogCreateRoomMessageFormFromEvent(
        event,
        owner: owner,
        recordNumber: recordNumber,
        recordedAt: recordedAt,
      );
    } else if (event is room_event.UpdateRoomEvent) {
      return _createActivityLogUpdateRoomMessageFormFromEvent(
        event,
        owner: owner,
        recordNumber: recordNumber,
        recordedAt: recordedAt,
      );
    } else if (event is room_event.InviteMemberEvent) {
      return _createActivityLogInviteMemberMessageFormFromEvent(
        event,
        owner: owner,
        recordNumber: recordNumber,
        recordedAt: recordedAt,
      );
    } else if (event is room_event.UpdateMemberRoleEvent) {
      return _createActivityLogEditMemberRoleMessageFormFromEvent(
        event,
        owner: owner,
        recordNumber: recordNumber,
        recordedAt: recordedAt,
      );
    } else if (event is room_event.UninviteMemberEvent) {
      return _createActivityLogUninviteMemberMessageFormFromEvent(
        event,
        owner: owner,
        recordNumber: recordNumber,
        recordedAt: recordedAt,
      );
    }

    throw UnprocessableEventError('Recorded event is not processable');
  }
}
