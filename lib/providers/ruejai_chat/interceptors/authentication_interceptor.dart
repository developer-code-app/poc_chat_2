import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:poc_chat_2/preference_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationInterceptor extends Interceptor {
  AuthenticationInterceptor({
    required this.prefs,
  });

  final SharedPreferences prefs;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    var accessToken = prefs.getString(AuthPreferenceKeys.accessToken);

    if (accessToken != null) {
      final newOptions = options.copyWith(
        headers: options.headers
          ..addEntries([
            AuthorizationHeader(token: accessToken).mapEntry,
          ]),
      );

      super.onRequest(newOptions, handler);
    } else {
      super.onRequest(options, handler);
    }
  }
}

@immutable
class AuthorizationHeader {
  const AuthorizationHeader({required this.token});

  final String token;

  String get value => '$prefixValue $token';
  MapEntry<String, String> get mapEntry => MapEntry(key, value);

  static const key = 'Authorization';
  static const prefixValue = 'Bearer';
}
