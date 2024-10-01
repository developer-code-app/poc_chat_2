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
  @JsonValue('EDIT_TEXT_MESSAGE')
  editTextMessage,
  @JsonValue('DELETE_MESSAGE')
  deleteMessage,
  @JsonValue('READ_MESSAGE')
  readMessage,
  @JsonValue('CREATE_ROOM')
  createRoom,
  @JsonValue('EDIT_MEMBER_ROLE')
  editMemberRole,
  @JsonValue('INVITE_MEMBER')
  inviteMember,
  @JsonValue('REMOVE_MEMBER')
  removeMember,
}
