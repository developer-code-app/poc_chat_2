import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ruejai_response.g.dart';

@JsonSerializable(createToJson: false, genericArgumentFactories: true)
class RuejaiResponse<T extends Equatable> extends Equatable {
  const RuejaiResponse(this.result);

  factory RuejaiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJson,
  ) =>
      _$RuejaiResponseFromJson(json, fromJson);

  final T result;

  @override
  List<Object> get props => [result];
}

class RuejaiIntResponse extends Equatable {
  final int result;

  const RuejaiIntResponse({required this.result});

  factory RuejaiIntResponse.fromJson(Map<String, dynamic> json) {
    return RuejaiIntResponse(result: json['result']);
  }

  @override
  List<Object> get props => [result];
}

@JsonSerializable(createToJson: false, genericArgumentFactories: true)
class RuejaiListResponse<T extends Equatable> extends Equatable {
  const RuejaiListResponse(this.result);

  factory RuejaiListResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJson,
  ) =>
      _$RuejaiListResponseFromJson(json, fromJson);

  final List<T> result;

  @override
  List<Object> get props => [result];
}

@JsonSerializable(createToJson: false, genericArgumentFactories: true)
class RuejaiResultListResponse<T> extends Equatable {
  const RuejaiResultListResponse(this.result);

  factory RuejaiResultListResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJson,
  ) =>
      _$RuejaiResultListResponseFromJson(json, fromJson);

  final List<T> result;

  @override
  List<Object> get props => [result];
}
