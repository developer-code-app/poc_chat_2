part of 'message.dart';

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
