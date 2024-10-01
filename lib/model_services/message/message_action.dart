import 'package:poc_chat_2/broadcaster/broadcaster.dart';
import 'package:poc_chat_2/repositories/local_chat_repository.dart';

class MessageAction {
  MessageAction({
    required this.localChatRepository,
  });

  final LocalChatRepository localChatRepository;

  Future<void> updateTimeoutSendingMessageToFailed({
    required Duration timeout,
  }) async {
    final messageIds = await localChatRepository.findTimeoutSendingMessageIds(
      timeout: timeout,
    );

    if (messageIds.isEmpty) return;

    await localChatRepository.updateSendingMessagesToFailedMessages(
      messageIds: messageIds,
    );

    Broadcaster.instance.add(UpdateSendingMessageToFailedMessage());
  }
}
