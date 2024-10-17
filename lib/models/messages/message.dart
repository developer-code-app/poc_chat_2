import 'dart:convert';

import 'package:dfunc/dfunc.dart';
import 'package:poc_chat_2/extensions/extended_nullable.dart';
import 'package:poc_chat_2/mock_data.dart';
import 'package:poc_chat_2/models/chat_room_member.dart';
import 'package:poc_chat_2/models/messages/message_type.dart';
import 'package:poc_chat_2/models/mini_app.dart';
import 'package:poc_chat_2/providers/isar_storage/entities/isar_confirmed_message_entity.dart';
import 'package:poc_chat_2/providers/isar_storage/entities/isar_failed_message_entity.dart';
import 'package:poc_chat_2/providers/isar_storage/entities/isar_sending_message_entity.dart';
import 'package:poc_chat_2/providers/isar_storage/entities/isar_unconfirmed_message_entity.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'message.g.dart';
part 'member_message.dart';
part 'activity_log_message.dart';

class _BaseMessage {
  _BaseMessage({
    required this.id,
    required this.owner,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    this.addedByEventRecordNumber,
    this.updatedByEventRecordNumber,
  });

  factory _BaseMessage.fromConfirmedMessageEntity(
    IsarConfirmedMessageEntity entity,
  ) {
    final owner = entity.owner.value
        .getOrThrowException(Exception('Owner not found'))
        .let(ChatRoomMember.fromIsarEntity);

    return _BaseMessage(
      id: entity.id,
      owner: owner,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      deletedAt: entity.deletedAt,
      addedByEventRecordNumber: entity.createdByRecordNumber,
      updatedByEventRecordNumber: entity.lastUpdatedByRecordNumber,
    );
  }

  factory _BaseMessage.fromUnconfirmedMessageEntity(
    IsarUnconfirmedMessageEntity entity,
  ) {
    final owner = entity.owner.value
        .getOrThrowException(Exception('Owner not found'))
        .let(ChatRoomMember.fromIsarEntity);

    return _BaseMessage(
      id: entity.id,
      owner: owner,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      deletedAt: entity.deletedAt,
      addedByEventRecordNumber: entity.createdByRecordNumber,
      updatedByEventRecordNumber: entity.lastUpdatedByRecordNumber,
    );
  }

  factory _BaseMessage.fromSendingMessageEntity(
    IsarSendingMessageEntity entity,
  ) {
    final owner = entity.owner.value
        .getOrThrowException(Exception('Owner not found'))
        .let(ChatRoomMember.fromIsarEntity);

    return _BaseMessage(
      id: entity.id,
      owner: owner,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      deletedAt: entity.deletedAt,
    );
  }

  factory _BaseMessage.fromFailedMessageEntity(
    IsarFailedMessageEntity entity,
  ) {
    final owner = entity.owner.value
        .getOrThrowException(Exception('Owner not found'))
        .let(ChatRoomMember.fromIsarEntity);

    return _BaseMessage(
      id: entity.id,
      owner: owner,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      deletedAt: entity.deletedAt,
    );
  }
  final int id;
  final ChatRoomMember owner;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final int? addedByEventRecordNumber;
  final int? updatedByEventRecordNumber;
}

sealed class Message extends _BaseMessage {
  Message({
    required super.id,
    required super.owner,
    required super.createdAt,
    required super.updatedAt,
    super.deletedAt,
    super.addedByEventRecordNumber,
    super.updatedByEventRecordNumber,
  });

