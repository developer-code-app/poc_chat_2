// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TextMessageCWProxy {
  TextMessage id(int id);

  TextMessage owner(ChatRoomMember owner);

  TextMessage createdAt(DateTime createdAt);

  TextMessage updatedAt(DateTime updatedAt);

  TextMessage deletedAt(DateTime? deletedAt);

  TextMessage addedByEventRecordNumber(int? addedByEventRecordNumber);

  TextMessage updatedByEventRecordNumber(int? updatedByEventRecordNumber);

  TextMessage text(String? text);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TextMessage(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TextMessage(...).copyWith(id: 12, name: "My name")
  /// ````
  TextMessage call({
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

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTextMessage.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTextMessage.copyWith.fieldName(...)`
class _$TextMessageCWProxyImpl implements _$TextMessageCWProxy {
  const _$TextMessageCWProxyImpl(this._value);

  final TextMessage _value;

  @override
  TextMessage id(int id) => this(id: id);

  @override
  TextMessage owner(ChatRoomMember owner) => this(owner: owner);

  @override
  TextMessage createdAt(DateTime createdAt) => this(createdAt: createdAt);

  @override
  TextMessage updatedAt(DateTime updatedAt) => this(updatedAt: updatedAt);

  @override
  TextMessage deletedAt(DateTime? deletedAt) => this(deletedAt: deletedAt);

  @override
  TextMessage addedByEventRecordNumber(int? addedByEventRecordNumber) =>
      this(addedByEventRecordNumber: addedByEventRecordNumber);

  @override
  TextMessage updatedByEventRecordNumber(int? updatedByEventRecordNumber) =>
      this(updatedByEventRecordNumber: updatedByEventRecordNumber);

  @override
  TextMessage text(String? text) => this(text: text);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TextMessage(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TextMessage(...).copyWith(id: 12, name: "My name")
  /// ````
  TextMessage call({
    Object? id = const $CopyWithPlaceholder(),
    Object? owner = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
    Object? deletedAt = const $CopyWithPlaceholder(),
    Object? addedByEventRecordNumber = const $CopyWithPlaceholder(),
    Object? updatedByEventRecordNumber = const $CopyWithPlaceholder(),
    Object? text = const $CopyWithPlaceholder(),
  }) {
    return TextMessage(
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

extension $TextMessageCopyWith on TextMessage {
  /// Returns a callable class that can be used as follows: `instanceOfTextMessage.copyWith(...)` or like so:`instanceOfTextMessage.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TextMessageCWProxy get copyWith => _$TextMessageCWProxyImpl(this);
}
