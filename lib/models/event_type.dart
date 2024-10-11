import 'package:json_annotation/json_annotation.dart';

enum EventType {
  @JsonValue('CREATE_TEXT_MESSAGE')
  createTextMessage,
  @JsonValue('CREATE_TEXT_REPLY_MESSAGE')
  createTextReplyMessage,
  @JsonValue('CREATE_PHOTO_MESSAGE')
  createPhotoMessage,
  @JsonValue('CREATE_VIDEO_MESSAGE')
  createVideoMessage,
  @JsonValue('CREATE_FILE_MESSAGE')
  createFileMessage,
  @JsonValue('CREATE_HOME_CARE_MESSAGE')
  createHomeCareMessage,
  @JsonValue('UPDATE_TEXT_MESSAGE')
  updateTextMessage,
  @JsonValue('DELETE_MESSAGE')
  deleteMessage,
  @JsonValue('CREATE_ROOM')
  createRoom,
  @JsonValue('UPDATE_ROOM')
  updateRoom,
  @JsonValue('INVITE_MEMBER')
  inviteMember,
  @JsonValue('EDIT_MEMBER_ROLE')
  updateMemberRole,
  @JsonValue('UNINVITE_MEMBER')
  uninviteMember,
  @JsonValue('READ_MESSAGE')
  readMessage,
}
