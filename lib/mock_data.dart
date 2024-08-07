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

  static final chatRoomAdmin = ChatRoomMember(
    id: 3,
    role: ChatRoomMemberRole.admin,
    rueJaiUser: RueJaiUser(
      id: 3,
      rueJaiUserId: '3',
      rueJaiUserType: RueJaiUserType.rueJaiAdmin,
      rueJaiUserRole: RueJaiUserRole.customerService,
      name: 'สุพิชชา (น้ำฝน)',
      thumbnailUrl: 'https://picsum.photos/600/600.jpg',
    ),
    lastReadMessageId: 5,
  );

  static final khunPatPong = ChatRoomMember(
    id: 2,
    role: ChatRoomMemberRole.member,
    rueJaiUser: RueJaiUser(
      id: 2,
      rueJaiUserId: '2',
      rueJaiUserType: RueJaiUserType.rueJaiAppUser,
      rueJaiUserRole: RueJaiUserRole.renter,
      name: 'พัฒพงษ์',
      thumbnailUrl: 'https://picsum.photos/600/600.jpg',
    ),
    lastReadMessageId: 5,
  );

  static final chatRoom2 = ChatRoom(
    id: 2,
    name: "ผู้ดูแลโครงการ",
    thumbnailUrl: '',
    members: [khunPatPong, chatRoomAdmin],
    confirmedMessages: [
      TextMessage(
        id: 1,
        text:
            'สวัสดีค่ะ น้ำฝนนะคะ ตามที่เราเคยคุยกันไว้ เรื่องติดตั้งประตูไฟฟ้า คุณพัฒพงษ์ได้เลือกแบบสลิง ที่ราคา 33,000 บาท ใช่มั้ยคะ',
        owner: chatRoomAdmin,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      TextMessage(
        id: 2,
        text: 'ใช่ครับผม',
        owner: khunPatPong,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      TextMessage(
        id: 3,
        text:
            'ผมขอแจ้งเพิ่มเรื่องบ้านนะครับ  พอดีฝนตกแล้วกระเบื้องหลังคาหล่น พอมีช่างแนะนำมั้ยครับ',
        owner: khunPatPong,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    ],
    failedMessages: [
      TextMessage(
        id: 4,
        text: 'ทดสอบ',
        owner: khunPatPong,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      TextMessage(
        id: 4,
        text:
            'ทดสอบ Failed Message MessageMessageMessageMessageMessageMessageMessageMessageMessageMessageMessageMessageMessageMessageMessageMessageMessageMessageMessageMessageMessageMessageMessage',
        owner: khunPatPong,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    ],
    sendingMessages: [
      TextMessage(
        id: 5,
        text:
            'ทดสอบ Sending Message MessageMessageMessageMessageMessageMessageMessageMessageMessageMessageMessageMessageMessageMessageMessageMessageMessageMessage',
        owner: khunPatPong,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    ],
  );
}
