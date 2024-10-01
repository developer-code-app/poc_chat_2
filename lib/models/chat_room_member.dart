import 'package:json_annotation/json_annotation.dart';
import 'package:poc_chat_2/models/rue_jai_user.dart';
import 'package:poc_chat_2/providers/isar_storage/entities/isar_chat_room_member_entity.dart'
    as member_entity;
import 'package:copy_with_extension/copy_with_extension.dart';

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
    required this.lastReadMessageId,
  });

  factory ChatRoomMember.fromIsarEntity(
    member_entity.IsarChatRoomMemberEntity entity,
  ) {
    final rueJaiUser = entity.rueJaiUser.value;

    if (rueJaiUser == null) throw Exception('User not found');

    return ChatRoomMember(
      id: entity.id,
      role: entity.role,
      rueJaiUser: RueJaiUser.fromIsarEntity(rueJaiUser),
      lastReadMessageId: entity.lastReadMessageId,
    );
  }

  final int id;
  final ChatRoomMemberRole role;
  final RueJaiUser rueJaiUser;
  final int lastReadMessageId;

  String get name => rueJaiUser.name;
}
