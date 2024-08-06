import 'package:dfunc/dfunc.dart';

import 'package:poc_chat_2/models/chat_room.dart';
import 'package:poc_chat_2/models/message.dart';

class ChatsPagePresenter {
  ChatsPagePresenter({required this.chatRooms});

  factory ChatsPagePresenter.fromModel(
      List<(ChatRoom, int)> chatRoomWithUnreadMessageCounts) {
    return ChatsPagePresenter(
      chatRooms: chatRoomWithUnreadMessageCounts
          .map(ChatRoomPresenter.fromModel)
          .toList(),
    );
  }

  final List<ChatRoomPresenter> chatRooms;
}

class ChatRoomPresenter {
  ChatRoomPresenter({
    required this.id,
    required this.name,
    required this.thumbnailUrl,
    required this.latestMessage,
    required this.unreadMessageCount,
  });

  factory ChatRoomPresenter.fromModel(
    (ChatRoom, int) chatRoomWithUnreadMessageCount,
  ) {
    final chatRoom = chatRoomWithUnreadMessageCount.$1;
    final unreadMessageCount = chatRoomWithUnreadMessageCount.$2;

    return ChatRoomPresenter(
      id: chatRoom.id,
      name: chatRoom.name,
      thumbnailUrl: chatRoom.thumbnailUrl,
      latestMessage: chatRoom.confirmedMessages.lastOrNull?.let(
        (message) => MessagePresenter.fromModel(message),
      ),
      unreadMessageCount: unreadMessageCount,
    );
  }

  final int id;
  final String name;
  final String thumbnailUrl;
  final MessagePresenter? latestMessage;
  final int unreadMessageCount;
}

class MessagePresenter {
  MessagePresenter({
    required this.text,
    required this.createdAt,
  });

  factory MessagePresenter.fromModel(Message message) {
    switch (message) {
      case TextMessage():
        return MessagePresenter(
          text: message.text ?? getDefaultMessageText(message),
          createdAt: message.createdAt,
        );
      case TextReplyMessage():
        return MessagePresenter(
          text: message.text ?? getDefaultMessageText(message),
          createdAt: message.createdAt,
        );
      case PhotoMessage():
        return MessagePresenter(
          text: getDefaultMessageText(message),
          createdAt: message.createdAt,
        );
      case VideoMessage():
        return MessagePresenter(
          text: getDefaultMessageText(message),
          createdAt: message.createdAt,
        );
      case FileMessage():
        return MessagePresenter(
          text: getDefaultMessageText(message),
          createdAt: message.createdAt,
        );
      case MiniAppMessage():
        return MessagePresenter(
          text: getDefaultMessageText(message),
          createdAt: message.createdAt,
        );
    }
  }

  static getDefaultMessageText(Message message) {
    final messageOwnerName = message.owner.name;

    switch (message) {
      case TextMessage():
        return "$messageOwnerName sent a text message";
      case TextReplyMessage():
        return "$messageOwnerName sent a text message";
      case PhotoMessage():
        return "$messageOwnerName sent a photo";
      case VideoMessage():
        return "$messageOwnerName sent a video";
      case FileMessage():
        return "$messageOwnerName sent a file";
      case MiniAppMessage():
        return "$messageOwnerName sent a mini app";
    }
  }

  final String text;
  final DateTime createdAt;
}
