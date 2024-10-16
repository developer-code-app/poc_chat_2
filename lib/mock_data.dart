import 'package:poc_chat_2/models/chat_room.dart';
import 'package:poc_chat_2/models/chat_room_member.dart';
import 'package:poc_chat_2/models/messages/message.dart';
import 'package:poc_chat_2/models/mini_app.dart';
import 'package:poc_chat_2/models/rue_jai_user.dart';

class MockData {
  static const accessToken = '2';
  static final currentRueJaiUser = _mongAccount;

  static final _noteAccount = RueJaiUser(
    rueJaiUserId: '1',
    rueJaiUserType: RueJaiUserType.rueJaiAppUser,
    rueJaiUserRole: RueJaiUserRole.homeOwner,
    name: 'Note',
    thumbnailUrl: 'https://picsum.photos/600/600.jpg',
  );

  static final _mongAccount = RueJaiUser(
    rueJaiUserId: '2',
    rueJaiUserType: RueJaiUserType.rueJaiAppUser,
    rueJaiUserRole: RueJaiUserRole.homeOwner,
    name: 'Mong',
    thumbnailUrl: 'https://picsum.photos/600/600.jpg',
  );

  static final _kornSiwatRueJaiUser = RueJaiUser(
    rueJaiUserId: 'KornSiwat',
    rueJaiUserType: RueJaiUserType.rueJaiAppUser,
    rueJaiUserRole: RueJaiUserRole.homeOwner,
    name: 'KornSiwat',
    thumbnailUrl: 'https://picsum.photos/600/600.jpg',
  );

  static const chatRoom = ChatRoom(
    id: '1',
    name: "name",
    thumbnailUrl: "thumbnailUrl",
    members: [],
    confirmedMessages: [],
    failedMessages: [],
    sendingMessages: [],
  );

  static final owner = ChatRoomMember(
    id: '1',
    role: ChatRoomMemberRole.member,
    rueJaiUser: _mongAccount,
    lastReadMessageRecordNumber: 10,
  );

  static final textMessage = MemberTextMessage(
    id: 1,
    owner: owner,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    text: 'Hello',
  );

  static final textReplyMessage = MemberTextReplyMessage(
    id: 1,
    owner: owner,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    text: 'Reply Hello',
    repliedMessage: textMessage,
  );

  static final photoMessage = MemberPhotoMessage(
    id: 1,
    owner: owner,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    urls: [],
  );

  static final videoMessage = MemberVideoMessage(
    id: 1,
    owner: owner,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    url: '',
  );

  static final fileMessage = MemberFileMessage(
    id: 1,
    owner: owner,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    url: '',
  );

  static final miniAppMessage = MemberMiniAppMessage(
    id: 1,
    owner: owner,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    miniApp: MiniApp(),
  );

  static final chatRoomAdmin = ChatRoomMember(
    id: '3',
    role: ChatRoomMemberRole.admin,
    rueJaiUser: RueJaiUser(
      rueJaiUserId: '3',
      rueJaiUserType: RueJaiUserType.rueJaiAdmin,
      rueJaiUserRole: RueJaiUserRole.customerService,
      name: 'สุพิชชา (น้ำฝน)',
      thumbnailUrl: 'https://picsum.photos/600/600.jpg',
    ),
    lastReadMessageRecordNumber: 5,
  );

  static final khunPatPong = ChatRoomMember(
    id: '2',
    role: ChatRoomMemberRole.member,
    rueJaiUser: RueJaiUser(
      rueJaiUserId: '2',
      rueJaiUserType: RueJaiUserType.rueJaiAppUser,
      rueJaiUserRole: RueJaiUserRole.renter,
      name: 'พัฒพงษ์',
      thumbnailUrl: 'https://picsum.photos/600/600.jpg',
    ),
    lastReadMessageRecordNumber: 5,
  );

  static final siteEngineer = ChatRoomMember(
    id: '4',
    role: ChatRoomMemberRole.member,
    rueJaiUser: RueJaiUser(
      rueJaiUserId: '4',
      rueJaiUserType: RueJaiUserType.rueJaiAdmin,
      rueJaiUserRole: RueJaiUserRole.customerService,
      name: 'พีระ',
      thumbnailUrl: 'https://picsum.photos/800/800.jpg',
    ),
    lastReadMessageRecordNumber: 5,
  );

