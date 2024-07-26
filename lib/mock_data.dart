import 'package:poc_chat_2/models/chat_room.dart';
import 'package:poc_chat_2/models/chat_room_member.dart';
import 'package:poc_chat_2/models/message.dart';
import 'package:poc_chat_2/models/mini_app.dart';
import 'package:poc_chat_2/models/rue_jai_user.dart';

class MockData {
  static final chatRoom = ChatRoom(
    id: 1,
    name: "name",
    thumbnailUrl: "thumbnailUrl",
    members: [],
    confirmedMessages: [],
    failedMessages: [],
    sendingMessages: [],
  );

  static final rueJaiUser = RueJaiUser(
    id: 1,
    rueJaiUserId: '69',
    rueJaiUserType: RueJaiUserType.rueJaiAppUser,
    rueJaiUserRole: RueJaiUserRole.renter,
    name: 'MongATI',
    thumbnailUrl: '',
  );

  static final owner = ChatRoomMember(
    id: 1,
    role: ChatRoomMemberRole.member,
    rueJaiUser: rueJaiUser,
    lastReadMessageId: 10,
  );

  static final textMessage = TextMessage(
    id: 1,
    owner: owner,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    text: 'Hello',
  );

  static final textReplyMessage = TextReplyMessage(
    id: 1,
    owner: owner,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    text: 'Reply Hello',
    repliedMessage: textMessage,
  );

  static final photoMessage = PhotoMessage(
    id: 1,
    owner: owner,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    urls: [],
  );

  static final videoMessage = VideoMessage(
    id: 1,
    owner: owner,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    url: '',
  );

  static final fileMessage = FileMessage(
    id: 1,
    owner: owner,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    url: '',
  );

  static final miniAppMessage = MiniAppMessage(
    id: 1,
    owner: owner,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    miniApp: MiniApp(),
  );
}
