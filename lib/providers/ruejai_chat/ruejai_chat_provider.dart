import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:poc_chat_2/flavor_constants.dart';
import 'package:poc_chat_2/providers/ruejai_chat/interceptors/authentication_interceptor.dart';
import 'package:poc_chat_2/providers/ruejai_chat/services/rue_jai_chat_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RuejaiChatApiProvider {
  RuejaiChatApiProvider(Dio dio) : chat = RueJaiChatService(dio);

  RuejaiChatApiProvider.basic({
    required SharedPreferences prefs,
  }) : this(
          _createClient(
            baseUrl: FlavorConfig
                .instance.variables[FlavorVariableKeys.ruejaiChatApiBaseUrl],
          )..interceptors.addAll(
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

  static Dio _createClient({required String baseUrl}) => Dio(
        BaseOptions(
          baseUrl: baseUrl,
          contentType: 'application/json',
          connectTimeout: const Duration(seconds: 30),
          sendTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
        ),
      );

  final RueJaiChatService chat;
}
