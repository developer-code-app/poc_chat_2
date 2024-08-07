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
  @JsonValue('TEXT_EDITED')
  textEdited,
  @JsonValue('DELETE_MESSAGE')
  deleteMessage,
  @JsonValue('READ_MESSAGE')
  readMessage,
  @JsonValue('CREATE_ROOM')
  createRoom,
  @JsonValue('ROLE_EDITED')
  roleEdited,
  @JsonValue('INVITE')
  invite,
  @JsonValue('REJECT')
  reject,
}
