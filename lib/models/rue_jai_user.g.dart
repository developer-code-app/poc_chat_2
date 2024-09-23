// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rue_jai_user.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$RueJaiUserCWProxy {
  RueJaiUser id(int id);

  RueJaiUser rueJaiUserId(String rueJaiUserId);

  RueJaiUser rueJaiUserType(RueJaiUserType rueJaiUserType);

  RueJaiUser rueJaiUserRole(RueJaiUserRole rueJaiUserRole);

  RueJaiUser name(String name);

  RueJaiUser thumbnailUrl(String? thumbnailUrl);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RueJaiUser(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RueJaiUser(...).copyWith(id: 12, name: "My name")
  /// ````
  RueJaiUser call({
    int? id,
    String? rueJaiUserId,
    RueJaiUserType? rueJaiUserType,
    RueJaiUserRole? rueJaiUserRole,
    String? name,
    String? thumbnailUrl,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfRueJaiUser.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfRueJaiUser.copyWith.fieldName(...)`
class _$RueJaiUserCWProxyImpl implements _$RueJaiUserCWProxy {
  const _$RueJaiUserCWProxyImpl(this._value);

  final RueJaiUser _value;

  @override
  RueJaiUser id(int id) => this(id: id);

  @override
  RueJaiUser rueJaiUserId(String rueJaiUserId) =>
      this(rueJaiUserId: rueJaiUserId);

  @override
  RueJaiUser rueJaiUserType(RueJaiUserType rueJaiUserType) =>
      this(rueJaiUserType: rueJaiUserType);

  @override
  RueJaiUser rueJaiUserRole(RueJaiUserRole rueJaiUserRole) =>
      this(rueJaiUserRole: rueJaiUserRole);

  @override
  RueJaiUser name(String name) => this(name: name);

  @override
  RueJaiUser thumbnailUrl(String? thumbnailUrl) =>
      this(thumbnailUrl: thumbnailUrl);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RueJaiUser(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RueJaiUser(...).copyWith(id: 12, name: "My name")
  /// ````
  RueJaiUser call({
    Object? id = const $CopyWithPlaceholder(),
    Object? rueJaiUserId = const $CopyWithPlaceholder(),
    Object? rueJaiUserType = const $CopyWithPlaceholder(),
    Object? rueJaiUserRole = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? thumbnailUrl = const $CopyWithPlaceholder(),
  }) {
    return RueJaiUser(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int,
      rueJaiUserId:
          rueJaiUserId == const $CopyWithPlaceholder() || rueJaiUserId == null
              ? _value.rueJaiUserId
              // ignore: cast_nullable_to_non_nullable
              : rueJaiUserId as String,
      rueJaiUserType: rueJaiUserType == const $CopyWithPlaceholder() ||
              rueJaiUserType == null
          ? _value.rueJaiUserType
          // ignore: cast_nullable_to_non_nullable
          : rueJaiUserType as RueJaiUserType,
      rueJaiUserRole: rueJaiUserRole == const $CopyWithPlaceholder() ||
              rueJaiUserRole == null
          ? _value.rueJaiUserRole
          // ignore: cast_nullable_to_non_nullable
          : rueJaiUserRole as RueJaiUserRole,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      thumbnailUrl: thumbnailUrl == const $CopyWithPlaceholder()
          ? _value.thumbnailUrl
          // ignore: cast_nullable_to_non_nullable
          : thumbnailUrl as String?,
    );
  }
}

extension $RueJaiUserCopyWith on RueJaiUser {
  /// Returns a callable class that can be used as follows: `instanceOfRueJaiUser.copyWith(...)` or like so:`instanceOfRueJaiUser.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$RueJaiUserCWProxy get copyWith => _$RueJaiUserCWProxyImpl(this);
}
