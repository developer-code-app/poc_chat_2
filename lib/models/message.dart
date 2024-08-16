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
        return TextMessage.fromEntity();
      case MessageType.photo:
        return PhotoMessage.fromEntity();
      case MessageType.video:
        return VideoMessage.fromEntity();
      case MessageType.file:
        return FileMessage.fromEntity();
      case MessageType.miniApp:
        return MiniAppMessage.fromEntity();
    }
  }

  factory Message.fromUnconfirmedMessageEntity(
    IsarUnconfirmedMessageEntity entity,
  ) {
    switch (entity.type) {
      case MessageType.text:
        return TextMessage.fromEntity();
      case MessageType.photo:
        return PhotoMessage.fromEntity();
      case MessageType.video:
        return VideoMessage.fromEntity();
      case MessageType.file:
        return FileMessage.fromEntity();
      case MessageType.miniApp:
        return MiniAppMessage.fromEntity();
    }
  }

  factory Message.fromSendingMessageEntity(
    IsarSendingMessageEntity entity,
  ) {
    switch (entity.type) {
      case MessageType.text:
        return TextMessage.fromEntity();
      case MessageType.photo:
        return PhotoMessage.fromEntity();
      case MessageType.video:
        return VideoMessage.fromEntity();
      case MessageType.file:
        return FileMessage.fromEntity();
      case MessageType.miniApp:
        return MiniAppMessage.fromEntity();
    }
  }

  factory Message.fromFailedMessageEntity(
    IsarFailedMessageEntity entity,
  ) {
    switch (entity.type) {
      case MessageType.text:
        return TextMessage.fromEntity();
      case MessageType.photo:
        return PhotoMessage.fromEntity();
      case MessageType.video:
        return VideoMessage.fromEntity();
      case MessageType.file:
        return FileMessage.fromEntity();
      case MessageType.miniApp:
        return MiniAppMessage.fromEntity();
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

@CopyWith()
class TextMessage extends Message {
  TextMessage({
    required super.id,
    required super.owner,
    required super.createdAt,
    required super.updatedAt,
    super.deletedAt,
    super.addedByEventRecordNumber,
    super.updatedByEventRecordNumber,
    this.text,
  });

  factory TextMessage.fromEntity() {
    return MockData.textMessage;
  }

  final String? text;
}

class TextReplyMessage extends Message {
  TextReplyMessage({
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

  factory TextReplyMessage.fromEntity() {
    return MockData.textReplyMessage;
  }

  final Message repliedMessage;
  final String? text;
}

class PhotoMessage extends Message {
  PhotoMessage({
    required super.id,
    required super.owner,
    required super.createdAt,
    required super.updatedAt,
    this.urls,
    super.deletedAt,
    super.addedByEventRecordNumber,
    super.updatedByEventRecordNumber,
  });

  factory PhotoMessage.fromEntity() {
    return MockData.photoMessage;
  }

  final List<String>? urls;
}

class VideoMessage extends Message {
  VideoMessage({
    required super.id,
    required super.owner,
    required super.createdAt,
    required super.updatedAt,
    this.url,
    super.deletedAt,
    super.addedByEventRecordNumber,
    super.updatedByEventRecordNumber,
  });

  factory VideoMessage.fromEntity() {
    return MockData.videoMessage;
  }

  final String? url;
}

class FileMessage extends Message {
  FileMessage({
    required super.id,
    required super.owner,
    required super.createdAt,
    required super.updatedAt,
    this.url,
    super.deletedAt,
    super.addedByEventRecordNumber,
    super.updatedByEventRecordNumber,
  });

  factory FileMessage.fromEntity() {
    return MockData.fileMessage;
  }

  final String? url;
}

class MiniAppMessage extends Message {
  MiniAppMessage({
    required super.id,
    required super.owner,
    required super.createdAt,
    required super.updatedAt,
    this.miniApp,
    super.deletedAt,
    super.addedByEventRecordNumber,
    super.updatedByEventRecordNumber,
  });

  factory MiniAppMessage.fromEntity() {
    return MockData.miniAppMessage;
  }

  final MiniApp? miniApp;
}
