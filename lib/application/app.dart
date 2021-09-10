import 'package:ok_radio_flutter/presentation/screens/splash/splash_screen.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:audio_service/audio_service.dart';

class OkRadioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.white,
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ok radio',
      theme: ThemeData.light(),
      home: AudioServiceWidget(child: SplashScreen()),
    );
  }
}