// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ruejai_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RuejaiResponse<T> _$RuejaiResponseFromJson<T extends Equatable>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    RuejaiResponse<T>(
      fromJsonT(json['result']),
    );

RuejaiListResponse<T> _$RuejaiListResponseFromJson<T extends Equatable>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    RuejaiListResponse<T>(
      (json['result'] as List<dynamic>).map(fromJsonT).toList(),
    );

RuejaiResultListResponse<T> _$RuejaiResultListResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    RuejaiResultListResponse<T>(
      (json['result'] as List<dynamic>).map(fromJsonT).toList(),
    );
