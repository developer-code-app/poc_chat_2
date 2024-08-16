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

  static final siteEngineer = ChatRoomMember(
    id: 4,
    role: ChatRoomMemberRole.member,
    rueJaiUser: RueJaiUser(
      id: 4,
      rueJaiUserId: '4',
      rueJaiUserType: RueJaiUserType.rueJaiAdmin,
      rueJaiUserRole: RueJaiUserRole.customerService,
      name: 'พีระ',
      thumbnailUrl: 'https://picsum.photos/800/800.jpg',
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
        owner: chatRoomAdmin,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      TextMessage(
        id: 1,
        owner: khunPatPong,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      TextReplyMessage(
        id: 1,
        owner: chatRoomAdmin,
        repliedMessage: TextMessage(
          id: 1,
          owner: chatRoomAdmin,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      PhotoMessage(
        id: 1,
        owner: khunPatPong,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
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
      PhotoMessage(
        id: 4,
        owner: khunPatPong,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        urls: [
          'https://picsum.photos/800/800.jpg',
        ],
      ),
      PhotoMessage(
        id: 5,
        owner: khunPatPong,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        urls: [
          'https://picsum.photos/600/600.jpg',
          'https://picsum.photos/700/700.jpg',
          'https://picsum.photos/800/800.jpg',
        ],
      ),
      PhotoMessage(
        id: 6,
        owner: khunPatPong,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        urls: [
          'https://picsum.photos/800/800.jpg',
          'https://picsum.photos/600/600.jpg',
          'https://picsum.photos/600/600.jpg',
          'https://picsum.photos/600/600.jpg',
          'https://picsum.photos/600/600.jpg',
          'https://picsum.photos/800/800.jpg',
          'https://picsum.photos/800/800.jpg',
          'https://www.girlsallaround.com/wp-content/uploads/2015/02/Francis-Co-launches-Samsung-professional-laundry-range.jpg',
        ],
      ),
      TextMessage(
        id: 7,
        text: 'ยกเลิก',
        owner: khunPatPong,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        deletedAt: DateTime.now(),
      ),
      TextMessage(
        id: 8,
        text: 'ยกเลิก',
        owner: chatRoomAdmin,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        deletedAt: DateTime.now(),
      ),
      InviteMemberMessage(
        id: 9,
        owner: chatRoomAdmin,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        member: siteEngineer,
      ),
      TextMessage(
        id: 9,
        text:
            'สวัสดีครับคุณพัฒพงษ์ ผมพีระช่างประจำโครงการนะครับ กำแพงห้องครัวฝั่งที่ติดกับห้องโถงสามารถทุบได้ครับเพราะไม่ได้อยู่ติดกับเสาบ้านครับผม',
        owner: siteEngineer,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      TextMessage(
        id: 10,
        text: 'ขอบคุณครับผม',
        owner: khunPatPong,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      TextMessage(
        id: 11,
        text: 'ยินดีครับ คุณพัฒพงษ์ มีอะไรสอบถาม เพิ่มเติมอีกไหมครับ',
        owner: siteEngineer,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      TextReplyMessage(
        id: 12,
        text: 'ไม่มีครับ',
        owner: khunPatPong,
        repliedMessage: TextMessage(
          id: 11,
          text: 'ยินดีครับ คุณพัฒพงษ์ มีอะไรสอบถาม เพิ่มเติมอีกไหมครับ',
          owner: siteEngineer,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      TextReplyMessage(
        id: 13,
        text: 'ขอบคุณครับ',
        owner: siteEngineer,
        repliedMessage: TextMessage(
          id: 12,
          text: 'ไม่มีครับ',
          owner: khunPatPong,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      RemoveMemberMessage(
        id: 9,
        owner: chatRoomAdmin,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        member: siteEngineer,
      ),
      PhotoMessage(
        id: 14,
        owner: siteEngineer,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        urls: [
          'https://picsum.photos/800/800.jpg',
        ],
      ),
      TextMessage(
        id: 15,
        text: 'สวัสดีครับสามารถตัวทุบตัวผนังได้ครับ แต่ต้องเก็บเสาไว้นะครับ',
        owner: siteEngineer,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      TextReplyMessage(
        id: 16,
        text: 'รับทราบครับ',
        owner: khunPatPong,
        repliedMessage: PhotoMessage(
          id: 14,
          owner: siteEngineer,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          urls: [
            'https://picsum.photos/800/800.jpg',
          ],
        ),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    ],
    failedMessages: [
      // TextMessage(
      //   id: 13,
      //   text: 'ทดสอบ',
      //   owner: khunPatPong,
      //   createdAt: DateTime.now(),
      //   updatedAt: DateTime.now(),
      // ),
    ],
    sendingMessages: [
      // TextMessage(
      //   id: 14,
      //   text: 'ทดสอบ Sending Message',
      //   owner: khunPatPong,
      //   createdAt: DateTime.now(),
      //   updatedAt: DateTime.now(),
      // ),
    ],
  );
}
