// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_room.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ChatRoomCWProxy {
  ChatRoom id(int id);

  ChatRoom name(String name);

  ChatRoom thumbnailUrl(String thumbnailUrl);

  ChatRoom members(List<ChatRoomMember> members);

  ChatRoom confirmedMessages(List<Message> confirmedMessages);

  ChatRoom failedMessages(List<Message> failedMessages);

  ChatRoom sendingMessages(List<Message> sendingMessages);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ChatRoom(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ChatRoom(...).copyWith(id: 12, name: "My name")
  /// ````
  ChatRoom call({
    int? id,
    String? name,
    String? thumbnailUrl,
    List<ChatRoomMember>? members,
    List<Message>? confirmedMessages,
    List<Message>? failedMessages,
    List<Message>? sendingMessages,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfChatRoom.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfChatRoom.copyWith.fieldName(...)`
class _$ChatRoomCWProxyImpl implements _$ChatRoomCWProxy {
  const _$ChatRoomCWProxyImpl(this._value);

  final ChatRoom _value;

  @override
  ChatRoom id(int id) => this(id: id);

  @override
  ChatRoom name(String name) => this(name: name);

  @override
  ChatRoom thumbnailUrl(String thumbnailUrl) =>
      this(thumbnailUrl: thumbnailUrl);

  @override
  ChatRoom members(List<ChatRoomMember> members) => this(members: members);

  @override
  ChatRoom confirmedMessages(List<Message> confirmedMessages) =>
      this(confirmedMessages: confirmedMessages);

  @override
  ChatRoom failedMessages(List<Message> failedMessages) =>
      this(failedMessages: failedMessages);

  @override
  ChatRoom sendingMessages(List<Message> sendingMessages) =>
      this(sendingMessages: sendingMessages);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ChatRoom(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ChatRoom(...).copyWith(id: 12, name: "My name")
  /// ````
  ChatRoom call({
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? thumbnailUrl = const $CopyWithPlaceholder(),
    Object? members = const $CopyWithPlaceholder(),
    Object? confirmedMessages = const $CopyWithPlaceholder(),
    Object? failedMessages = const $CopyWithPlaceholder(),
    Object? sendingMessages = const $CopyWithPlaceholder(),
  }) {
    return ChatRoom(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      thumbnailUrl:
          thumbnailUrl == const $CopyWithPlaceholder() || thumbnailUrl == null
              ? _value.thumbnailUrl
              // ignore: cast_nullable_to_non_nullable
              : thumbnailUrl as String,
      members: members == const $CopyWithPlaceholder() || members == null
          ? _value.members
          // ignore: cast_nullable_to_non_nullable
          : members as List<ChatRoomMember>,
      confirmedMessages: confirmedMessages == const $CopyWithPlaceholder() ||
              confirmedMessages == null
          ? _value.confirmedMessages
          // ignore: cast_nullable_to_non_nullable
          : confirmedMessages as List<Message>,
      failedMessages: failedMessages == const $CopyWithPlaceholder() ||
              failedMessages == null
          ? _value.failedMessages
          // ignore: cast_nullable_to_non_nullable
          : failedMessages as List<Message>,
      sendingMessages: sendingMessages == const $CopyWithPlaceholder() ||
              sendingMessages == null
          ? _value.sendingMessages
          // ignore: cast_nullable_to_non_nullable
          : sendingMessages as List<Message>,
    );
  }
}

extension $ChatRoomCopyWith on ChatRoom {
  /// Returns a callable class that can be used as follows: `instanceOfChatRoom.copyWith(...)` or like so:`instanceOfChatRoom.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ChatRoomCWProxy get copyWith => _$ChatRoomCWProxyImpl(this);
}
