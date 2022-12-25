import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:ok_radio_flutter/core/di/inject.dart';
import 'package:ok_radio_flutter/model/programs.dart';
import 'package:path_provider/path_provider.dart';
import 'application/app.dart';
import 'service/media_service.dart';

late AudioHandler audioHandler;

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
    SystemUiOverlay.bottom,
    SystemUiOverlay.top,
  ]);

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  audioHandler = await AudioService.init(
    builder: () => AudioPlayerHandler(),
    config: const AudioServiceConfig(
      androidNotificationChannelId: "kg.ok_radio_flutter",
      androidNotificationChannelName: "Ok Radio",
      androidNotificationOngoing: true,
      androidStopForegroundOnPause: true,
    ),
  );

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  var dir = await getApplicationDocumentsDirectory();
  // make sure it exists
  await dir.create(recursive: true);

  var dbPath = '${dir.path}hive_db';

  await Hive.initFlutter(dbPath);

  Hive.registerAdapter(ProgramsAdapter());

  await Hive.openBox<Programs>('programBox');

  await inject();
  runApp(OkRadioApp());
}