  static final chatRoom2 = ChatRoom(
    id: '2',
    name: "ผู้ดูแลโครงการ",
    thumbnailUrl: 'https://picsum.photos/800/800.jpg',
    members: [khunPatPong, chatRoomAdmin],
    confirmedMessages: [
      MemberTextMessage(
        id: 1,
        owner: chatRoomAdmin,
        createdAt: DateTime.now().add(const Duration(days: -100)),
        updatedAt: DateTime.now().add(const Duration(days: -100)),
      ),
      MemberTextMessage(
        id: 1,
        owner: khunPatPong,
        createdAt: DateTime.now().add(const Duration(days: -100)),
        updatedAt: DateTime.now().add(const Duration(days: -100)),
      ),
      MemberTextReplyMessage(
        id: 1,
        owner: chatRoomAdmin,
        repliedMessage: MemberTextMessage(
          id: 1,
          owner: chatRoomAdmin,
          createdAt: DateTime.now().add(const Duration(days: -100)),
          updatedAt: DateTime.now().add(const Duration(days: -100)),
        ),
        createdAt: DateTime.now().add(const Duration(days: -100)),
        updatedAt: DateTime.now().add(const Duration(days: -100)),
      ),
      MemberPhotoMessage(
        id: 1,
        owner: khunPatPong,
        createdAt: DateTime.now().add(const Duration(days: -100)),
        updatedAt: DateTime.now().add(const Duration(days: -100)),
      ),
      MemberTextMessage(
        id: 1,
        text:
            'สวัสดีค่ะ น้ำฝนนะคะ ตามที่เราเคยคุยกันไว้ เรื่องติดตั้งประตูไฟฟ้า คุณพัฒพงษ์ได้เลือกแบบสลิง ที่ราคา 33,000 บาท ใช่มั้ยคะ',
        owner: chatRoomAdmin,
        createdAt: DateTime.now().add(const Duration(days: -50)),
        updatedAt: DateTime.now().add(const Duration(days: -50)),
      ),
      MemberTextMessage(
        id: 2,
        text: 'ใช่ครับผม',
        owner: khunPatPong,
        createdAt: DateTime.now().add(const Duration(days: -50)),
        updatedAt: DateTime.now().add(const Duration(days: -50)),
      ),
      MemberTextMessage(
        id: 3,
        text:
            'ผมขอแจ้งเพิ่มเรื่องบ้านนะครับ พอดีฝนตกแล้วกระเบื้องหลังคาหล่น พอมีช่างแนะนำมั้ยครับ',
        owner: khunPatPong,
        createdAt: DateTime.now().add(const Duration(days: -50)),
        updatedAt: DateTime.now().add(const Duration(days: -50)),
      ),
      MemberPhotoMessage(
        id: 4,
        owner: khunPatPong,
        createdAt: DateTime.now().add(const Duration(days: -50)),
        updatedAt: DateTime.now().add(const Duration(days: -50)),
        urls: [
          'https://picsum.photos/800/800.jpg',
        ],
      ),
      MemberPhotoMessage(
        id: 5,
        owner: khunPatPong,
        createdAt: DateTime.now().add(const Duration(days: -20)),
        updatedAt: DateTime.now().add(const Duration(days: -20)),
        urls: [
          'https://picsum.photos/600/600.jpg',
          'https://picsum.photos/700/700.jpg',
          'https://picsum.photos/800/800.jpg',
        ],
      ),
      MemberPhotoMessage(
        id: 6,
        owner: khunPatPong,
        createdAt: DateTime.now().add(const Duration(days: -20)),
        updatedAt: DateTime.now().add(const Duration(days: -20)),
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
      MemberTextMessage(
        id: 7,
        text: 'ยกเลิก',
        owner: khunPatPong,
        createdAt: DateTime.now().add(const Duration(days: -20)),
        updatedAt: DateTime.now().add(const Duration(days: -20)),
        deletedAt: DateTime.now().add(const Duration(days: -20)),
      ),
      MemberTextMessage(
        id: 8,
        text: 'ยกเลิก',
        owner: chatRoomAdmin,
        createdAt: DateTime.now().add(const Duration(days: -20)),
        updatedAt: DateTime.now().add(const Duration(days: -20)),
        deletedAt: DateTime.now().add(const Duration(days: -20)),
      ),
      ActivityLogInviteMemberMessage(
        id: 9,
        owner: chatRoomAdmin,
        createdAt: DateTime.now().add(const Duration(days: -15)),
        updatedAt: DateTime.now().add(const Duration(days: -15)),
        member: siteEngineer,
      ),
      MemberTextMessage(
        id: 9,
        text:
            'สวัสดีครับคุณพัฒพงษ์ ผมพีระช่างประจำโครงการนะครับ กำแพงห้องครัวฝั่งที่ติดกับห้องโถงสามารถทุบได้ครับเพราะไม่ได้อยู่ติดกับเสาบ้านครับผม',
        owner: siteEngineer,
        createdAt: DateTime.now().add(const Duration(days: -15)),
        updatedAt: DateTime.now().add(const Duration(days: -15)),
      ),
      MemberTextMessage(
        id: 10,
        text: 'ขอบคุณครับผม',
        owner: khunPatPong,
        createdAt: DateTime.now().add(const Duration(days: -15)),
        updatedAt: DateTime.now().add(const Duration(days: -15)),
      ),
      MemberTextMessage(
        id: 11,
        text: 'ยินดีครับ คุณพัฒพงษ์ มีอะไรสอบถาม เพิ่มเติมอีกไหมครับ',
        owner: siteEngineer,
        createdAt: DateTime.now().add(const Duration(days: -15)),
        updatedAt: DateTime.now().add(const Duration(days: -15)),
      ),
      MemberTextReplyMessage(
        id: 12,
        text: 'ไม่มีครับ',
        owner: khunPatPong,
        repliedMessage: MemberTextMessage(
          id: 11,
          text: 'ยินดีครับ คุณพัฒพงษ์ มีอะไรสอบถาม เพิ่มเติมอีกไหมครับ',
          owner: siteEngineer,
          createdAt: DateTime.now().add(const Duration(days: -15)),
          updatedAt: DateTime.now().add(const Duration(days: -15)),
        ),
        createdAt: DateTime.now().add(const Duration(days: -15)),
        updatedAt: DateTime.now().add(const Duration(days: -15)),
      ),
      MemberTextReplyMessage(
        id: 13,
        text: 'ขอบคุณครับ',
        owner: siteEngineer,
        repliedMessage: MemberTextMessage(
          id: 12,
          text: 'ไม่มีครับ',
          owner: khunPatPong,
          createdAt: DateTime.now().add(const Duration(days: -15)),
          updatedAt: DateTime.now().add(const Duration(days: -15)),
        ),
        createdAt: DateTime.now().add(const Duration(days: -15)),
        updatedAt: DateTime.now().add(const Duration(days: -15)),
      ),
      ActivityLogRemoveMemberMessage(
        id: 9,
        owner: chatRoomAdmin,
        createdAt: DateTime.now().add(const Duration(days: -13)),
        updatedAt: DateTime.now().add(const Duration(days: -13)),
        member: siteEngineer,
      ),
      MemberPhotoMessage(
        id: 14,
        owner: siteEngineer,
        createdAt: DateTime.now().add(const Duration(days: -11)),
        updatedAt: DateTime.now().add(const Duration(days: -11)),
        urls: [
          'https://picsum.photos/800/800.jpg',
        ],
      ),
      MemberTextMessage(
        id: 15,
        text: 'สวัสดีครับสามารถตัวทุบตัวผนังได้ครับ แต่ต้องเก็บเสาไว้นะครับ',
        owner: siteEngineer,
        createdAt: DateTime.now().add(const Duration(days: -11)),
        updatedAt: DateTime.now().add(const Duration(days: -11)),
      ),
      MemberTextReplyMessage(
        id: 16,
        text: 'รับทราบครับ',
        owner: khunPatPong,
        repliedMessage: MemberPhotoMessage(
          id: 14,
          owner: siteEngineer,
          createdAt: DateTime.now().add(const Duration(days: -11)),
          updatedAt: DateTime.now().add(const Duration(days: -11)),
          urls: [
            'https://picsum.photos/800/800.jpg',
          ],
        ),
        createdAt: DateTime.now().add(const Duration(days: -11)),
        updatedAt: DateTime.now().add(const Duration(days: -11)),
      ),
      MemberTextMessage(
        id: 17,
        text: 'http://10.0.0.54:8080/index.html',
        owner: khunPatPong,
        createdAt: DateTime.now().add(const Duration(days: -11)),
        updatedAt: DateTime.now().add(const Duration(days: -11)),
      ),
      MemberTextMessage(
        id: 18,
        text: 'http://10.0.0.54:8080/1.html',
        owner: khunPatPong,
        createdAt: DateTime.now().add(const Duration(days: -5)),
        updatedAt: DateTime.now().add(const Duration(days: -5)),
      ),
      MemberTextMessage(
        id: 19,
        text: 'https://u24.gov.ua/',
        owner: khunPatPong,
        createdAt: DateTime.now().add(const Duration(days: -5)),
        updatedAt: DateTime.now().add(const Duration(days: -5)),
      ),
      MemberTextMessage(
        id: 20,
        text: '0881541242',
        owner: khunPatPong,
        createdAt: DateTime.now().add(const Duration(days: -5)),
        updatedAt: DateTime.now().add(const Duration(days: -5)),
      ),
      MemberTextMessage(
        id: 21,
        text: 'notetest@gmail.com 0881541242',
        owner: khunPatPong,
        createdAt: DateTime.now().add(const Duration(days: -2)),
        updatedAt: DateTime.now().add(const Duration(days: -2)),
      ),
      MemberTextMessage(
        id: 22,
        text: 'http://10.0.0.54:8080/unsupported.html',
        owner: khunPatPong,
        createdAt: DateTime.now().add(const Duration(days: -1)),
        updatedAt: DateTime.now().add(const Duration(days: -1)),
      ),
      MemberTextMessage(
        id: 23,
        text: 'https://x.com/FlutterMerge/status/1702168185758240843',
        owner: khunPatPong,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    ],
    failedMessages: [
      MemberTextMessage(
        id: 13,
        text: 'ทดสอบ Failed Messages',
        owner: khunPatPong,
        createdAt: DateTime.now().add(const Duration(days: -1)),
        updatedAt: DateTime.now().add(const Duration(days: -1)),
      ),
      MemberTextMessage(
        id: 30,
        text: 'ทดสอบ Failed Messages',
        owner: khunPatPong,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    ],
    sendingMessages: [
      MemberTextMessage(
        id: 14,
        text: 'ทดสอบ Sending Message',
        owner: khunPatPong,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    ],
  );
}
