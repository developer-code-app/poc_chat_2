import 'package:json_annotation/json_annotation.dart';
import 'package:poc_chat_2/models/chat_room_member.dart';
import 'package:poc_chat_2/models/rue_jai_user.dart';

part 'message_content.g.dart';

@JsonSerializable()
class TextMessageContent {
  TextMessageContent({required this.text});

  factory TextMessageContent.fromJson(Map<String, dynamic> json) =>
      _$TextMessageContentFromJson(json);

  Map<String, dynamic> toJson() => _$TextMessageContentToJson(this);

  final String text;
}

@JsonSerializable()
class PhotoMessageContent {
  PhotoMessageContent({required this.urls});

  factory PhotoMessageContent.fromJson(Map<String, dynamic> json) =>
      _$PhotoMessageContentFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoMessageContentToJson(this);

  final List<String> urls;
}

@JsonSerializable()
class VideoMessageContent {
  VideoMessageContent({required this.url});

  factory VideoMessageContent.fromJson(Map<String, dynamic> json) =>
      _$VideoMessageContentFromJson(json);

  Map<String, dynamic> toJson() => _$VideoMessageContentToJson(this);

  final String url;
}

@JsonSerializable()
class FileMessageContent {
  FileMessageContent({required this.url});

  factory FileMessageContent.fromJson(Map<String, dynamic> json) =>
      _$FileMessageContentFromJson(json);

  Map<String, dynamic> toJson() => _$FileMessageContentToJson(this);

  final String url;
}

@JsonSerializable()
class InviteMemberMessageContent {
  InviteMemberMessageContent({required this.invitedMember});

  factory InviteMemberMessageContent.fromModel(ChatRoomMember invitedMember) {
    return InviteMemberMessageContent(
      invitedMember: InvitedMember(
        role: invitedMember.role,
        rueJaiUserId: invitedMember.rueJaiUser.rueJaiUserId,
        rueJaiUserType: invitedMember.rueJaiUser.rueJaiUserType,
      ),
    );
  }

  factory InviteMemberMessageContent.fromJson(Map<String, dynamic> json) =>
      _$InviteMemberMessageContentFromJson(json);

  Map<String, dynamic> toJson() => _$InviteMemberMessageContentToJson(this);

  final InvitedMember invitedMember;
}

@JsonSerializable()
class InvitedMember {
  InvitedMember({
    required this.role,
    required this.rueJaiUserId,
    required this.rueJaiUserType,
  });

  factory InvitedMember.fromJson(Map<String, dynamic> json) =>
      _$InvitedMemberFromJson(json);

  Map<String, dynamic> toJson() => _$InvitedMemberToJson(this);

  final ChatRoomMemberRole role;
  final String rueJaiUserId;
  final RueJaiUserType rueJaiUserType;
}
