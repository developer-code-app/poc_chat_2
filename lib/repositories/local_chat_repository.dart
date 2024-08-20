import 'package:poc_chat_2/mock_data.dart';
import 'package:poc_chat_2/models/chat_room.dart';
import 'package:poc_chat_2/models/chat_room_latest_event_record_info.dart';
import 'package:poc_chat_2/models/chat_room_member.dart';
import 'package:poc_chat_2/models/events/room_event.dart'
    as room_management_event;
import 'package:poc_chat_2/models/forms/message_form.dart';
import 'package:poc_chat_2/models/message.dart';
import 'package:poc_chat_2/models/rue_jai_user.dart';
import 'package:poc_chat_2/providers/isar_storage/isar_storage_provider.dart';

class LocalChatRepository {
  LocalChatRepository({required this.provider});

  IsarStorageProvider provider;

  Future<bool> isChatRoomExists({
    required int chatRoomId,
  }) async {
    return false;
  }

  Future<ChatRoomLatestEventRecordInfo> getChatRoomLatestEventRecordInfo({
    required int chatRoomId,
  }) async {
    return ChatRoomLatestEventRecordInfo(
      roomAndMessageRecordNumber: 0,
    );
  }

  Future<List<ChatRoom>> getChatRooms() async {
    return provider.chat
        .getChatRooms()
        .then((chatRooms) => chatRooms.map(ChatRoom.fromEntity).toList())
        .onError<Error>((error, _) => throw Exception());
  }

  Future<ChatRoom?> getChatRoom() async {
    return null;
  }

  Future<List<Message>> getMessages() async {
    return List.empty();
  }

  Future<int> getMessageCount() async {
    return await getConfirmedMessageCount() +
        await getUnconfirmedMessageCount();
  }

  Future<Message?> getMessage({
    required int chatRoomId,
    required int recordNumber,
  }) async {
    return null;
  }

  Future<void> addChatRoom({
    required int chatRoomId,
  }) async {}

  Future<List<Message>> searchMessages(
    int chatRoomId,
    String query,
  ) async {
    return List.empty();
  }
}

extension LocalChatRoomRepository on LocalChatRepository {
  Future<int> getLastSyncedRoomManagementEventRecordNumber({
    required int chatRoomId,
  }) async {
    return 0;
  }

  Future<List<ChatRoomMember>> getMembers({
    required int chatRoomId,
  }) async {
    return List.empty();
  }

  Future<void> createMember({
    required int targetChatRoomId,
    required room_management_event.ChatRoomMember member,
  }) async {}

  Future<ChatRoom> updateChatRoom({
    required int targetChatRoomId,
    required String? newName,
    required String? newThumbnailUrl,
  }) async {
    return MockData.chatRoom;
  }

  Future<ChatRoomMember> updateMemberRole({
    required int targetChatRoomId,
    required int targetMemberAddedByRecordNumber,
    required ChatRoomMemberRole newRole,
  }) async {
    return MockData.owner;
  }

  Future<int> deleteMember({
    required int targetChatRoomId,
    required int targetMemberAddedByRecordNumber,
  }) async {
    return 1;
  }
}

extension LocalChatRoomReadRepository on LocalChatRepository {
  Future<int> getMemberLastReadMessageAddedByRecordNumber({
    required int chatRoomId,
    required String memberRueJaiUserId,
    required RueJaiUserType memberRueJaiUserType,
  }) async {
    return 0;
  }

  Future<int> getLastSyncedReadEventRecordNumber({
    required int chatRoomId,
  }) async {
    return 0;
  }

  Future<void> updateMemberLastReadMessage({
    required int targetChatRoomId,
    required String targetMemberRueJaiUserId,
    required RueJaiUserType targetMemberRueJaiUserType,
    required int newLastReadMessageCreatedByRecordNumber,
  }) async {}
}

extension LocalChatRoomConfirmedMessageRepository on LocalChatRepository {
  Future<int> getLastSyncedMessageEventRecordNumber({
    required int chatRoomId,
  }) async {
    return 0;
  }

  Future<int> getConfirmedMessageCount() async {
    // return ISAR.table(messages).count;
    return 0;
  }

  Future<int> getLatestConfirmedMessageId() async {
    // return ISAR.table(messages).last;
    return 0;
  }

  Future<List<Message>> getConfirmedMessages() async {
    return List.empty();
  }

  Future<Message> createConfirmedMessage({
    required int targetChatRoomId,
    required MessageForm form,
  }) async {
    return MockData.textMessage;
  }

  Future<Message> updateConfirmedTextMessage({
    required int targetMessageChatRoomId,
    required int targetMessageCreatedByRecordNumber,
    required String? newText,
    required DateTime newUpdatedAt,
    required int newLastUpdatedByRecordNumber,
  }) async {
    return MockData.textMessage;
  }

  Future<int> deleteConfirmedMessage({
    required int targetMessageCreatedByRecordNumber,
  }) async {
    return MockData.textMessage.id;
  }
}

extension LocalChatRoomTemporaryMessageRepository on LocalChatRepository {
  Future<int> getUnconfirmedMessageCount() async {
    return 0;
  }

  Future<List<Message>> getUnconfirmedMessages() async {
    return List.empty();
  }

  Future<List<Message>> getSendingMessages() async {
    return List.empty();
  }

  Future<List<Message>> getFailedMessages() async {
    return List.empty();
  }

  Future<Message> createUnconfirmedMessage({
    required int targetChatRoomId,
    required MessageForm form,
  }) async {
    return provider.chat
        .createUnconfirmedMessage()
        .then((message) => Message.fromUnconfirmedMessageEntity(message))
        .onError<Error>((error, _) => throw Exception());
  }

  Future<Message> createSendingMessage({
    required int targetChatRoomId,
    required MessageForm form,
  }) async {
    return provider.chat
        .createSendingMessage()
        .then((message) => Message.fromSendingMessageEntity(message))
        .onError<Error>((error, _) => throw Exception());
  }

  Future<void> createFailedMessage({
    required int targetChatRoomId,
    required MessageForm form,
  }) async {}

  Future<int> deleteUnconfirmedMessage({
    required int targetChatRoomId,
    required int targetMessageCreatedByRecordNumber,
  }) async {
    return MockData.textMessage.id;
  }

  Future<int> deleteSendingMessage({
    required int targetChatRoomId,
    required int targetMessageCreatedByRecordNumber,
  }) async {
    return MockData.textMessage.id;
  }

  Future<int> deleteFailedMessage({
    required int targetChatRoomId,
    required int targetMessageCreatedByRecordNumber,
  }) async {
    return MockData.textMessage.id;
  }
}
