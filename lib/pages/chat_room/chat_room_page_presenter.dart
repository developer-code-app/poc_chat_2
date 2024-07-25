import 'package:poc_chat_2/models/chat_room.dart';
import 'package:poc_chat_2/models/chat_room_member.dart';
import 'package:poc_chat_2/models/message.dart';
import 'package:poc_chat_2/models/rue_jai_user.dart';

class ChatRoomPagePresenter {
  ChatRoomPagePresenter({
    required this.name,
    required this.confirmedMessages,
    required this.failedMessages,
    required this.sendingMessages,
  });

  factory ChatRoomPagePresenter.fromModel(ChatRoom chatRoom) {
    return ChatRoomPagePresenter(
      name: chatRoom.name,
      confirmedMessages:
          chatRoom.confirmedMessages.map(MessagePresenter.fromModel).toList(),
      failedMessages:
          chatRoom.failedMessages.map(MessagePresenter.fromModel).toList(),
      sendingMessages:
          chatRoom.sendingMessages.map(MessagePresenter.fromModel).toList(),
    );
  }

  final String name;
  final List<MessagePresenter> confirmedMessages;
  final List<MessagePresenter> failedMessages;
  final List<MessagePresenter> sendingMessages;
}

class MemberPresenter {
  MemberPresenter({
    required this.name,
    required this.thumbnail,
    required this.userRole,
  });

  factory MemberPresenter.fromModel(ChatRoomMember owner) {
    return MemberPresenter(
      name: owner.rueJaiUser.name,
      thumbnail: owner.rueJaiUser.thumbnailUrl,
      userRole: _getUserRoleValue(owner.rueJaiUser.rueJaiUserRole),
    );
  }

  static String _getUserRoleValue(RueJaiUserRole userRole) {
    switch (userRole) {
      case RueJaiUserRole.homeOwner:
        return 'home owner';
      case RueJaiUserRole.resident:
        return 'resident';
      case RueJaiUserRole.renter:
        return 'renter';
      case RueJaiUserRole.customerService:
        return 'customer service';
    }
  }

  final String name;
  final String thumbnail;
  final String userRole;
}

sealed class MessagePresenter {
  MessagePresenter({
    required this.id,
    required this.owner,
    required this.createdAt,
  });

  factory MessagePresenter.fromModel(Message message) {
    switch (message) {
      case TextMessage():
        return TextMessagePresenter.fromModel(message);
      case TextReplyMessage():
        return TextReplyMessagePresenter.fromModel(message);
      case PhotoMessage():
        return PhotoMessagePresenter.fromModel(message);
      case VideoMessage():
        return VideoMessagePresenter.fromModel(message);
      case FileMessage():
        return FileMessagePresenter.fromModel(message);
      case MiniAppMessage():
        return MiniAppMessagePresenter.fromModel(message);
    }
  }

  final int id;
  final MemberPresenter owner;
  final DateTime createdAt;
}

class TextMessagePresenter extends MessagePresenter {
  TextMessagePresenter({
    required super.id,
    required super.owner,
    required super.createdAt,
    this.text,
  });

  factory TextMessagePresenter.fromModel(Message message) {
    if (message is! TextMessage) {
      throw ArgumentError('The message is not a text message');
    }

    return TextMessagePresenter(
      id: message.id,
      owner: MemberPresenter.fromModel(message.owner),
      createdAt: message.createdAt,
      text: message.text,
    );
  }

  final String? text;
}

class TextReplyMessagePresenter extends MessagePresenter {
  TextReplyMessagePresenter({
    required super.id,
    required super.owner,
    required super.createdAt,
    required this.repliedMessage,
    this.text,
  });

  factory TextReplyMessagePresenter.fromModel(Message message) {
    if (message is! TextReplyMessage) {
      throw ArgumentError('The message is not a text reply message');
    }

    return TextReplyMessagePresenter(
      id: message.id,
      owner: MemberPresenter.fromModel(message.owner),
      createdAt: message.createdAt,
      text: message.text,
      repliedMessage: MessagePresenter.fromModel(message.repliedMessage),
    );
  }

  final MessagePresenter repliedMessage;
  final String? text;
}

class PhotoMessagePresenter extends MessagePresenter {
  PhotoMessagePresenter({
    required super.id,
    required super.owner,
    required super.createdAt,
    required this.urls,
  });

  factory PhotoMessagePresenter.fromModel(Message message) {
    if (message is! PhotoMessage) {
      throw ArgumentError('The message is not a photo message');
    }
    return PhotoMessagePresenter(
      id: message.id,
      owner: MemberPresenter.fromModel(message.owner),
      createdAt: message.createdAt,
      urls: message.urls,
    );
  }

  final List<String> urls;
}

class VideoMessagePresenter extends MessagePresenter {
  VideoMessagePresenter({
    required super.id,
    required super.owner,
    required super.createdAt,
    required this.url,
  });

  factory VideoMessagePresenter.fromModel(Message message) {
    if (message is! VideoMessage) {
      throw ArgumentError('The message is not a video message');
    }

    return VideoMessagePresenter(
      id: message.id,
      owner: MemberPresenter.fromModel(message.owner),
      createdAt: message.createdAt,
      url: message.url,
    );
  }

  final String url;
}

class FileMessagePresenter extends MessagePresenter {
  FileMessagePresenter({
    required super.id,
    required super.owner,
    required super.createdAt,
    required this.url,
  });

  factory FileMessagePresenter.fromModel(Message message) {
    if (message is! FileMessage) {
      throw ArgumentError('The message is not a file message');
    }

    return FileMessagePresenter(
      id: message.id,
      owner: MemberPresenter.fromModel(message.owner),
      createdAt: message.createdAt,
      url: message.url,
    );
  }

  final String url;
}

class MiniAppMessagePresenter extends MessagePresenter {
  MiniAppMessagePresenter({
    required super.id,
    required super.owner,
    required super.createdAt,
  });

  factory MiniAppMessagePresenter.fromModel(Message message) {
    if (message is! MiniAppMessage) {
      throw ArgumentError('The message is not a mini app message');
    }

    return MiniAppMessagePresenter(
      id: message.id,
      owner: MemberPresenter.fromModel(message.owner),
      createdAt: message.createdAt,
    );
  }
}
