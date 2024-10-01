import 'dart:convert';

import 'package:poc_chat_2/mock_data.dart';
import 'package:poc_chat_2/models/messages/message_type.dart';
import 'package:poc_chat_2/models/chat_room_member.dart';
import 'package:poc_chat_2/models/mini_app.dart';
import 'package:poc_chat_2/providers/isar_storage/entities/isar_confirmed_message_entity.dart';
import 'package:poc_chat_2/providers/isar_storage/entities/isar_failed_message_entity.dart';
import 'package:poc_chat_2/providers/isar_storage/entities/isar_sending_message_entity.dart';
import 'package:poc_chat_2/providers/isar_storage/entities/isar_unconfirmed_message_entity.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'message.g.dart';
part 'member_message.dart';
part 'activity_log_message.dart';

sealed class Message {
  Message({
    required this.id,
    required this.owner,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    this.addedByEventRecordNumber,
    this.updatedByEventRecordNumber,
  });

  factory Message.fromConfirmedMessageEntity(
    IsarConfirmedMessageEntity entity,
  ) {
    switch (entity.type) {
      case MessageType.text:
        return MemberTextMessage.fromEntity();
      case MessageType.photo:
        return MemberPhotoMessage.fromEntity();
      case MessageType.video:
        return MemberVideoMessage.fromEntity();
      case MessageType.file:
        return MemberFileMessage.fromEntity();
      case MessageType.miniApp:
        return MemberMiniAppMessage.fromEntity();
    }
  }

  factory Message.fromUnconfirmedMessageEntity(
    IsarUnconfirmedMessageEntity entity,
  ) {
    switch (entity.type) {
      case MessageType.text:
        return MemberTextMessage.fromEntity();
      case MessageType.photo:
        return MemberPhotoMessage.fromEntity();
      case MessageType.video:
        return MemberVideoMessage.fromEntity();
      case MessageType.file:
        return MemberFileMessage.fromEntity();
      case MessageType.miniApp:
        return MemberMiniAppMessage.fromEntity();
    }
  }

  factory Message.fromSendingMessageEntity(
    IsarSendingMessageEntity entity,
  ) {
    final owner = entity.owner.value;

    if (owner == null) throw Exception('Owner not found');

    switch (entity.type) {
      case MessageType.text:
        return MemberTextMessage(
          id: entity.id,
          owner: ChatRoomMember.fromIsarEntity(owner),
          createdAt: entity.createdAt,
          updatedAt: entity.updatedAt,
          text: utf8.decode(entity.content),
        );
      case MessageType.photo:
        return MemberPhotoMessage.fromEntity();
      case MessageType.video:
        return MemberVideoMessage.fromEntity();
      case MessageType.file:
        return MemberFileMessage.fromEntity();
      case MessageType.miniApp:
        return MemberMiniAppMessage.fromEntity();
    }
  }

  factory Message.fromFailedMessageEntity(
    IsarFailedMessageEntity entity,
  ) {
    final owner = entity.owner.value;

    if (owner == null) throw Exception('Owner not found');

    switch (entity.type) {
      case MessageType.text:
        return MemberTextMessage(
          id: entity.id,
          owner: ChatRoomMember.fromIsarEntity(owner),
          createdAt: entity.createdAt,
          updatedAt: entity.updatedAt,
          text: utf8.decode(entity.content),
        );
      case MessageType.photo:
        return MemberPhotoMessage.fromEntity();
      case MessageType.video:
        return MemberVideoMessage.fromEntity();
      case MessageType.file:
        return MemberFileMessage.fromEntity();
      case MessageType.miniApp:
        return MemberMiniAppMessage.fromEntity();
    }
  }

  final int id;
  final ChatRoomMember owner;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final int? addedByEventRecordNumber;
  final int? updatedByEventRecordNumber;
}
