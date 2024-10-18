import 'dart:async';
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:dfunc/dfunc.dart';
import 'package:poc_chat_2/extensions/extended_nullable.dart';
import 'package:poc_chat_2/mock_data.dart';
import 'package:poc_chat_2/models/forms/message/activity_log_message_form.dart';
import 'package:poc_chat_2/models/forms/message/member_message_form.dart';
import 'package:poc_chat_2/models/forms/message/message_form.dart';
import 'package:poc_chat_2/models/message_content.dart';
import 'package:poc_chat_2/models/messages/message_type.dart';
import 'package:poc_chat_2/models/rue_jai_user.dart';
import 'package:poc_chat_2/providers/isar_storage/entities/isar_chat_room_entity.dart';
import 'package:poc_chat_2/providers/isar_storage/entities/isar_chat_room_member_entity.dart';
import 'package:poc_chat_2/providers/isar_storage/entities/isar_confirmed_message_entity.dart';
import 'package:poc_chat_2/providers/isar_storage/entities/isar_failed_message_entity.dart';
import 'package:poc_chat_2/providers/isar_storage/entities/isar_rue_jai_user_entity.dart';
import 'package:poc_chat_2/providers/isar_storage/entities/isar_sending_message_entity.dart';
import 'package:poc_chat_2/providers/isar_storage/entities/isar_unconfirmed_message_entity.dart';
import 'package:isar/isar.dart';
import 'package:poc_chat_2/providers/isar_storage/requests/isar_update_chat_room_profile_request.dart';
import 'package:poc_chat_2/providers/isar_storage/requests/isar_update_confirmed_text_message_request.dart';

class IsarChatService {
  IsarChatService(this.isar);

  final Future<Isar> isar;

  Future<RueJaiUser> findRueJaiUser() async {
    return MockData.currentRueJaiUser;
  }

  Future<void> removeChatRoom({required String chatRoomId}) async {
    return isar.then(
      (isar) async {
        final room = await getChatRoom(chatRoomId: chatRoomId);

        if (room == null) throw Exception('Room not found.');

        await isar.writeTxn(() async {
          room.deletedAt = DateTime.now();

          await isar.isarChatRoomEntitys.put(room);
        });
      },
    );
  }

  Future<List<IsarChatRoomEntity>> getChatRooms() async {
    return isar.then(
      (isar) async => isar.isarChatRoomEntitys.where().findAll(),
    );
  }

  Future<IsarChatRoomEntity?> getChatRoom({
    required String chatRoomId,
  }) async {
    return isar.then(
      (isar) async {
        return isar.isarChatRoomEntitys
            .filter()
            .roomIdEqualTo(chatRoomId)
            .findFirst();
      },
    );
  }

  Future<List<IsarChatRoomMemberEntity>> getMembers({
    required String chatRoomId,
  }) {
    return isar.then(
      (isar) async {
        return isar.isarChatRoomMemberEntitys
            .filter()
            .room((query) => query.roomIdEqualTo(chatRoomId))
            .findAll();
      },
    );
  }

  Future<IsarChatRoomMemberEntity?> getMemberByRueJaiUser({
    required String chatRoomId,
    required String rueJaiUserId,
  }) async {
    return isar.then(
      (isar) async {
        return isar.isarChatRoomMemberEntitys
            .filter()
            .room((query) => query.roomIdEqualTo(chatRoomId))
            .and()
            .rueJaiUser((query) => query.rueJaiUserIdEqualTo(rueJaiUserId))
            .findFirst();
      },
    );
  }

