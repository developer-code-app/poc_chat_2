import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:poc_chat_2/mock_data.dart';
import 'package:poc_chat_2/models/forms/message/member_message_form.dart';
import 'package:poc_chat_2/models/forms/message/message_form.dart';
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
import 'package:poc_chat_2/providers/isar_storage/requests/isar_add_chat_room_request.dart';
import 'package:poc_chat_2/providers/isar_storage/requests/isar_update_chat_room_profile_request.dart';

class IsarChatService {
  IsarChatService(this.isar);

  final Future<Isar> isar;

  Future<RueJaiUser> findRueJaiUser() async {
    return MockData.currentRueJaiUser;
  }

  Future<void> removeChatRoom({required String chatRoomId}) async {
    return isar.then(
      (isar) async {
        final room = await isar.isarChatRoomEntitys
            .filter()
            .roomIdEqualTo(chatRoomId)
            .findFirst();

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
      (isar) async {
        final rueJaiUser = await findRueJaiUser();

        return isar.isarChatRoomEntitys
            .filter()
            .members(
              (query) => query.rueJaiUser(
                (query) => query.rueJaiUserIdEqualTo(rueJaiUser.rueJaiUserId),
              ),
            )
            .findAll();
      },
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

  Future<void> updateChatRoomProfile(IsarUpdateChatRoomProfileRequest request) {
    return isar.then((isar) async {
      final room = await isar.isarChatRoomEntitys
          .filter()
          .roomIdEqualTo(request.roomId)
          .findFirst();

      if (room == null) throw Exception('Room not found.');

      await isar.writeTxn(() async {
        room.name = request.name;
        room.thumbnailUrl = request.thumbnailUrl;
        room.profileHash = request.profileHash;

        await isar.isarChatRoomEntitys.put(room);
      });
    });
  }

  Future<IsarChatRoomEntity> addChatRoom(IsarAddChatRoomRequest request) async {
    return isar.then((isar) async {
      final rueJaiUserEntity = await _createRueJaiUserIfExists();

      final room = IsarChatRoomEntity()
        ..roomId = request.chatRoomId
        ..name = request.name
        ..thumbnailUrl = request.thumbnailUrl
        ..lastSyncedRoomAndMessageEventRecordNumber = 0
        ..profileHash = request.profileHash;
      final members = request.members
          .map(
            (member) => IsarChatRoomMemberEntity()
              ..lastReadMessageRecordNumber = member.lastReadMessageId
              ..role = member.role
              ..rueJaiUser.value = rueJaiUserEntity,
          )
          .toList();

      await isar.writeTxn(() async {
        await isar.isarChatRoomMemberEntitys.putAll(members);

        members.forEach((member) async => await member.rueJaiUser.save());

        await isar.isarChatRoomEntitys.put(room);

        room.members.addAll(members);

        await room.members.save();
      });

      return room;
    });
  }

  Future<IsarRueJaiUserEntity> _createRueJaiUserIfExists() {
    return isar.then((isar) async {
      final currentRueJaiUser = await findRueJaiUser();
      final rueJaiUserEntity = await isar.isarRueJaiUserEntitys
          .filter()
          .rueJaiUserIdEqualTo(currentRueJaiUser.rueJaiUserId)
          .findFirst();

      if (rueJaiUserEntity == null) {
        final newRueJaiUserEntity = IsarRueJaiUserEntity()
          ..rueJaiUserId = currentRueJaiUser.rueJaiUserId
          ..name = currentRueJaiUser.name
          ..thumbnailUrl = currentRueJaiUser.thumbnailUrl
          ..type = RueJaiUserType.rueJaiAppUser
          ..role = RueJaiUserRole.homeOwner;

        await isar.writeTxn(
          () => isar.isarRueJaiUserEntitys.put(newRueJaiUserEntity),
        );

        return newRueJaiUserEntity;
      } else {
        return rueJaiUserEntity;
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
      final rueJaiUser = await findRueJaiUser();
      final room = await isar.isarChatRoomEntitys
          .filter()
          .roomIdEqualTo(targetChatRoomId)
          .findFirst();

      if (room == null) throw Exception('Room not found.');

      final member = await isar.isarChatRoomMemberEntitys
          .filter()
          .rueJaiUser(
            (query) => query.rueJaiUserIdEqualTo(
              rueJaiUser.rueJaiUserId.toString(),
            ),
          )
          .and()
          .oneOf(room.members, (query, member) => query.idEqualTo(member.id))
          .findFirst();

      final message = IsarSendingMessageEntity()
        ..createdAt = form.createdAt
        ..updatedAt = form.createdAt
        ..createdByEventId = form.createdByEventId
        ..owner.value = member
        ..room.value = room;

      switch (form) {
        case TextMessageForm():
          message
            ..type = MessageType.text
            ..content = utf8.encode(form.text);
        default:
          break;
      }

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

  Future<IsarConfirmedMessageEntity> createConfirmedMessage() async {
    return isar.then((isar) async => IsarConfirmedMessageEntity());
  }

  Future<IsarUnconfirmedMessageEntity> createUnconfirmedMessage() async {
    return isar.then((isar) async => IsarUnconfirmedMessageEntity());
  }

  Future<IsarFailedMessageEntity> createFailedMessage() async {
    return isar.then((isar) async => IsarFailedMessageEntity());
  }
}
