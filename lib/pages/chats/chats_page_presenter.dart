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
    required this.latestMessage,
    required this.unreadMessageCount,
    this.thumbnailUrl,
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
  final String? thumbnailUrl;
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
      case MemberTextMessage():
        return MessagePresenter(
          text: message.text ?? getDefaultMessageText(message),
          createdAt: message.createdAt,
        );
      case MemberTextReplyMessage():
        return MessagePresenter(
          text: message.text ?? getDefaultMessageText(message),
          createdAt: message.createdAt,
        );
      case MemberPhotoMessage():
        return MessagePresenter(
          text: getDefaultMessageText(message),
          createdAt: message.createdAt,
        );
      case MemberVideoMessage():
        return MessagePresenter(
          text: getDefaultMessageText(message),
          createdAt: message.createdAt,
        );
      case MemberFileMessage():
        return MessagePresenter(
          text: getDefaultMessageText(message),
          createdAt: message.createdAt,
        );
      case MemberMiniAppMessage():
        return MessagePresenter(
          text: getDefaultMessageText(message),
          createdAt: message.createdAt,
        );
      case ActivityLogInviteMemberMessage():
        return MessagePresenter(
          text: getDefaultMessageText(message),
          createdAt: message.createdAt,
        );
      case ActivityLogRemoveMemberMessage():
        return MessagePresenter(
          text: getDefaultMessageText(message),
          createdAt: message.createdAt,
        );
    }
  }

  static getDefaultMessageText(Message message) {
    final messageOwnerName = message.owner.name;

    switch (message) {
      case MemberTextMessage():
        return "$messageOwnerName sent a text message";
      case MemberTextReplyMessage():
        return "$messageOwnerName sent a text message";
      case MemberPhotoMessage():
        return "$messageOwnerName sent a photo";
      case MemberVideoMessage():
        return "$messageOwnerName sent a video";
      case MemberFileMessage():
        return "$messageOwnerName sent a file";
      case MemberMiniAppMessage():
        return "$messageOwnerName sent a mini app";
      case ActivityLogInviteMemberMessage():
        return "$messageOwnerName invite member";
      case ActivityLogRemoveMemberMessage():
        return "$messageOwnerName remove member";
    }
  }

  final String text;
  final DateTime createdAt;
}