  Future<void> updateChatRoomProfile(IsarUpdateChatRoomProfileRequest request) {
    return isar.then((isar) async {
      final room = await getChatRoom(chatRoomId: request.roomId);

      if (room == null) throw Exception('Room not found.');

      final existingMembers = await room.members.filter().findAll();
      final removeMembers = existingMembers
          .where((member) =>
              !request.members.map((e) => e.id).contains(member.memberId))
          .toList();
      final removeMemberIds = removeMembers.map((member) => member.id).toList();
      final members = await Future.wait(request.members.map((member) async {
        final existingMember = existingMembers.firstWhereOrNull(
          (existingMember) => existingMember.memberId == member.id,
        );
        final rueJaiUser = await _updateRueJaiUserIfExists(
          rueJaiUser: member.rueJaiUser,
        );

        if (existingMember != null) {
          return existingMember
            ..role = member.role
            ..lastReadMessageRecordNumber = member.lastReadMessageRecordNumber
            ..rueJaiUser.value = rueJaiUser
            ..room.value = room;
        } else {
          return IsarChatRoomMemberEntity()
            ..memberId = member.id
            ..role = member.role
            ..lastReadMessageRecordNumber = member.lastReadMessageRecordNumber
            ..rueJaiUser.value = rueJaiUser
            ..room.value = room;
        }
      }));

      await isar.writeTxn(() async {
        await isar.isarChatRoomMemberEntitys.deleteAll(removeMemberIds);
        await isar.isarChatRoomMemberEntitys.putAll(members);
        await Future.wait(
          members.expand(
            (member) => [
              member.room.save(),
              member.rueJaiUser.save(),
            ],
          ),
        );

        room.name = request.name;
        room.thumbnailUrl = request.thumbnailUrl;
        room.profileHash = request.profileHash;

        room.members.addAll(members);
        room.members.removeAll(removeMembers);

        await room.members.save();
        await isar.isarChatRoomEntitys.put(room);
      });
    });
  }

  Future<IsarChatRoomEntity> addChatRoom({required String chatRoomId}) async {
    return isar.then((isar) async {
      final room = IsarChatRoomEntity()
        ..roomId = chatRoomId
        ..name = ''
        ..lastSyncedRoomAndMessageEventRecordNumber = 0
        ..profileHash = '';

      await isar.writeTxn(() async {
        await isar.isarChatRoomEntitys.put(room);
      });

      return room;
    });
  }

  Future<IsarRueJaiUserEntity> _updateRueJaiUserIfExists({
    required RueJaiUser rueJaiUser,
  }) {
    return isar.then((isar) async {
      final rueJaiUserEntity = await isar.isarRueJaiUserEntitys
          .filter()
          .rueJaiUserIdEqualTo(rueJaiUser.rueJaiUserId)
          .findFirst();

      if (rueJaiUserEntity == null) {
        final newRueJaiUserEntity = IsarRueJaiUserEntity()
          ..rueJaiUserId = rueJaiUser.rueJaiUserId
          ..name = rueJaiUser.name
          ..thumbnailUrl = rueJaiUser.thumbnailUrl
          ..type = rueJaiUser.rueJaiUserType
          ..role = rueJaiUser.rueJaiUserRole;

        await isar.writeTxn(() async {
          await isar.isarRueJaiUserEntitys.put(newRueJaiUserEntity);
        });

        return newRueJaiUserEntity;
      } else {
        final newRueJaiUserEntity = rueJaiUserEntity
          ..name = rueJaiUser.name
          ..thumbnailUrl = rueJaiUser.thumbnailUrl
          ..role = rueJaiUser.rueJaiUserRole;

        await isar.writeTxn(() async {
          await isar.isarRueJaiUserEntitys.put(newRueJaiUserEntity);
        });

        return newRueJaiUserEntity;
      }
    });
  }

  Future<int?> getChatRoomLastSyncedRoomAndMessageEventRecordNumber({
    required String chatRoomId,
  }) async {
    return isar.then((isar) {
      return isar.isarChatRoomEntitys
          .getByRoomId(chatRoomId)
          .then((room) => room?.lastSyncedRoomAndMessageEventRecordNumber);
    });
  }

