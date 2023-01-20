import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:ok_radio_flutter/core/di/inject.dart';

import 'application/app.dart';
import 'service/media_service.dart';

late AudioHandler audioHandler;

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
  //   SystemUiOverlay.bottom,
  //   SystemUiOverlay.top,
  // ]);
  audioHandler = await AudioService.init(
    builder: () => AudioPlayerHandler(),
    config: const AudioServiceConfig(
      androidNotificationChannelId: "kg.ok_radio_flutter",
      androidNotificationChannelName: "Ok Radio",
      androidNotificationOngoing: true,
      androidStopForegroundOnPause: true,
    ),
  );

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await inject();
  runApp(OkRadioApp());
}
