import 'dart:convert';

import 'package:poc_chat_2/models/forms/message_form.dart';
import 'package:poc_chat_2/models/message_type.dart';
import 'package:poc_chat_2/providers/isar_storage/entities/isar_chat_room_entity.dart';
import 'package:poc_chat_2/providers/isar_storage/entities/isar_confirmed_message_entity.dart';
import 'package:poc_chat_2/providers/isar_storage/entities/isar_failed_message_entity.dart';
import 'package:poc_chat_2/providers/isar_storage/entities/isar_sending_message_entity.dart';
import 'package:poc_chat_2/providers/isar_storage/entities/isar_unconfirmed_message_entity.dart';
import 'package:isar/isar.dart';

class IsarChatService {
  IsarChatService(this.isar);

  final Future<Isar> isar;

  Future<List<IsarChatRoomEntity>> getChatRooms() async {
    return isar.then(
      (isar) async => isar.isarChatRoomEntitys.where().findAll(),
    );
  }

  Future<IsarConfirmedMessageEntity> createConfirmedMessage() async {
    return isar.then((isar) async => IsarConfirmedMessageEntity());
  }

  Future<IsarUnconfirmedMessageEntity> createUnconfirmedMessage() async {
    return isar.then((isar) async => IsarUnconfirmedMessageEntity());
  }

  Future<IsarSendingMessageEntity> createSendingMessage({
    required int targetChatRoomId,
    required MessageForm form,
  }) async {
    return isar.then((isar) async {
      switch (form) {
        case TextMessageForm():
          return IsarSendingMessageEntity()
            ..createdAt = form.createdAt
            ..updatedAt = form.createdAt
            ..type = MessageType.text
            ..content = utf8.encode(form.text);
        default:
          return IsarSendingMessageEntity();
      }
    });
  }

  Future<IsarFailedMessageEntity> createFailedMessage() async {
    return isar.then((isar) async => IsarFailedMessageEntity());
  }
}
