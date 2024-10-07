import 'package:poc_chat_2/models/chat_room.dart';
import 'package:poc_chat_2/models/chat_room_member.dart';
import 'package:poc_chat_2/models/messages/message.dart';
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
    required this.id,
    required this.name,
    required this.userRole,
    this.thumbnail,
  });

  factory MemberPresenter.fromModel(ChatRoomMember owner) {
    return MemberPresenter(
      id: owner.id,
      name: owner.rueJaiUser.name,
      thumbnail: owner.rueJaiUser.thumbnailUrl,
      userRole: getUserRoleValue(owner.rueJaiUser.rueJaiUserRole),
    );
  }

  static String getUserRoleValue(RueJaiUserRole userRole) {
    switch (userRole) {
      case RueJaiUserRole.homeOwner:
        return 'Home Owner';
      case RueJaiUserRole.resident:
        return 'Resident';
      case RueJaiUserRole.renter:
        return 'Renter';
      case RueJaiUserRole.customerService:
        return 'Customer Service';
    }
  }

  final String id;
  final String name;
  final String? thumbnail;
  final String userRole;
}

sealed class MessagePresenter {
  MessagePresenter({
    required this.id,
  });

  factory MessagePresenter.fromModel(Message message) {
    switch (message) {
      case MemberMessage():
        return MemberMessagePresenter.fromModel(message);
      case ActivityLogMessage():
        return ActivityLogMessagePresenter.fromModel(message);
    }
  }

  final int id;
}

sealed class MemberMessagePresenter extends MessagePresenter {
  MemberMessagePresenter({
    required super.id,
    required this.owner,
    required this.createdAt,
    this.deletedAt,
  });

  factory MemberMessagePresenter.fromModel(MemberMessage message) {
    switch (message) {
      case MemberTextMessage():
        return MemberTextMessagePresenter.fromModel(message);
      case MemberTextReplyMessage():
        return MemberTextReplyMessagePresenter.fromModel(message);
      case MemberPhotoMessage():
        return MemberPhotoMessagePresenter.fromModel(message);
      case MemberVideoMessage():
        return MemberVideoMessagePresenter.fromModel(message);
      case MemberFileMessage():
        return MemberFileMessagePresenter.fromModel(message);
      case MemberMiniAppMessage():
        return MemberMiniAppMessagePresenter.fromModel(message);
    }
  }

  final MemberPresenter owner;
  final DateTime createdAt;
  final DateTime? deletedAt;
}

class ActivityLogMessagePresenter extends MessagePresenter {
  ActivityLogMessagePresenter({
    required super.id,
    required this.log,
  });

  factory ActivityLogMessagePresenter.fromModel(ActivityLogMessage message) {
    switch (message) {
      case ActivityLogCreateRoomMessage():
        return ActivityLogMessagePresenter(
          id: message.id,
          log: '${message.owner.name} created the chat room',
        );
      case ActivityLogInviteMemberMessage():
        return ActivityLogMessagePresenter(
          id: message.id,
          log: '${message.owner.name} added ${message.member.name}',
        );
      case ActivityLogEditMemberRoleMessage():
        return ActivityLogMessagePresenter(
          id: message.id,
          log:
              '${message.owner.name} updated ${message.member.name} to ${message.newRole}',
        );
      case ActivityLogRemoveMemberMessage():
        return ActivityLogMessagePresenter(
          id: message.id,
          log: '${message.owner.name} removed ${message.member.name}',
        );
    }
  }

  final String log;
}

class MemberTextMessagePresenter extends MemberMessagePresenter {
  MemberTextMessagePresenter({
    required super.id,
    required super.owner,
    required super.createdAt,
    this.text,
    super.deletedAt,
  });

  factory MemberTextMessagePresenter.fromModel(MemberTextMessage message) {
    return MemberTextMessagePresenter(
      id: message.id,
      owner: MemberPresenter.fromModel(message.owner),
      createdAt: message.createdAt,
      deletedAt: message.deletedAt,
      text: message.text,
    );
  }

  final String? text;
}

class MemberTextReplyMessagePresenter extends MemberMessagePresenter {
  MemberTextReplyMessagePresenter({
    required super.id,
    required super.owner,
    required super.createdAt,
    required this.repliedMessage,
    super.deletedAt,
    this.text,
  });

  factory MemberTextReplyMessagePresenter.fromModel(
    MemberTextReplyMessage message,
  ) {
    return MemberTextReplyMessagePresenter(
      id: message.id,
      owner: MemberPresenter.fromModel(message.owner),
      createdAt: message.createdAt,
      deletedAt: message.deletedAt,
      text: message.text,
      repliedMessage: MemberMessagePresenter.fromModel(message.repliedMessage),
    );
  }

  final MemberMessagePresenter repliedMessage;
  final String? text;
}

class MemberPhotoMessagePresenter extends MemberMessagePresenter {
  MemberPhotoMessagePresenter({
    required super.id,
    required super.owner,
    required super.createdAt,
    this.urls,
    super.deletedAt,
  });

  factory MemberPhotoMessagePresenter.fromModel(MemberPhotoMessage message) {
    return MemberPhotoMessagePresenter(
      id: message.id,
      owner: MemberPresenter.fromModel(message.owner),
      createdAt: message.createdAt,
      deletedAt: message.deletedAt,
      urls: message.urls,
    );
  }

  final List<String>? urls;
}

class MemberVideoMessagePresenter extends MemberMessagePresenter {
  MemberVideoMessagePresenter({
    required super.id,
    required super.owner,
    required super.createdAt,
    this.url,
    super.deletedAt,
  });

  factory MemberVideoMessagePresenter.fromModel(MemberVideoMessage message) {
    return MemberVideoMessagePresenter(
      id: message.id,
      owner: MemberPresenter.fromModel(message.owner),
      createdAt: message.createdAt,
      deletedAt: message.deletedAt,
      url: message.url,
    );
  }

  final String? url;
}

class MemberFileMessagePresenter extends MemberMessagePresenter {
  MemberFileMessagePresenter({
    required super.id,
    required super.owner,
    required super.createdAt,
    this.url,
    super.deletedAt,
  });

  factory MemberFileMessagePresenter.fromModel(MemberFileMessage message) {
    return MemberFileMessagePresenter(
      id: message.id,
      owner: MemberPresenter.fromModel(message.owner),
      createdAt: message.createdAt,
      deletedAt: message.deletedAt,
      url: message.url,
    );
  }

  final String? url;
}

class MemberMiniAppMessagePresenter extends MemberMessagePresenter {
  MemberMiniAppMessagePresenter({
    required super.id,
    required super.owner,
    required super.createdAt,
    super.deletedAt,
  });

  factory MemberMiniAppMessagePresenter.fromModel(
    MemberMiniAppMessage message,
  ) {
    return MemberMiniAppMessagePresenter(
      id: message.id,
      owner: MemberPresenter.fromModel(message.owner),
      createdAt: message.createdAt,
      deletedAt: message.deletedAt,
    );
  }
}
