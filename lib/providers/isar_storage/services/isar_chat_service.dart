import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:poc_chat_2/extensions/extended_nullable.dart';
import 'package:poc_chat_2/mock_data.dart';
import 'package:poc_chat_2/models/chat_room_member.dart';
import 'package:poc_chat_2/models/forms/message_form.dart';
import 'package:poc_chat_2/models/message_type.dart';
import 'package:poc_chat_2/models/rue_jai_user.dart';
import 'package:poc_chat_2/preference_keys.dart';
import 'package:poc_chat_2/providers/isar_storage/entities/isar_chat_room_entity.dart';
import 'package:poc_chat_2/providers/isar_storage/entities/isar_chat_room_latest_event_record_info_entity.dart';
import 'package:poc_chat_2/providers/isar_storage/entities/isar_chat_room_member_entity.dart';
import 'package:poc_chat_2/providers/isar_storage/entities/isar_confirmed_message_entity.dart';
import 'package:poc_chat_2/providers/isar_storage/entities/isar_failed_message_entity.dart';
import 'package:poc_chat_2/providers/isar_storage/entities/isar_rue_jai_user_entity.dart';
import 'package:poc_chat_2/providers/isar_storage/entities/isar_sending_message_entity.dart';
import 'package:poc_chat_2/providers/isar_storage/entities/isar_unconfirmed_message_entity.dart';
import 'package:isar/isar.dart';
import 'package:poc_chat_2/providers/isar_storage/requests/isar_add_chat_room_request.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IsarChatService {
  IsarChatService(this.isar);

  final Future<Isar> isar;

  Future<RueJaiUser> findRueJaiUser() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString(AuthPreferenceKeys.accessToken);

    return MockData.rueJaiUser[accessToken]
        .getOrThrowException(Exception('Token Expired'));
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

  Future<void> addChatRoom(IsarAddChatRoomRequest request) async {
    return isar.then((isar) async {
      final rueJaiUserEntity = await _createRueJaiUserIfExists();
      final room = IsarChatRoomEntity()
        ..roomId = request.chatRoomId
        ..name = request.name
        ..thumbnail = request.thumbnailUrl;
      final member = IsarChatRoomMemberEntity()
        ..lastReadMessageId = 0
        ..role = ChatRoomMemberRole.member
        ..rueJaiUser.value = rueJaiUserEntity;

      isar.writeTxn(() async {
        await isar.isarChatRoomEntitys.put(room);
        await isar.isarChatRoomMemberEntitys.put(member);

        room.members.add(member);

        await member.rueJaiUser.save();
        await room.members.save();
      });
    });
  }

  Future<IsarRueJaiUserEntity> _createRueJaiUserIfExists() {
    return isar.then((isar) async {
      final currentRueJaiUser = await findRueJaiUser();
      final rueJaiUserEntity = isar.isarRueJaiUserEntitys
          .filter()
          .rueJaiUserIdEqualTo(currentRueJaiUser.rueJaiUserId)
          .findFirstSync();

      if (rueJaiUserEntity == null) {
        final newRueJaiUserEntity = IsarRueJaiUserEntity()
          ..rueJaiUserId = currentRueJaiUser.rueJaiUserId
          ..name = currentRueJaiUser.name
          ..thumbnailUrl = currentRueJaiUser.thumbnailUrl
          ..type = RueJaiUserType.rueJaiAppUser
          ..role = RueJaiUserRole.homeOwner;

        isar.writeTxn(() async {
          await isar.isarRueJaiUserEntitys.put(newRueJaiUserEntity);
        });

        return newRueJaiUserEntity;
      } else {
        return rueJaiUserEntity;
      }
    });
  }

  Future<IsarChatRoomLatestEventRecordInfo>
      getChatRoomLatestEventRecordInfo() async {
    return isar.then((isar) async {
      return const IsarChatRoomLatestEventRecordInfo(
        latestRoomAndMessageEventRecordNumber: 0,
      );
    });
  }

  Future<IsarSendingMessageEntity> createSendingMessage({
    required int targetChatRoomId,
    required MessageForm form,
  }) async {
    return isar.then((isar) async {
      final rueJaiUser = await findRueJaiUser();
      final room = await isar.isarChatRoomEntitys.get(targetChatRoomId);
      final member = room
          .getOrThrowException(Exception('Room not found.'))
          .members
          .firstWhereOrNull(
            (member) => member.rueJaiUser.value?.id == rueJaiUser.id,
          )
          .getOrThrowException(Exception('Member not found.'));
      final message = IsarSendingMessageEntity()
        ..createdAt = form.createdAt
        ..updatedAt = form.createdAt
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

      isar.writeTxn(() async {
        await isar.isarSendingMessageEntitys.put(message);

        await message.owner.save();
        await message.room.save();
      });

      return message;
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