  factory Message._fromBaseMessage({
    required _BaseMessage baseMessage,
    required MessageType type,
    List<int>? content,
  }) {
    final jsonValue = content?.let(
      (content) => json.decode(utf8.decode(content)) as Map<String, dynamic>,
    );

    switch (type) {
      case MessageType.memberText:
        return MemberTextMessage(
          id: baseMessage.id,
          owner: baseMessage.owner,
          createdAt: baseMessage.createdAt,
          updatedAt: baseMessage.updatedAt,
          deletedAt: baseMessage.deletedAt,
          addedByEventRecordNumber: baseMessage.addedByEventRecordNumber,
          updatedByEventRecordNumber: baseMessage.updatedByEventRecordNumber,
          text: jsonValue?['text'],
        );
      case MessageType.memberPhoto:
        return MemberPhotoMessage(
          id: baseMessage.id,
          owner: baseMessage.owner,
          createdAt: baseMessage.createdAt,
          updatedAt: baseMessage.updatedAt,
          deletedAt: baseMessage.deletedAt,
          addedByEventRecordNumber: baseMessage.addedByEventRecordNumber,
          updatedByEventRecordNumber: baseMessage.updatedByEventRecordNumber,
          urls: jsonValue?['urls'],
        );
      case MessageType.memberVideo:
        return MemberVideoMessage(
          id: baseMessage.id,
          owner: baseMessage.owner,
          createdAt: baseMessage.createdAt,
          updatedAt: baseMessage.updatedAt,
          deletedAt: baseMessage.deletedAt,
          addedByEventRecordNumber: baseMessage.addedByEventRecordNumber,
          updatedByEventRecordNumber: baseMessage.updatedByEventRecordNumber,
          url: jsonValue?['url'],
        );
      case MessageType.memberFile:
        return MemberFileMessage(
          id: baseMessage.id,
          owner: baseMessage.owner,
          createdAt: baseMessage.createdAt,
          updatedAt: baseMessage.updatedAt,
          deletedAt: baseMessage.deletedAt,
          addedByEventRecordNumber: baseMessage.addedByEventRecordNumber,
          updatedByEventRecordNumber: baseMessage.updatedByEventRecordNumber,
          url: jsonValue?['url'],
        );
      case MessageType.memberMiniApp:
        return MemberMiniAppMessage(
          id: baseMessage.id,
          owner: baseMessage.owner,
          createdAt: baseMessage.createdAt,
          updatedAt: baseMessage.updatedAt,
          deletedAt: baseMessage.deletedAt,
          addedByEventRecordNumber: baseMessage.addedByEventRecordNumber,
          updatedByEventRecordNumber: baseMessage.updatedByEventRecordNumber,
          miniApp: null,
        );
      case MessageType.memberTextReply:
        // TODO: Handle this case.
        throw Exception();
      case MessageType.activityLogCreateRoom:
        return ActivityLogCreateRoomMessage(
          id: baseMessage.id,
          owner: baseMessage.owner,
          createdAt: baseMessage.createdAt,
          updatedAt: baseMessage.updatedAt,
          deletedAt: baseMessage.deletedAt,
          addedByEventRecordNumber: baseMessage.addedByEventRecordNumber,
          updatedByEventRecordNumber: baseMessage.updatedByEventRecordNumber,
        );
      case MessageType.activityLogUpdateRoom:
        // TODO: Handle this case.
        throw Exception();
      case MessageType.activityLogInviteMember:
        return ActivityLogInviteMemberMessage(
          id: baseMessage.id,
          owner: baseMessage.owner,
          createdAt: baseMessage.createdAt,
          updatedAt: baseMessage.updatedAt,
          deletedAt: baseMessage.deletedAt,
          addedByEventRecordNumber: baseMessage.addedByEventRecordNumber,
          updatedByEventRecordNumber: baseMessage.updatedByEventRecordNumber,
          member: jsonValue?['member'],
        );
      case MessageType.activityLogUpdateMemberRole:
        // TODO: Handle this case.
        throw Exception();
      case MessageType.activityLogUninviteMember:
        // TODO: Handle this case.
        throw Exception();
    }
  }

  factory Message.fromConfirmedMessageEntity(
    IsarConfirmedMessageEntity entity,
  ) {
    return Message._fromBaseMessage(
      baseMessage: _BaseMessage.fromConfirmedMessageEntity(entity),
      type: entity.type,
      content: entity.content,
    );
  }

  factory Message.fromUnconfirmedMessageEntity(
    IsarUnconfirmedMessageEntity entity,
  ) {
    return Message._fromBaseMessage(
      baseMessage: _BaseMessage.fromUnconfirmedMessageEntity(entity),
      type: entity.type,
      content: entity.content,
    );
  }

  factory Message.fromSendingMessageEntity(
    IsarSendingMessageEntity entity,
  ) {
    return Message._fromBaseMessage(
      baseMessage: _BaseMessage.fromSendingMessageEntity(entity),
      type: entity.type,
      content: entity.content,
    );
  }

  factory Message.fromFailedMessageEntity(
    IsarFailedMessageEntity entity,
  ) {
    return Message._fromBaseMessage(
      baseMessage: _BaseMessage.fromFailedMessageEntity(entity),
      type: entity.type,
      content: entity.content,
    );
  }
}
