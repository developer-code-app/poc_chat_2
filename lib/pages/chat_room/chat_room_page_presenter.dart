import 'package:collection/collection.dart';
import 'package:dfunc/dfunc.dart';
import 'package:poc_chat_2/extensions/extended_date_time.dart';
import 'package:poc_chat_2/models/chat_room.dart';
import 'package:poc_chat_2/models/chat_room_member.dart';
import 'package:poc_chat_2/models/messages/message.dart';
import 'package:poc_chat_2/models/rue_jai_user.dart';
import 'package:poc_chat_2/widgets/list_view/presenter/list_view_child.dart';

class ChatRoomPagePresenter {
  ChatRoomPagePresenter({
    required this.name,
    required this.listViewChildren,
  });

  factory ChatRoomPagePresenter.fromModel(ChatRoom chatRoom) {
    final confirmedMessages =
        chatRoom.confirmedMessages.expandIndexed<ListViewChild>(
      (index, message) {
        final date = relativeDate(
          messages: chatRoom.confirmedMessages,
          currentMessageIndex: index,
        );

        return [
          if (date != null) Date(title: date),
          ConfirmedMessage.fromModel(
            message: message,
            shouldShowUserAvatar: _shouldShowUserAvatar(
              messages: chatRoom.confirmedMessages,
              currentMessageIndex: index,
            ),
          ),
        ];
      },
    );

    return ChatRoomPagePresenter(
      name: chatRoom.name,
      listViewChildren: [
        ...confirmedMessages.intersperse(ListViewSeparator(height: 8)),
        ListViewSeparator(height: 8),
        ...chatRoom.failedMessages
            .map<ListViewChild>(FailedMessage.fromModel)
            .intersperse(ListViewSeparator(height: 8)),
        ListViewSeparator(height: 8),
        ...chatRoom.sendingMessages
            .map<ListViewChild>(SendingMessage.fromModel)
            .intersperse(ListViewSeparator(height: 8)),
      ],
    );
  }

  static bool _shouldShowUserAvatar({
    required List<Message> messages,
    required int currentMessageIndex,
  }) {
    final currentMessage = messages.elementAtOrNull(currentMessageIndex);
    final previousMessage = currentMessageIndex > 0
        ? messages.elementAtOrNull(currentMessageIndex - 1)
        : null;

    if (previousMessage == null) return currentMessage is MemberMessage;

    if (currentMessage is! MemberMessage) return false;

    if (previousMessage is! MemberMessage) return true;

    return previousMessage.owner.id != currentMessage.owner.id;
  }

  static String? relativeDate({
    required List<Message> messages,
    required int currentMessageIndex,
  }) {
    final currentMessage = messages.elementAtOrNull(currentMessageIndex);

    if (currentMessage == null) return null;

    if (currentMessageIndex == 0) {
      return currentMessage.createdAt.toRelativeDate();
    } else {
      final previousMessage = messages.elementAtOrNull(currentMessageIndex - 1);

      if (previousMessage == null) return null;

      final shouldShowDate = _shouldShowDate(
        previousMessage: previousMessage,
        currentMessage: currentMessage,
      );

      return shouldShowDate ? currentMessage.createdAt.toRelativeDate() : null;
    }
  }

  static bool _shouldShowDate({
    required Message previousMessage,
    required Message currentMessage,
  }) {
    final currentCreatedAt = currentMessage.createdAt;
    final previousCreatedAt = previousMessage.createdAt;
    final currentDate = DateTime(
      currentCreatedAt.year,
      currentCreatedAt.month,
      currentCreatedAt.day,
    );
    final previousDate = DateTime(
      previousCreatedAt.year,
      previousCreatedAt.month,
      previousCreatedAt.day,
    );

    return !currentDate.isAtSameMomentAs(previousDate);
  }

  final String name;
  final List<ListViewChild> listViewChildren;
}

class ConfirmedMessage extends ListViewChild {
  ConfirmedMessage({
    required this.message,
    required this.shouldShowUserAvatar,
  });

  factory ConfirmedMessage.fromModel({
    required Message message,
    required bool shouldShowUserAvatar,
  }) {
    return ConfirmedMessage(
      message: MessagePresenter.fromModel(message),
      shouldShowUserAvatar: shouldShowUserAvatar,
    );
  }

  final MessagePresenter message;
  final bool shouldShowUserAvatar;
}

class FailedMessage extends ListViewChild {
  FailedMessage(this.message);

  factory FailedMessage.fromModel(Message message) {
    return FailedMessage(MessagePresenter.fromModel(message));
  }

  final MessagePresenter message;
}

class SendingMessage extends ListViewChild {
  SendingMessage(this.message);

  factory SendingMessage.fromModel(Message message) {
    return SendingMessage(MessagePresenter.fromModel(message));
  }

  final MessagePresenter message;
}

class Date extends ListViewChild {
  Date({required this.title});

  final String title;
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
    required this.createdAt,
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
  final DateTime createdAt;
}

sealed class MemberMessagePresenter extends MessagePresenter {
  MemberMessagePresenter({
    required super.id,
    required super.createdAt,
    required this.owner,
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
  final DateTime? deletedAt;
}

class ActivityLogMessagePresenter extends MessagePresenter {
  ActivityLogMessagePresenter({
    required super.id,
    required super.createdAt,
    required this.log,
  });

  factory ActivityLogMessagePresenter.fromModel(ActivityLogMessage message) {
    switch (message) {
      case ActivityLogCreateRoomMessage():
        return ActivityLogMessagePresenter(
          id: message.id,
          log: '${message.owner.name} created the chat room',
          createdAt: message.createdAt,
        );
      case ActivityLogInviteMemberMessage():
        return ActivityLogMessagePresenter(
          id: message.id,
          log: '${message.owner.name} added ${message.member.name}',
          createdAt: message.createdAt,
        );
      case ActivityLogEditMemberRoleMessage():
        return ActivityLogMessagePresenter(
          id: message.id,
          log:
              '${message.owner.name} updated ${message.member.name} to ${message.newRole}',
          createdAt: message.createdAt,
        );
      case ActivityLogRemoveMemberMessage():
        return ActivityLogMessagePresenter(
          id: message.id,
          log: '${message.owner.name} removed ${message.member.name}',
          createdAt: message.createdAt,
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
