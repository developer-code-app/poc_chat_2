import 'package:poc_chat_2/models/events/event.dart';
import 'package:poc_chat_2/providers/ruejai_chat/entities/rue_jai_chat_event_entity.dart';

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
    this.text,
  });

  factory CreateTextMessageEvent.fromEntity({
    required RueJaiChatCreateTextMessageEventEntity entity,
  }) {
    return CreateTextMessageEvent(
      id: entity.id,
      owner: Owner.fromEntity(entity: entity.owner),
      createdAt: entity.createdAt,
    );
  }

  final String? text;
}

class CreateTextReplyMessageEvent extends CreateMessageEvent {
  CreateTextReplyMessageEvent({
    required super.id,
    required super.owner,
    required super.createdAt,
    required this.repliedMessageAddedByEventRecordNumber,
    this.text,
  });

  factory CreateTextReplyMessageEvent.fromEntity({
    required RueJaiChatCreateTextReplyMessageEventEntity entity,
  }) {
    return CreateTextReplyMessageEvent(
      id: entity.id,
      owner: Owner.fromEntity(entity: entity.owner),
      createdAt: entity.createdAt,
      repliedMessageAddedByEventRecordNumber:
          entity.repliedMessageAddedByEventRecordNumber,
    );
  }

  final int repliedMessageAddedByEventRecordNumber;
  final String? text;
}

class CreatePhotoMessageEvent extends CreateMessageEvent {
  CreatePhotoMessageEvent({
    required super.id,
    required super.owner,
    required super.createdAt,
    this.urls,
  });

  factory CreatePhotoMessageEvent.fromEntity({
    required RueJaiChatCreatePhotoMessageEventEntity entity,
  }) {
    return CreatePhotoMessageEvent(
      id: entity.id,
      owner: Owner.fromEntity(entity: entity.owner),
      createdAt: entity.createdAt,
    );
  }

  final List<String>? urls;
}

class CreateVideoMessageEvent extends CreateMessageEvent {
  CreateVideoMessageEvent({
    required super.id,
    required super.owner,
    required super.createdAt,
    this.url,
  });

  factory CreateVideoMessageEvent.fromEntity({
    required RueJaiChatCreateVideoMessageEventEntity entity,
  }) {
    return CreateVideoMessageEvent(
      id: entity.id,
      owner: Owner.fromEntity(entity: entity.owner),
      createdAt: entity.createdAt,
    );
  }

  final String? url;
}

class CreateFileMessageEvent extends CreateMessageEvent {
  CreateFileMessageEvent({
    required super.id,
    required super.owner,
    required super.createdAt,
    this.url,
  });

  factory CreateFileMessageEvent.fromEntity({
    required RueJaiChatCreateFileMessageEventEntity entity,
  }) {
    return CreateFileMessageEvent(
      id: entity.id,
      owner: Owner.fromEntity(entity: entity.owner),
      createdAt: entity.createdAt,
    );
  }

  final String? url;
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
    required super.updatedMessageRecordNumber,
    this.text,
  });

  factory UpdateTextMessageEvent.fromEntity({
    required RueJaiChatEditTextMessageEventEntity entity,
  }) {
    return UpdateTextMessageEvent(
      id: entity.id,
      owner: Owner.fromEntity(entity: entity.owner),
      createdAt: entity.createdAt,
      updatedMessageRecordNumber: entity.updatedMessageRecordNumber,
    );
  }

  final String? text;
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
      deletedMessageRecordNumber: entity.deletedMessageRecordNumber,
    );
  }

  final int deletedMessageRecordNumber;
}
