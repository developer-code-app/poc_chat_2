import 'package:poc_chat_2/models/chat_room_member.dart';
import 'package:poc_chat_2/models/message.dart';
import 'package:poc_chat_2/models/mini_app.dart';

sealed class MessageForm {
  MessageForm({
    required this.owner,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    this.addedByEventRecordNumber,
    this.updatedByEventRecordNumber,
  });

  final ChatRoomMember owner;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final int? addedByEventRecordNumber;
  final int? updatedByEventRecordNumber;
}

class TextMessageForm extends MessageForm {
  TextMessageForm({
    required super.owner,
    required super.createdAt,
    required super.updatedAt,
    super.deletedAt,
    super.addedByEventRecordNumber,
    super.updatedByEventRecordNumber,
    this.text,
  });

  final String? text;
}

class TextReplyMessageForm extends MessageForm {
  TextReplyMessageForm({
    required super.owner,
    required super.createdAt,
    required super.updatedAt,
    required this.repliedMessage,
    super.deletedAt,
    super.addedByEventRecordNumber,
    super.updatedByEventRecordNumber,
    this.text,
  });

  final Message repliedMessage;
  final String? text;
}

class PhotoMessageForm extends MessageForm {
  PhotoMessageForm({
    required super.owner,
    required super.createdAt,
    required super.updatedAt,
    required this.urls,
    super.deletedAt,
    super.addedByEventRecordNumber,
    super.updatedByEventRecordNumber,
  });

  final List<String> urls;
}

class VideoMessageForm extends MessageForm {
  VideoMessageForm({
    required super.owner,
    required super.createdAt,
    required super.updatedAt,
    required this.url,
    super.deletedAt,
    super.addedByEventRecordNumber,
    super.updatedByEventRecordNumber,
  });

  final String url;
}

class FileMessageForm extends MessageForm {
  FileMessageForm({
    required super.owner,
    required super.createdAt,
    required super.updatedAt,
    required this.url,
    super.deletedAt,
    super.addedByEventRecordNumber,
    super.updatedByEventRecordNumber,
  });

  final String url;
}

class MiniAppMessageForm extends MessageForm {
  MiniAppMessageForm({
    required super.owner,
    required super.createdAt,
    required super.updatedAt,
    required this.miniApp,
    super.deletedAt,
    super.addedByEventRecordNumber,
    super.updatedByEventRecordNumber,
  });

  final MiniApp miniApp;
}
