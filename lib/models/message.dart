import 'dart:convert';

import 'package:poc_chat_2/extensions/extended_nullable.dart';
import 'package:poc_chat_2/mock_data.dart';
import 'package:poc_chat_2/models/message_type.dart';
import 'package:poc_chat_2/models/mini_app.dart';
import 'package:poc_chat_2/models/chat_room_member.dart';
import 'package:poc_chat_2/providers/isar_storage/entities/isar_confirmed_message_entity.dart';
import 'package:poc_chat_2/providers/isar_storage/entities/isar_failed_message_entity.dart';
import 'package:poc_chat_2/providers/isar_storage/entities/isar_sending_message_entity.dart';
import 'package:poc_chat_2/providers/isar_storage/entities/isar_unconfirmed_message_entity.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'message.g.dart';

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

sealed class MemberMessage extends Message {
  MemberMessage({
    required super.id,
    required super.owner,
    required super.createdAt,
    required super.updatedAt,
    super.deletedAt,
    super.addedByEventRecordNumber,
    super.updatedByEventRecordNumber,
  });
}

sealed class ActivityLogMessage extends Message {
  ActivityLogMessage({
    required super.id,
    required super.owner,
    required super.createdAt,
    required super.updatedAt,
    super.deletedAt,
    super.addedByEventRecordNumber,
    super.updatedByEventRecordNumber,
  });
}

@CopyWith()
class MemberTextMessage extends MemberMessage {
  MemberTextMessage({
    required super.id,
    required super.owner,
    required super.createdAt,
    required super.updatedAt,
    super.deletedAt,
    super.addedByEventRecordNumber,
    super.updatedByEventRecordNumber,
    this.text,
  });

  factory MemberTextMessage.fromEntity() {
    return MockData.textMessage;
  }

  final String? text;
}

class MemberTextReplyMessage extends MemberMessage {
  MemberTextReplyMessage({
    required super.id,
    required super.owner,
    required super.createdAt,
    required super.updatedAt,
    required this.repliedMessage,
    super.deletedAt,
    super.addedByEventRecordNumber,
    super.updatedByEventRecordNumber,
    this.text,
  });

  factory MemberTextReplyMessage.fromEntity() {
    return MockData.textReplyMessage;
  }

  final MemberMessage repliedMessage;
  final String? text;
}

class MemberPhotoMessage extends MemberMessage {
  MemberPhotoMessage({
    required super.id,
    required super.owner,
    required super.createdAt,
    required super.updatedAt,
    this.urls,
    super.deletedAt,
    super.addedByEventRecordNumber,
    super.updatedByEventRecordNumber,
  });

  factory MemberPhotoMessage.fromEntity() {
    return MockData.photoMessage;
  }

  final List<String>? urls;
}

class MemberVideoMessage extends MemberMessage {
  MemberVideoMessage({
    required super.id,
    required super.owner,
    required super.createdAt,
    required super.updatedAt,
    this.url,
    super.deletedAt,
    super.addedByEventRecordNumber,
    super.updatedByEventRecordNumber,
  });

  factory MemberVideoMessage.fromEntity() {
    return MockData.videoMessage;
  }

  final String? url;
}

class MemberFileMessage extends MemberMessage {
  MemberFileMessage({
    required super.id,
    required super.owner,
    required super.createdAt,
    required super.updatedAt,
    this.url,
    super.deletedAt,
    super.addedByEventRecordNumber,
    super.updatedByEventRecordNumber,
  });

  factory MemberFileMessage.fromEntity() {
    return MockData.fileMessage;
  }

  final String? url;
}

class MemberMiniAppMessage extends MemberMessage {
  MemberMiniAppMessage({
    required super.id,
    required super.owner,
    required super.createdAt,
    required super.updatedAt,
    this.miniApp,
    super.deletedAt,
    super.addedByEventRecordNumber,
    super.updatedByEventRecordNumber,
  });

  factory MemberMiniAppMessage.fromEntity() {
    return MockData.miniAppMessage;
  }

  final MiniApp? miniApp;
}

class ActivityLogInviteMemberMessage extends ActivityLogMessage {
  ActivityLogInviteMemberMessage({
    required super.id,
    required super.owner,
    required super.createdAt,
    required super.updatedAt,
    required this.member,
    super.deletedAt,
    super.addedByEventRecordNumber,
    super.updatedByEventRecordNumber,
  });

  final ChatRoomMember member;
}

class ActivityLogRemoveMemberMessage extends ActivityLogMessage {
  ActivityLogRemoveMemberMessage({
    required super.id,
    required super.owner,
    required super.createdAt,
    required super.updatedAt,
    required this.member,
    super.deletedAt,
    super.addedByEventRecordNumber,
    super.updatedByEventRecordNumber,
  });

  final ChatRoomMember member;
}
