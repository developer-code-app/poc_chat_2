import 'package:poc_chat_2/models/events/event.dart';
import 'package:poc_chat_2/providers/ruejai_chat/entities/rue_jai_chat_event_entity.dart';

abstract class MessageEvent extends Event {
  MessageEvent({
    required super.id,
    required super.owner,
    required super.createdAt,
  });
}

sealed class CreateMessageEvent extends MessageEvent {
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
    required this.updatedMessageCreatedByEventRecordNumber,
  });

  int updatedMessageCreatedByEventRecordNumber;
}

class CreateTextMessageEvent extends CreateMessageEvent {
  CreateTextMessageEvent({
    required super.id,
    required super.owner,
    required super.createdAt,
    required this.text,
  });

  factory CreateTextMessageEvent.fromEntity({
    required RueJaiChatCreateTextMessageEventEntity entity,
  }) {
    return CreateTextMessageEvent(
      id: entity.id,
      owner: Owner.fromEntity(entity: entity.owner),
      createdAt: entity.createdAt,
      text: entity.text,
    );
  }

  final String text;
}

class CreateTextReplyMessageEvent extends CreateMessageEvent {
  CreateTextReplyMessageEvent({
    required super.id,
    required super.owner,
    required super.createdAt,
    required this.repliedMessageCreatedByEventRecordNumber,
    required this.text,
  });

  factory CreateTextReplyMessageEvent.fromEntity({
    required RueJaiChatCreateTextReplyMessageEventEntity entity,
  }) {
    return CreateTextReplyMessageEvent(
      id: entity.id,
      owner: Owner.fromEntity(entity: entity.owner),
      createdAt: entity.createdAt,
      text: entity.text,
      repliedMessageCreatedByEventRecordNumber:
          entity.repliedMessageCreatedByEventRecordNumber,
    );
  }

  final int repliedMessageCreatedByEventRecordNumber;
  final String text;
}

class CreatePhotoMessageEvent extends CreateMessageEvent {
  CreatePhotoMessageEvent({
    required super.id,
    required super.owner,
    required super.createdAt,
    required this.urls,
  });

  factory CreatePhotoMessageEvent.fromEntity({
    required RueJaiChatCreatePhotoMessageEventEntity entity,
  }) {
    return CreatePhotoMessageEvent(
      id: entity.id,
      owner: Owner.fromEntity(entity: entity.owner),
      createdAt: entity.createdAt,
      urls: entity.urls,
    );
  }

  final List<String> urls;
}

class CreateVideoMessageEvent extends CreateMessageEvent {
  CreateVideoMessageEvent({
    required super.id,
    required super.owner,
    required super.createdAt,
    required this.url,
  });

  factory CreateVideoMessageEvent.fromEntity({
    required RueJaiChatCreateVideoMessageEventEntity entity,
  }) {
    return CreateVideoMessageEvent(
      id: entity.id,
      owner: Owner.fromEntity(entity: entity.owner),
      createdAt: entity.createdAt,
      url: entity.url,
    );
  }

  final String url;
}

class CreateFileMessageEvent extends CreateMessageEvent {
  CreateFileMessageEvent({
    required super.id,
    required super.owner,
    required super.createdAt,
    required this.url,
  });

  factory CreateFileMessageEvent.fromEntity({
    required RueJaiChatCreateFileMessageEventEntity entity,
  }) {
    return CreateFileMessageEvent(
      id: entity.id,
      owner: Owner.fromEntity(entity: entity.owner),
      createdAt: entity.createdAt,
      url: entity.url,
    );
  }

  final String url;
}

class CreateMiniAppMessageEvent extends CreateMessageEvent {
  CreateMiniAppMessageEvent({
    required super.id,
    required super.owner,
    required super.createdAt,
  });

  factory CreateMiniAppMessageEvent.fromEntity({
    required RueJaiChatCreateHomeCareMessageEventEntity entity,
  }) {
    return CreateMiniAppMessageEvent(
      id: entity.id,
      owner: Owner.fromEntity(entity: entity.owner),
      createdAt: entity.createdAt,
    );
  }
}

class UpdateTextMessageEvent extends UpdateMessageEvent {
  UpdateTextMessageEvent({
    required super.id,
    required super.owner,
    required super.createdAt,
    required super.updatedMessageCreatedByEventRecordNumber,
    required this.text,
  });

  factory UpdateTextMessageEvent.fromEntity({
    required RueJaiChatUpdateTextMessageEventEntity entity,
  }) {
    return UpdateTextMessageEvent(
      id: entity.id,
      owner: Owner.fromEntity(entity: entity.owner),
      createdAt: entity.createdAt,
      updatedMessageCreatedByEventRecordNumber:
          entity.updatedMessageCreatedByEventRecordNumber,
      text: entity.text,
    );
  }

  final String text;
}

class DeleteMessageEvent extends MessageEvent {
  DeleteMessageEvent({
    required super.id,
    required super.owner,
    required super.createdAt,
    required this.deletedMessageRecordNumber,
  });

  factory DeleteMessageEvent.fromEntity({
    required RueJaiChatDeleteMessageEventEntity entity,
  }) {
    return DeleteMessageEvent(
      id: entity.id,
      owner: Owner.fromEntity(entity: entity.owner),
      createdAt: entity.createdAt,
      deletedMessageRecordNumber:
          entity.deletedMessageCreatedByEventRecordNumber,
    );
  }

  final int deletedMessageRecordNumber;
}
