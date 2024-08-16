import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:poc_chat_2/providers/rue_jai_chat_archive/services/rue_jai_chat_archive_event_service.dart';
import 'package:poc_chat_2/providers/ruejai_chat/interceptors/authentication_interceptor.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RuejaiChatArchiveProvider {
  RuejaiChatArchiveProvider(Dio dio)
      : event = RueJaiChatArchiveEventService(dio);

  RuejaiChatArchiveProvider.basic({
    required SharedPreferences prefs,
  }) : this(
          _createClient()
            ..interceptors.addAll(
              [
                AuthenticationInterceptor(prefs: prefs),
                if (kDebugMode)
                  LogInterceptor(
                    requestBody: true,
                    responseHeader: false,
                    responseBody: true,
                  ),
              ],
            ),
        );

  static Dio _createClient() => Dio(
        BaseOptions(
          contentType: 'application/json',
          connectTimeout: const Duration(seconds: 30),
          sendTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
        ),
      );

  final RueJaiChatArchiveEventService event;
}