  Future<IsarSendingMessageEntity> createSendingMessage({
    required String targetChatRoomId,
    required MessageForm form,
  }) async {
    return isar.then((isar) async {
      final room = await getChatRoom(chatRoomId: targetChatRoomId);

      if (room == null) throw Exception('Room not found');

      final member = await getMemberByRueJaiUser(
        chatRoomId: targetChatRoomId,
        rueJaiUserId: form.owner.rueJaiUser.rueJaiUserId,
      );

      if (member == null) throw Exception('Member not found');

      final message = IsarSendingMessageEntity()
        ..createdAt = form.createdAt
        ..updatedAt = form.createdAt
        ..createdByEventId = form.createdByEventId
        ..type = _getMessageType(form)
        ..content = _getContent(form)
        ..owner.value = member.getOrThrow(errorMessage: 'Member not found')
        ..room.value = room.getOrThrow(errorMessage: 'Room not found');

      await isar.writeTxn(() async {
        await isar.isarSendingMessageEntitys.put(message);

        await message.owner.save();
        await message.room.save();
      });

      return message;
    });
  }

  Future<List<int>> findTimeoutSendingMessageIds({
    required Duration timeout,
  }) {
    return isar.then((isar) async {
      final messages = await isar.isarSendingMessageEntitys
          .filter()
          .createdAtLessThan(DateTime.now().subtract(timeout))
          .findAll();

      return messages.map((message) => message.id).toList();
    });
  }

  Future<void> updateSendingMessagesToFailedMessages({
    required List<int> messageIds,
  }) async {
    return isar.then((isar) async {
      final sendingMessageEntitys =
          await isar.isarSendingMessageEntitys.where().findAll();

      final failedMessageEntitys = sendingMessageEntitys
          .where((message) => messageIds.contains(message.id))
          .map(
            (sendingMessageEntity) => IsarFailedMessageEntity()
              ..createdAt = sendingMessageEntity.createdAt
              ..updatedAt = sendingMessageEntity.createdAt
              ..createdByEventId = sendingMessageEntity.createdByEventId
              ..type = sendingMessageEntity.type
              ..content = sendingMessageEntity.content
              ..owner.value = sendingMessageEntity.owner.value
              ..room.value = sendingMessageEntity.room.value,
          )
          .toList();

      await isar.writeTxn(() async {
        await isar.isarSendingMessageEntitys.deleteAll(messageIds);
        await isar.isarFailedMessageEntitys.putAll(failedMessageEntitys);

        failedMessageEntitys.forEach((failedMessageEntity) async {
          await Future.wait([
            failedMessageEntity.room.save(),
            failedMessageEntity.owner.save()
          ]);
        });
      });
    });
  }

  Future<int> getLastSyncedMessageEventRecordNumber({
    required String targetChatRoomId,
  }) async {
    return isar.then((isar) async {
      final room = await getChatRoom(chatRoomId: targetChatRoomId);

      return room
          .getOrThrow(errorMessage: 'Room not found.')
          .lastSyncedRoomAndMessageEventRecordNumber;
    });
  }

  Future<IsarConfirmedMessageEntity> createConfirmedMessage({
    required String targetChatRoomId,
    required MessageForm form,
  }) async {
    return isar.then((isar) async {
      final room = await getChatRoom(chatRoomId: targetChatRoomId);

      if (room == null) throw Exception('Room not found.');

      final member = await getMemberByRueJaiUser(
        chatRoomId: targetChatRoomId,
        rueJaiUserId: form.owner.rueJaiUser.rueJaiUserId,
      );

      if (member == null) throw Exception('Member not found.');

      final message = IsarConfirmedMessageEntity()
        ..createdAt = form.createdAt
        ..updatedAt = form.createdAt
        ..createdByEventId = form.createdByEventId
        ..createdByRecordNumber = form.createdByEventRecordNumber
        ..type = _getMessageType(form)
        ..content = _getContent(form)
        ..owner.value = member
        ..room.value = room;

      room.lastSyncedRoomAndMessageEventRecordNumber =
          form.createdByEventRecordNumber ??
              room.lastSyncedRoomAndMessageEventRecordNumber;

      await isar.writeTxn(() async {
        await isar.isarChatRoomEntitys.put(room);
        await isar.isarConfirmedMessageEntitys.put(message);

        await message.owner.save();
        await message.room.save();
      });

      return message;
    });
  }

