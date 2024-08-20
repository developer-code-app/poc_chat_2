import 'dart:async';

import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:poc_chat_2/app.dart';
import 'package:poc_chat_2/app_setup.dart';
import 'package:poc_chat_2/flavor_constants.dart';

Future<void> main() async {
  FlavorConfig(
    variables: {
      FlavorVariableKeys.ruejaiChatApiBaseUrl: 'http://10.0.0.4:8081',
      FlavorVariableKeys.webSocketBaseUrl: 'ws://10.0.0.4:8081',
    },
  );

  await setupApp(
    const FlavorBanner(
      child: App(),
    ),
  );
}
