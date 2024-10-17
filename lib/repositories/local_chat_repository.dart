import 'package:poc_chat_2/extensions/extended_nullable.dart';
import 'package:poc_chat_2/mock_data.dart';
import 'package:poc_chat_2/models/chat_room.dart';
import 'package:poc_chat_2/models/chat_room_member.dart';
import 'package:poc_chat_2/models/chat_room_profile.dart';
import 'package:poc_chat_2/models/chat_room_sync_state.dart';
import 'package:poc_chat_2/models/events/room_event.dart'
    as room_management_event;
import 'package:poc_chat_2/models/forms/message/message_form.dart';
import 'package:poc_chat_2/models/messages/message.dart';
import 'package:poc_chat_2/models/rue_jai_user.dart';
import 'package:poc_chat_2/providers/isar_storage/isar_storage_provider.dart';
import 'package:poc_chat_2/providers/isar_storage/requests/isar_update_chat_room_profile_request.dart';
import 'package:poc_chat_2/providers/isar_storage/requests/isar_update_confirmed_text_message_request.dart';

class LocalChatRepository {
  LocalChatRepository({required this.provider});

  IsarStorageProvider provider;

  Future<bool> isChatRoomExists({
    required String chatRoomId,
  }) async {
    return false;
  }

  Future<int?> getChatRoomLastSyncedRoomAndMessageEventRecordNumber({
    required String chatRoomId,
  }) async {
    return provider.chat
        .getChatRoomLastSyncedRoomAndMessageEventRecordNumber(
          chatRoomId: chatRoomId,
        )
        .onError<Error>((error, _) => throw Exception(error.toString()));
  }

  Future<List<ChatRoom>> getChatRooms() async {
    return provider.chat
        .getChatRooms()
        .then((chatRooms) => chatRooms.map(ChatRoom.fromIsarEntity).toList())
        .onError<Error>((error, _) => throw Exception(error.toString()));
  }

  Future<List<ChatRoomState>> getChatRoomStates() async {
    return provider.chat
        .getChatRooms()
        .then((chatRoomState) =>
            chatRoomState.map(ChatRoomState.fromIsarEntity).toList())
        .onError<Error>((error, _) => throw Exception(error.toString()));
  }

  Future<ChatRoomMember> getMemberByRueJaiUser({
    required String chatRoomId,
    required String rueJaiUserId,
  }) async {
    return provider.chat
        .getMemberByRueJaiUser(
          chatRoomId: chatRoomId,
          rueJaiUserId: rueJaiUserId,
        )
        .then((member) => member.getOrThrow(errorMessage: 'Member not found.'))
        .then(ChatRoomMember.fromIsarEntity)
        .onError<Error>((error, _) => throw Exception(error.toString()));
  }

  Future<ChatRoom> getChatRoom({
    required String chatRoomId,
  }) async {
    return provider.chat
        .getChatRoom(chatRoomId: chatRoomId)
        .then((room) => room.getOrThrow(errorMessage: 'Room not found.'))
        .then(ChatRoom.fromIsarEntity)
        .onError<Error>((error, _) => throw Exception(error.toString()));
  }

  Future<List<Message>> getMessages() async {
    return List.empty();
  }

  Future<List<int>> findTimeoutSendingMessageIds({
    required Duration timeout,
  }) async {
    return provider.chat
        .findTimeoutSendingMessageIds(timeout: timeout)
        .onError<Error>((error, _) => throw Exception(error.toString()));
  }

  Future<void> updateSendingMessagesToFailedMessages({
    required List<int> messageIds,
  }) async {
    return provider.chat
        .updateSendingMessagesToFailedMessages(messageIds: messageIds)
        .onError<Error>((error, _) => throw Exception(error.toString()));
  }

  Future<int> getMessageCount() async {
    return await getConfirmedMessageCount() +
        await getUnconfirmedMessageCount();
  }

  Future<Message?> getMessage({
    required String chatRoomId,
    required int recordNumber,
  }) async {
    return null;
  }

  Future<ChatRoomState> addChatRoom({
    required String chatRoomId,
  }) async {
    return provider.chat
        .addChatRoom(chatRoomId: chatRoomId)
        .then(ChatRoomState.fromIsarEntity)
        .onError<Error>((error, _) => throw Exception(error.toString()));
  }

  Future<List<Message>> searchMessages(
    String chatRoomId,
    String query,
  ) async {
    return List.empty();
  }

  Future<void> updateChatRoomProfile({
    required ChatRoomProfile chatRoomProfile,
  }) async {
    final request = IsarUpdateChatRoomProfileRequest(
      roomId: chatRoomProfile.id,
      name: chatRoomProfile.name,
      profileHash: chatRoomProfile.profileHash,
      thumbnailUrl: chatRoomProfile.thumbnailUrl,
      members: chatRoomProfile.members,
    );

    return provider.chat
        .updateChatRoomProfile(request)
        .onError<Error>((error, _) => throw Exception(error.toString()));
  }
}

extension LocalChatRoomRepository on LocalChatRepository {
  Future<void> removeChatRoom({
    required String chatRoomId,
  }) async {
    return provider.chat
        .removeChatRoom(chatRoomId: chatRoomId)
        .onError<Error>((error, _) => throw Exception(error.toString()));
  }

  Future<int> getLastSyncedRoomManagementEventRecordNumber({
    required String chatRoomId,
  }) async {
    return 0;
  }