  Future<int> deleteConfirmedMessage({
    required String targetCreatedByEventId,
    required String targetChatRoomId,
    required int eventRecordNumber,
  }) async {
    return isar.then(
      (isar) async {
        final room = await getChatRoom(chatRoomId: targetChatRoomId);
        final message = await isar.isarConfirmedMessageEntitys
            .filter()
            .createdByEventIdEqualTo(targetCreatedByEventId)
            .findFirst();

        if (room == null) throw Exception('Room not found.');
        if (message == null) throw Exception('Message not found');

        room.lastSyncedRoomAndMessageEventRecordNumber = eventRecordNumber;

        await isar.writeTxn(() async {
          await isar.isarConfirmedMessageEntitys.delete(message.id);
          await isar.isarChatRoomEntitys.put(room);
        });

        return message.id;
      },
    );
  }

  Future<int> deleteTemporaryMessage({
    required String targetCreatedByEventId,
  }) async {
    return isar.then(
      (isar) async {
        final message = await isar.isarUnconfirmedMessageEntitys
                .filter()
                .createdByEventIdEqualTo(targetCreatedByEventId)
                .findFirst() ??
            await isar.isarSendingMessageEntitys
                .filter()
                .createdByEventIdEqualTo(targetCreatedByEventId)
                .findFirst() ??
            await isar.isarFailedMessageEntitys
                .filter()
                .createdByEventIdEqualTo(targetCreatedByEventId)
                .findFirst();

        switch (message) {
          case IsarUnconfirmedMessageEntity():
            await isar.writeTxn(() async {
              await isar.isarUnconfirmedMessageEntitys.delete(message.id);
            });

            return message.id;
          case IsarSendingMessageEntity():
            await isar.writeTxn(() async {
              await isar.isarSendingMessageEntitys.delete(message.id);
            });

            return message.id;
          case IsarFailedMessageEntity():
            await isar.writeTxn(() async {
              await isar.isarFailedMessageEntitys.delete(message.id);
            });

            return message.id;
          default:
            throw Exception('Message not found');
        }
      },
    );
  }

  Future<IsarUnconfirmedMessageEntity> createUnconfirmedMessage({
    required String targetChatRoomId,
    required MessageForm form,
  }) async {
    return isar.then((isar) async {
      final room = await getChatRoom(chatRoomId: targetChatRoomId);

      if (room == null) throw Exception('Room not found');

      final member = await getMemberByRueJaiUser(
        chatRoomId: targetChatRoomId,
        rueJaiUserId: form.owner.rueJaiUser.rueJaiUserId,
      );

      if (member == null) throw Exception('Member not found');

      final message = IsarUnconfirmedMessageEntity()
        ..createdAt = form.createdAt
        ..updatedAt = form.createdAt
        ..createdByEventId = form.createdByEventId
        ..createdByRecordNumber = form.createdByEventRecordNumber
        ..type = _getMessageType(form)
        ..content = _getContent(form)
        ..owner.value = member.getOrThrow(errorMessage: 'Member not found')
        ..room.value = room.getOrThrow(errorMessage: 'Room not found');

      await isar.writeTxn(() async {
        await isar.isarUnconfirmedMessageEntitys.put(message);

        await message.owner.save();
        await message.room.save();
      });

      return message;
    });
  }

