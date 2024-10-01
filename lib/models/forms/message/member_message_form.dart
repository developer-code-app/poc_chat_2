import 'package:poc_chat_2/models/forms/message/message_form.dart';
import 'package:poc_chat_2/models/messages/message.dart';
import 'package:poc_chat_2/models/mini_app.dart';

sealed class MemberMessageForm extends MessageForm {
  MemberMessageForm({
    required super.owner,
    required super.createdAt,
    required super.updatedAt,
    required super.createdByEventId,
    super.deletedAt,
    super.addedByEventRecordNumber,
    super.updatedByEventRecordNumber,
  });
}

class TextMessageForm extends MemberMessageForm {
  TextMessageForm({
    required super.owner,
    required super.createdAt,
    required super.updatedAt,
    required super.createdByEventId,
    required this.text,
    super.deletedAt,
    super.addedByEventRecordNumber,
    super.updatedByEventRecordNumber,
  });

  final String text;
}

class TextReplyMessageForm extends MemberMessageForm {
  TextReplyMessageForm({
    required super.owner,
    required super.createdAt,
    required super.updatedAt,
    required super.createdByEventId,
    required this.repliedMessage,
    required this.text,
    super.deletedAt,
    super.addedByEventRecordNumber,
    super.updatedByEventRecordNumber,
  });

  final Message repliedMessage;
  final String text;
}

class PhotoMessageForm extends MemberMessageForm {
  PhotoMessageForm({
    required super.owner,
    required super.createdAt,
    required super.updatedAt,
    required super.createdByEventId,
    required this.urls,
    super.deletedAt,
    super.addedByEventRecordNumber,
    super.updatedByEventRecordNumber,
  });

  final List<String> urls;
}

class VideoMessageForm extends MemberMessageForm {
  VideoMessageForm({
    required super.owner,
    required super.createdAt,
    required super.updatedAt,
    required super.createdByEventId,
    required this.url,
    super.deletedAt,
    super.addedByEventRecordNumber,
    super.updatedByEventRecordNumber,
  });

  final String url;
}

class FileMessageForm extends MemberMessageForm {
  FileMessageForm({
    required super.owner,
    required super.createdAt,
    required super.updatedAt,
    required super.createdByEventId,
    required this.url,
    super.deletedAt,
    super.addedByEventRecordNumber,
    super.updatedByEventRecordNumber,
  });

  final String url;
}

class MiniAppMessageForm extends MemberMessageForm {
  MiniAppMessageForm({
    required super.owner,
    required super.createdAt,
    required super.updatedAt,
    required super.createdByEventId,
    required this.miniApp,
    super.deletedAt,
    super.addedByEventRecordNumber,
    super.updatedByEventRecordNumber,
  });

  final MiniApp miniApp;
}