  Future<List<ChatRoomMember>> getMembers({
    required String chatRoomId,
  }) async {
    return provider.chat
        .getMembers(chatRoomId: chatRoomId)
        .then((members) => members.map(ChatRoomMember.fromIsarEntity).toList())
        .onError<Error>((error, _) => throw Exception(error.toString()));
  }

  Future<void> createMember({
    required String targetChatRoomId,
    required room_management_event.ChatRoomMember member,
  }) async {}

  Future<ChatRoom> updateChatRoom({
    required String targetChatRoomId,
    required String? newName,
    required String? newThumbnailUrl,
  }) async {
    return MockData.chatRoom;
  }

  Future<ChatRoomMember> updateMemberRole({
    required String targetChatRoomId,
    required int targetMemberAddedByRecordNumber,
    required ChatRoomMemberRole newRole,
  }) async {
    return MockData.owner;
  }

  Future<int> deleteMember({
    required String targetChatRoomId,
    required int targetMemberAddedByRecordNumber,
  }) async {
    return 1;
  }
}

extension LocalChatRoomReadRepository on LocalChatRepository {
  Future<int> getMemberLastReadMessageAddedByRecordNumber({
    required String chatRoomId,
    required String memberRueJaiUserId,
    required RueJaiUserType memberRueJaiUserType,
  }) async {
    return 0;
  }

  Future<int> getLastSyncedReadEventRecordNumber({
    required String chatRoomId,
  }) async {
    return 0;
  }

  Future<void> updateMemberLastReadMessage({
    required String targetChatRoomId,
    required String targetMemberRueJaiUserId,
    required RueJaiUserType targetMemberRueJaiUserType,
    required int newLastReadMessageCreatedByRecordNumber,
  }) async {}
}

extension LocalChatRoomConfirmedMessageRepository on LocalChatRepository {
  Future<int> getLastSyncedMessageEventRecordNumber({
    required String chatRoomId,
  }) async {
    return provider.chat
        .getLastSyncedMessageEventRecordNumber(targetChatRoomId: chatRoomId)
        .onError<Error>((error, _) => throw Exception(error.toString()));
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
    required String targetChatRoomId,
    required MessageForm form,
  }) async {
    return provider.chat
        .createConfirmedMessage(targetChatRoomId: targetChatRoomId, form: form)
        .then(Message.fromConfirmedMessageEntity)
        .onError<Error>((error, _) => throw Exception(error.toString()));
  }

  Future<Message> updateConfirmedTextMessage({
    required String targetMessageChatRoomId,
    required int targetMessageCreatedByRecordNumber,
    required String newText,
    required DateTime newUpdatedAt,
    required int newLastUpdatedByRecordNumber,
  }) async {
    final request = IsarUpdateConfirmedTextMessageRequest(
      targetMessageChatRoomId: targetMessageChatRoomId,
      targetMessageCreatedByRecordNumber: targetMessageCreatedByRecordNumber,
      newUpdatedAt: newUpdatedAt,
      newLastUpdatedByRecordNumber: newLastUpdatedByRecordNumber,
      newText: newText,
    );

    return provider.chat
        .updateConfirmedTextMessage(request)
        .then(Message.fromConfirmedMessageEntity)
        .onError<Error>((error, _) => throw Exception(error.toString()));
  }

  Future<int> deleteConfirmedMessage({
    required String targetCreatedByEventId,
    required String targetChatRoomId,
    required int eventRecordNumber,
  }) async {
    return provider.chat
        .deleteConfirmedMessage(
          targetCreatedByEventId: targetCreatedByEventId,
          targetChatRoomId: targetChatRoomId,
          eventRecordNumber: eventRecordNumber,
        )
        .onError<Error>((error, _) => throw Exception(error.toString()));
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
    required String targetChatRoomId,
    required MessageForm form,
  }) async {
    return provider.chat
        .createUnconfirmedMessage(
          targetChatRoomId: targetChatRoomId,
          form: form,
        )
        .then((message) => Message.fromUnconfirmedMessageEntity(message))
        .onError<Error>((error, _) => throw Exception(error.toString()));
  }

  Future<Message> createSendingMessage({
    required String targetChatRoomId,
    required MessageForm form,
  }) async {
    return provider.chat
        .createSendingMessage(targetChatRoomId: targetChatRoomId, form: form)
        .then((message) => Message.fromSendingMessageEntity(message))
        .onError<Error>((error, _) => throw Exception(error.toString()));
  }

  Future<int> deleteUnconfirmedMessage({
    required String targetCreatedByEventId,
  }) async {
    return provider.chat
        .deleteUnconfirmedMessage(
          targetCreatedByEventId: targetCreatedByEventId,
        )
        .onError<Error>((error, _) => throw Exception(error.toString()));
  }

  Future<int> deleteSendingMessage({
    required String targetCreatedByEventId,
  }) async {
    return provider.chat
        .deleteSendingMessage(
          targetCreatedByEventId: targetCreatedByEventId,
        )
        .onError<Error>((error, _) => throw Exception(error.toString()));
  }

  Future<int> deleteFailedMessage({
    required String targetCreatedByEventId,
  }) async {
    return provider.chat
        .deleteFailedMessage(
          targetCreatedByEventId: targetCreatedByEventId,
        )
        .onError<Error>((error, _) => throw Exception(error.toString()));
  }

  Future<Message> resendMessage({required int messageId}) async {
    return provider.chat
        .resendMessage(messageId: messageId)
        .then(Message.fromSendingMessageEntity)
        .onError<Error>((error, _) => throw Exception(error.toString()));
  }
}
