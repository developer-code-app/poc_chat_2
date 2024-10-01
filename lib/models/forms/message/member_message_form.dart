import 'package:poc_chat_2/models/forms/message/message_form.dart';
import 'package:poc_chat_2/models/messages/message.dart';
import 'package:poc_chat_2/models/mini_app.dart';

sealed class MemberMessageForm extends MessageForm {
  MemberMessageForm({
    required super.owner,
    required super.createdAt,
    required super.createdByEventId,
    super.createdByEventRecordNumber,
  });
}

class TextMessageForm extends MemberMessageForm {
  TextMessageForm({
    required super.owner,
    required super.createdAt,
    required super.createdByEventId,
    required this.text,
    super.createdByEventRecordNumber,
  });

  final String text;
}

class TextReplyMessageForm extends MemberMessageForm {
  TextReplyMessageForm({
    required super.owner,
    required super.createdAt,
    required super.createdByEventId,
    required this.repliedMessage,
    required this.text,
    super.createdByEventRecordNumber,
  });

  final Message repliedMessage;
  final String text;
}

class PhotoMessageForm extends MemberMessageForm {
  PhotoMessageForm({
    required super.owner,
    required super.createdAt,
    required super.createdByEventId,
    required this.urls,
    super.createdByEventRecordNumber,
  });

  final List<String> urls;
}

class VideoMessageForm extends MemberMessageForm {
  VideoMessageForm({
    required super.owner,
    required super.createdAt,
    required super.createdByEventId,
    required this.url,
    super.createdByEventRecordNumber,
  });

  final String url;
}

class FileMessageForm extends MemberMessageForm {
  FileMessageForm({
    required super.owner,
    required super.createdAt,
    required super.createdByEventId,
    required this.url,
    super.createdByEventRecordNumber,
  });

  final String url;
}

class MiniAppMessageForm extends MemberMessageForm {
  MiniAppMessageForm({
    required super.owner,
    required super.createdAt,
    required super.createdByEventId,
    required this.miniApp,
    super.createdByEventRecordNumber,
  });

  final MiniApp miniApp;
}
