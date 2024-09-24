import 'package:json_annotation/json_annotation.dart';
import 'package:poc_chat_2/models/chat_room_member.dart';
import 'package:poc_chat_2/models/event_type.dart';
import 'package:poc_chat_2/models/events/event.dart';
import 'package:poc_chat_2/models/events/room_event.dart' as event;
import 'package:poc_chat_2/models/rue_jai_user.dart';

part 'ruejai_chat_create_chat_room_request.g.dart';

@JsonSerializable()
class RuejaiChatCreateChatRoomRequest {
  RuejaiChatCreateChatRoomRequest({
    required this.id,
    required this.owner,
    required this.createdAt,
    required this.name,
    required this.members,
    this.thumbnailUrl,
    this.type = EventType.createRoom,
  });

  factory RuejaiChatCreateChatRoomRequest.fromEvent(
    event.CreateRoomEvent event,
  ) {
    return RuejaiChatCreateChatRoomRequest(
      id: event.id,
      owner: OwnerRequest.fromEvent(event.owner),
      createdAt: event.createdAt,
      name: event.name,
      members: event.members.map(ChatRoomMemberRequest.fromEvent).toList(),
      thumbnailUrl: event.thumbnailUrl,
    );
  }

  factory RuejaiChatCreateChatRoomRequest.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$RuejaiChatCreateChatRoomRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RuejaiChatCreateChatRoomRequestToJson(this);

  final String id;
  final OwnerRequest owner;
  final DateTime createdAt;
  final String name;
  final EventType type;
  final List<ChatRoomMemberRequest> members;
  final String? thumbnailUrl;
}

@JsonSerializable()
class OwnerRequest {
  OwnerRequest({
    required this.rueJaiUserId,
    required this.rueJaiUserType,
  });

  factory OwnerRequest.fromEvent(Owner owner) {
    return OwnerRequest(
      rueJaiUserId: owner.rueJaiUserId,
      rueJaiUserType: owner.rueJaiUserType,
    );
  }

  factory OwnerRequest.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$OwnerRequestFromJson(json);

  Map<String, dynamic> toJson() => _$OwnerRequestToJson(this);

  final String rueJaiUserId;
  final RueJaiUserType rueJaiUserType;
}

@JsonSerializable()
class ChatRoomMemberRequest {
  ChatRoomMemberRequest({
    required this.role,
    required this.rueJaiUserId,
    required this.rueJaiUserType,
  });

  factory ChatRoomMemberRequest.fromEvent(event.ChatRoomMember member) {
    return ChatRoomMemberRequest(
      role: member.role,
      rueJaiUserId: member.rueJaiUserId,
      rueJaiUserType: member.rueJaiUserType,
    );
  }

  factory ChatRoomMemberRequest.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$ChatRoomMemberRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ChatRoomMemberRequestToJson(this);

  final ChatRoomMemberRole role;
  final String rueJaiUserId;
  final RueJaiUserType rueJaiUserType;
}
