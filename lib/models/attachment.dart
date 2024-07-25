abstract class Attachment {
  Attachment({
    required this.id,
    required this.createdAt,
  });

  final int id;
  final DateTime createdAt;
}

abstract class MiniAppAttachment extends Attachment {
  MiniAppAttachment({
    required super.id,
    required super.createdAt,
  });
}

abstract class VisualMediaAttachment extends Attachment {
  VisualMediaAttachment({
    required super.id,
    required super.createdAt,
    required this.urls,
  });

  final String urls;
}

class ImageAttachment extends VisualMediaAttachment {
  ImageAttachment({
    required super.id,
    required super.createdAt,
    required super.urls,
  });
}

class VideoAttachment extends VisualMediaAttachment {
  VideoAttachment({
    required super.id,
    required super.createdAt,
    required super.urls,
  });
}

class FileAttachment extends Attachment {
  FileAttachment({
    required super.id,
    required super.createdAt,
    required this.url,
  });

  final String url;
}
