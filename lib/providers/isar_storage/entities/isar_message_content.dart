import 'package:json_annotation/json_annotation.dart';
import 'package:poc_chat_2/models/chat_room_member.dart';
import 'package:poc_chat_2/models/messages/message.dart';
import 'package:poc_chat_2/models/rue_jai_user.dart';

part 'isar_message_content.g.dart';

@JsonSerializable()
class IsarTextMessageContentMapper {
  IsarTextMessageContentMapper({required this.text});

  factory IsarTextMessageContentMapper.fromJson(Map<String, dynamic> json) =>
      _$IsarTextMessageContentMapperFromJson(json);

  Map<String, dynamic> toJson() => _$IsarTextMessageContentMapperToJson(this);

  final String text;
}

@JsonSerializable()
class IsarPhotoMessageContentMapper {
  IsarPhotoMessageContentMapper({required this.urls});

  factory IsarPhotoMessageContentMapper.fromJson(Map<String, dynamic> json) =>
      _$IsarPhotoMessageContentMapperFromJson(json);

  Map<String, dynamic> toJson() => _$IsarPhotoMessageContentMapperToJson(this);

  final List<String> urls;
}

@JsonSerializable()
class IsarVideoMessageContentMapper {
  IsarVideoMessageContentMapper({required this.url});

  factory IsarVideoMessageContentMapper.fromJson(Map<String, dynamic> json) =>
      _$IsarVideoMessageContentMapperFromJson(json);

  Map<String, dynamic> toJson() => _$IsarVideoMessageContentMapperToJson(this);

  final String url;
}

@JsonSerializable()
class IsarFileMessageContentMapper {
  IsarFileMessageContentMapper({required this.url});

  factory IsarFileMessageContentMapper.fromJson(Map<String, dynamic> json) =>
      _$IsarFileMessageContentMapperFromJson(json);

  Map<String, dynamic> toJson() => _$IsarFileMessageContentMapperToJson(this);

  final String url;
}

@JsonSerializable()
class IsarInviteMemberMessageContentMapper {
  IsarInviteMemberMessageContentMapper({required this.invitedMember});

  factory IsarInviteMemberMessageContentMapper.fromModel(
    ActivityLogMember invitedMember,
  ) {
    return IsarInviteMemberMessageContentMapper(
      invitedMember: IsarChatRoomMember(
        role: invitedMember.role,
        rueJaiUserId: invitedMember.rueJaiUserId,
        rueJaiUserType: invitedMember.rueJaiUserType,
      ),
    );
  }

  factory IsarInviteMemberMessageContentMapper.fromJson(
          Map<String, dynamic> json) =>
      _$IsarInviteMemberMessageContentMapperFromJson(json);

  Map<String, dynamic> toJson() =>
      _$IsarInviteMemberMessageContentMapperToJson(this);

  final IsarChatRoomMember invitedMember;
}

@JsonSerializable()
class IsarUninviteMemberMessageContentMapper {
  IsarUninviteMemberMessageContentMapper({
    required this.uninvitedMember,
  });

  factory IsarUninviteMemberMessageContentMapper.fromModel(
      ActivityLogMember uninvitedMember) {
    return IsarUninviteMemberMessageContentMapper(
      uninvitedMember: IsarChatRoomMember(
        role: uninvitedMember.role,
        rueJaiUserId: uninvitedMember.rueJaiUserId,
        rueJaiUserType: uninvitedMember.rueJaiUserType,
      ),
    );
  }

  factory IsarUninviteMemberMessageContentMapper.fromJson(
          Map<String, dynamic> json) =>
      _$IsarUninviteMemberMessageContentMapperFromJson(json);

  Map<String, dynamic> toJson() =>
      _$IsarUninviteMemberMessageContentMapperToJson(this);

  final IsarChatRoomMember uninvitedMember;
}

@JsonSerializable()
class IsarChatRoomMember {
  IsarChatRoomMember({
    required this.role,
    required this.rueJaiUserId,
    required this.rueJaiUserType,
  });

  factory IsarChatRoomMember.fromJson(Map<String, dynamic> json) =>
      _$IsarChatRoomMemberFromJson(json);

  Map<String, dynamic> toJson() => _$IsarChatRoomMemberToJson(this);

  final ChatRoomMemberRole role;
  final String rueJaiUserId;
  final RueJaiUserType rueJaiUserType;
}
