import 'dart:async';

import 'package:poc_chat_2/models/chat_room_member.dart';
import 'package:poc_chat_2/models/events/recorded_event.dart';
import 'package:poc_chat_2/models/messages/message.dart';

part 'chat_room.dart';
part 'chat_room_basic_info.dart';
part 'chat_room_message.dart';
part 'chat_message.dart';
part 'web_socket.dart';
part 'rue_jai_chat.dart';

class Broadcaster {
  Broadcaster._({required this.messageStreamController});

  static Broadcaster? _instance;

  // ignore: prefer_constructors_over_static_methods
  static Broadcaster get instance {
    _instance ??= Broadcaster._(
      messageStreamController: StreamController.broadcast(),
    );

    return _instance!;
  }

  final StreamController<BroadcasterMessage> messageStreamController;

  Stream<BroadcasterMessage> get stream => messageStreamController.stream;

  void add(BroadcasterMessage message) => messageStreamController.add(message);
}

abstract class BroadcasterMessage {}
