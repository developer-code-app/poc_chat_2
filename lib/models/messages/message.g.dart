// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MemberTextMessageCWProxy {
  MemberTextMessage id(int id);

  MemberTextMessage owner(ChatRoomMember owner);

  MemberTextMessage createdAt(DateTime createdAt);

  MemberTextMessage updatedAt(DateTime updatedAt);

  MemberTextMessage deletedAt(DateTime? deletedAt);

  MemberTextMessage addedByEventRecordNumber(int? addedByEventRecordNumber);

  MemberTextMessage updatedByEventRecordNumber(int? updatedByEventRecordNumber);

  MemberTextMessage text(String? text);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MemberTextMessage(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MemberTextMessage(...).copyWith(id: 12, name: "My name")
  /// ````
  MemberTextMessage call({
    int? id,
    ChatRoomMember? owner,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
    int? addedByEventRecordNumber,
    int? updatedByEventRecordNumber,
    String? text,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMemberTextMessage.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMemberTextMessage.copyWith.fieldName(...)`
class _$MemberTextMessageCWProxyImpl implements _$MemberTextMessageCWProxy {
  const _$MemberTextMessageCWProxyImpl(this._value);

  final MemberTextMessage _value;

  @override
  MemberTextMessage id(int id) => this(id: id);

  @override
  MemberTextMessage owner(ChatRoomMember owner) => this(owner: owner);

  @override
  MemberTextMessage createdAt(DateTime createdAt) => this(createdAt: createdAt);

  @override
  MemberTextMessage updatedAt(DateTime updatedAt) => this(updatedAt: updatedAt);

  @override
  MemberTextMessage deletedAt(DateTime? deletedAt) =>
      this(deletedAt: deletedAt);

  @override
  MemberTextMessage addedByEventRecordNumber(int? addedByEventRecordNumber) =>
      this(addedByEventRecordNumber: addedByEventRecordNumber);

  @override
  MemberTextMessage updatedByEventRecordNumber(
          int? updatedByEventRecordNumber) =>
      this(updatedByEventRecordNumber: updatedByEventRecordNumber);

  @override
  MemberTextMessage text(String? text) => this(text: text);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MemberTextMessage(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MemberTextMessage(...).copyWith(id: 12, name: "My name")
  /// ````
  MemberTextMessage call({
    Object? id = const $CopyWithPlaceholder(),
    Object? owner = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
    Object? deletedAt = const $CopyWithPlaceholder(),
    Object? addedByEventRecordNumber = const $CopyWithPlaceholder(),
    Object? updatedByEventRecordNumber = const $CopyWithPlaceholder(),
    Object? text = const $CopyWithPlaceholder(),
  }) {
    return MemberTextMessage(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int,
      owner: owner == const $CopyWithPlaceholder() || owner == null
          ? _value.owner
          // ignore: cast_nullable_to_non_nullable
          : owner as ChatRoomMember,
      createdAt: createdAt == const $CopyWithPlaceholder() || createdAt == null
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime,
      updatedAt: updatedAt == const $CopyWithPlaceholder() || updatedAt == null
          ? _value.updatedAt
          // ignore: cast_nullable_to_non_nullable
          : updatedAt as DateTime,
      deletedAt: deletedAt == const $CopyWithPlaceholder()
          ? _value.deletedAt
          // ignore: cast_nullable_to_non_nullable
          : deletedAt as DateTime?,
      addedByEventRecordNumber:
          addedByEventRecordNumber == const $CopyWithPlaceholder()
              ? _value.addedByEventRecordNumber
              // ignore: cast_nullable_to_non_nullable
              : addedByEventRecordNumber as int?,
      updatedByEventRecordNumber:
          updatedByEventRecordNumber == const $CopyWithPlaceholder()
              ? _value.updatedByEventRecordNumber
              // ignore: cast_nullable_to_non_nullable
              : updatedByEventRecordNumber as int?,
      text: text == const $CopyWithPlaceholder()
          ? _value.text
          // ignore: cast_nullable_to_non_nullable
          : text as String?,
    );
  }
}

extension $MemberTextMessageCopyWith on MemberTextMessage {
  /// Returns a callable class that can be used as follows: `instanceOfMemberTextMessage.copyWith(...)` or like so:`instanceOfMemberTextMessage.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MemberTextMessageCWProxy get copyWith =>
      _$MemberTextMessageCWProxyImpl(this);
}
