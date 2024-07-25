import 'package:poc_chat_2/models/events/event.dart';

abstract class MessageEvent extends Event {
  MessageEvent({
    required super.id,
    required super.owner,
    required super.createdAt,
  });
}

abstract class CreateMessageEvent extends MessageEvent {
  CreateMessageEvent({
    required super.id,
    required super.owner,
    required super.createdAt,
  });
}

abstract class UpdateMessageEvent extends MessageEvent {
  UpdateMessageEvent({
    required super.id,
    required super.owner,
    required super.createdAt,
    required this.updatedMessageRecordNumber,
  });

  int updatedMessageRecordNumber;
}

class CreateTextMessageEvent extends CreateMessageEvent {
  CreateTextMessageEvent({
    required super.id,
    required super.owner,
    required super.createdAt,
    required this.text,
  });

  final String text;
}

class CreateTextReplyMessageEvent extends CreateMessageEvent {
  CreateTextReplyMessageEvent({
    required super.id,
    required super.owner,
    required super.createdAt,
    required this.repliedMessageAddedByEventRecordNumber,
    required this.text,
  });

  final int repliedMessageAddedByEventRecordNumber;
  final String text;
}

class CreatePhotoMessageEvent extends CreateMessageEvent {
  CreatePhotoMessageEvent({
    required super.id,
    required super.owner,
    required super.createdAt,
    required this.urls,
  });

  final List<String> urls;
}

class CreateVideoMessageEvent extends CreateMessageEvent {
  CreateVideoMessageEvent({
    required super.id,
    required super.owner,
    required super.createdAt,
    required this.url,
  });

  final String url;
}

class CreateFileMessageEvent extends CreateMessageEvent {
  CreateFileMessageEvent({
    required super.id,
    required super.owner,
    required super.createdAt,
    required this.url,
  });

  final String url;
}

class CreateMiniAppMessageEvent extends CreateMessageEvent {
  CreateMiniAppMessageEvent({
    required super.id,
    required super.owner,
    required super.createdAt,
  });
}

class UpdateTextMessageEvent extends UpdateMessageEvent {
  UpdateTextMessageEvent({
    required super.id,
    required super.owner,
    required super.createdAt,
    required super.updatedMessageRecordNumber,
    this.text,
  });

  final String? text;
}

class DeleteMessageEvent extends MessageEvent {
  DeleteMessageEvent({
    required super.id,
    required super.owner,
    required super.createdAt,
    required this.deletedMessageRecordNumber,
  });

  final int deletedMessageRecordNumber;
}