  Future<IsarSendingMessageEntity> resendMessage({
    required int messageId,
  }) async {
    return isar.then((isar) async {
      final failedMessage = await isar.isarFailedMessageEntitys.get(messageId);

      if (failedMessage == null) throw Exception('Message not found');

      return IsarSendingMessageEntity()
        ..createdAt = failedMessage.createdAt
        ..updatedAt = failedMessage.createdAt
        ..createdByEventId = failedMessage.createdByEventId
        ..type = failedMessage.type
        ..content = failedMessage.content
        ..owner.value = failedMessage.owner.value
        ..room.value = failedMessage.room.value;
    });
  }

  Future<IsarConfirmedMessageEntity> updateConfirmedTextMessage(
    IsarUpdateConfirmedTextMessageRequest request,
  ) async {
    return isar.then((isar) async {
      final room = await getChatRoom(
        chatRoomId: request.targetMessageChatRoomId,
      );
      final confirmedMessage = await isar.isarConfirmedMessageEntitys
          .filter()
          .room((query) => query.roomIdEqualTo(request.targetMessageChatRoomId))
          .and()
          .createdByRecordNumberEqualTo(
            request.targetMessageCreatedByRecordNumber,
          )
          .findFirst();

      if (room == null) throw Exception('Room not found');
      if (confirmedMessage == null) throw Exception('Message not found');

      room.lastSyncedRoomAndMessageEventRecordNumber =
          request.newLastUpdatedByRecordNumber;

      confirmedMessage
        ..updatedAt = request.newUpdatedAt
        ..lastUpdatedByRecordNumber = request.newLastUpdatedByRecordNumber
        ..content = utf8.encode(
          json.encode(
            TextMessageContent(text: request.newText).toJson(),
          ),
        );

      await isar.writeTxn(() async {
        await isar.isarConfirmedMessageEntitys.put(confirmedMessage);
        await isar.isarChatRoomEntitys.put(room);
      });

      return confirmedMessage;
    });
  }

  MessageType _getMessageType(MessageForm form) {
    switch (form) {
      case TextMessageForm():
        return MessageType.memberText;
      case TextReplyMessageForm():
        return MessageType.memberTextReply;
      case PhotoMessageForm():
        return MessageType.memberPhoto;
      case VideoMessageForm():
        return MessageType.memberVideo;
      case FileMessageForm():
        return MessageType.memberFile;
      case MiniAppMessageForm():
        return MessageType.memberMiniApp;
      case ActivityLogCreateRoomMessageForm():
        return MessageType.activityLogCreateRoom;
      case ActivityLogUpdateRoomMessageForm():
        return MessageType.activityLogUpdateRoom;
      case ActivityLogInviteMemberMessageForm():
        return MessageType.activityLogInviteMember;
      case ActivityLogUpdateMemberRoleMessageForm():
        return MessageType.activityLogUpdateMemberRole;
      case ActivityLogUninviteMemberMessageForm():
        return MessageType.activityLogUninviteMember;
      default:
        throw Exception('Unsupported form ${form.runtimeType}');
    }
  }

  List<int>? _getContent(MessageForm form) {
    Map<String, dynamic>? content;

    switch (form) {
      case TextMessageForm():
        content = TextMessageContent(text: form.text).toJson();
      case PhotoMessageForm():
        content = PhotoMessageContent(urls: form.urls).toJson();
      case VideoMessageForm():
        content = VideoMessageContent(url: form.url).toJson();
      case FileMessageForm():
        content = FileMessageContent(url: form.url).toJson();
      case ActivityLogInviteMemberMessageForm():
        content =
            InviteMemberMessageContent.fromModel(form.invitedMember).toJson();
      case ActivityLogUpdateMemberRoleMessageForm():
        content = {
          'updated_member': form.updatedMember,
          'new_role': form.newRole,
        };
      case ActivityLogUninviteMemberMessageForm():
        content = {
          'uninvited_member': form.uninvitedMember,
        };
    }

    return content?.let((content) => utf8.encode(json.encode(content)));
  }
}
