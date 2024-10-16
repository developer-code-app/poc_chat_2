import 'package:json_annotation/json_annotation.dart';
import 'package:poc_chat_2/mock_data.dart';
import 'package:poc_chat_2/models/rue_jai_user.dart';
import 'package:poc_chat_2/providers/isar_storage/entities/isar_chat_room_member_entity.dart'
    as member_entity;
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:poc_chat_2/providers/ruejai_chat/entities/rue_jai_chat_room_profile_entity.dart';

part 'chat_room_member.g.dart';

enum ChatRoomMemberRole {
  @JsonValue('ADMIN')
  admin,
  @JsonValue('MEMBER')
  member,
}

@CopyWith()
class ChatRoomMember {
  ChatRoomMember({
    required this.id,
    required this.role,
    required this.rueJaiUser,
    required this.lastReadMessageRecordNumber,
  });

  factory ChatRoomMember.fromEntity(RueJaiChatRoomMemberEntity entity) {
    return ChatRoomMember(
      id: entity.id.toString(),
      role: entity.role,
      rueJaiUser: RueJaiUser.fromEntity(entity.rueJaiUser),
      lastReadMessageRecordNumber: entity.lastReadMessageRecordNumber,
    );
  }

  factory ChatRoomMember.fromIsarEntity(
    member_entity.IsarChatRoomMemberEntity entity,
  ) {
    final rueJaiUser = entity.rueJaiUser.value;

    if (rueJaiUser == null) throw Exception('User not found');

    return ChatRoomMember(
      id: entity.memberId,
      role: entity.role,
      rueJaiUser: RueJaiUser.fromIsarEntity(rueJaiUser),
      lastReadMessageRecordNumber: entity.lastReadMessageRecordNumber,
    );
  }

  final String id;
  final ChatRoomMemberRole role;
  final RueJaiUser rueJaiUser;
  final int lastReadMessageRecordNumber;

  String get name => rueJaiUser.name;
}
