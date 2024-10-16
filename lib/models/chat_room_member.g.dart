// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_room_member.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ChatRoomMemberCWProxy {
  ChatRoomMember id(String id);

  ChatRoomMember role(ChatRoomMemberRole role);

  ChatRoomMember rueJaiUser(RueJaiUser rueJaiUser);

  ChatRoomMember lastReadMessageRecordNumber(int lastReadMessageRecordNumber);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ChatRoomMember(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ChatRoomMember(...).copyWith(id: 12, name: "My name")
  /// ````
  ChatRoomMember call({
    String? id,
    ChatRoomMemberRole? role,
    RueJaiUser? rueJaiUser,
    int? lastReadMessageRecordNumber,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfChatRoomMember.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfChatRoomMember.copyWith.fieldName(...)`
class _$ChatRoomMemberCWProxyImpl implements _$ChatRoomMemberCWProxy {
  const _$ChatRoomMemberCWProxyImpl(this._value);

  final ChatRoomMember _value;

  @override
  ChatRoomMember id(String id) => this(id: id);

  @override
  ChatRoomMember role(ChatRoomMemberRole role) => this(role: role);

  @override
  ChatRoomMember rueJaiUser(RueJaiUser rueJaiUser) =>
      this(rueJaiUser: rueJaiUser);

  @override
  ChatRoomMember lastReadMessageRecordNumber(int lastReadMessageRecordNumber) =>
      this(lastReadMessageRecordNumber: lastReadMessageRecordNumber);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ChatRoomMember(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ChatRoomMember(...).copyWith(id: 12, name: "My name")
  /// ````
  ChatRoomMember call({
    Object? id = const $CopyWithPlaceholder(),
    Object? role = const $CopyWithPlaceholder(),
    Object? rueJaiUser = const $CopyWithPlaceholder(),
    Object? lastReadMessageRecordNumber = const $CopyWithPlaceholder(),
  }) {
    return ChatRoomMember(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      role: role == const $CopyWithPlaceholder() || role == null
          ? _value.role
          // ignore: cast_nullable_to_non_nullable
          : role as ChatRoomMemberRole,
      rueJaiUser:
          rueJaiUser == const $CopyWithPlaceholder() || rueJaiUser == null
              ? _value.rueJaiUser
              // ignore: cast_nullable_to_non_nullable
              : rueJaiUser as RueJaiUser,
      lastReadMessageRecordNumber:
          lastReadMessageRecordNumber == const $CopyWithPlaceholder() ||
                  lastReadMessageRecordNumber == null
              ? _value.lastReadMessageRecordNumber
              // ignore: cast_nullable_to_non_nullable
              : lastReadMessageRecordNumber as int,
    );
  }
}

extension $ChatRoomMemberCopyWith on ChatRoomMember {
  /// Returns a callable class that can be used as follows: `instanceOfChatRoomMember.copyWith(...)` or like so:`instanceOfChatRoomMember.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ChatRoomMemberCWProxy get copyWith => _$ChatRoomMemberCWProxyImpl(this);
}
