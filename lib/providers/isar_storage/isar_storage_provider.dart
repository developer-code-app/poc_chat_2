import 'package:poc_chat_2/providers/isar_storage/entities/isar_chat_room_entity.dart';
import 'package:poc_chat_2/providers/isar_storage/entities/isar_chat_room_member_entity.dart';
import 'package:poc_chat_2/providers/isar_storage/entities/isar_confirmed_message_entity.dart';
import 'package:poc_chat_2/providers/isar_storage/entities/isar_failed_message_entity.dart';
import 'package:poc_chat_2/providers/isar_storage/entities/isar_rue_jai_user_entity.dart';
import 'package:poc_chat_2/providers/isar_storage/entities/isar_sending_message_entity.dart';
import 'package:poc_chat_2/providers/isar_storage/entities/isar_unconfirmed_message_entity.dart';
import 'package:poc_chat_2/providers/isar_storage/services/isar_chat_service.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarStorageProvider {
  IsarStorageProvider(Future<Isar> isar) : chat = IsarChatService(isar);

  IsarStorageProvider.basic() : this(_openDatabase());

  static Future<Isar> _openDatabase() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();

      return await Isar.open(
        [
          IsarChatRoomEntitySchema,
          IsarChatRoomMemberEntitySchema,
          IsarConfirmedMessageEntitySchema,
          IsarUnconfirmedMessageEntitySchema,
          IsarSendingMessageEntitySchema,
          IsarFailedMessageEntitySchema,
          IsarRueJaiUserEntitySchema
        ],
        inspector: true,
        directory: dir.path,
      );
    }

    return Future.value(Isar.getInstance());
  }

  final IsarChatService chat;
}
