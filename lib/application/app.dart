import 'package:ok_radio_flutter/presentation/screens/splash/splash_screen.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class OkRadioApp extends StatelessWidget {
  OkRadioApp();

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
      home: SplashScreen(),
    );
  }
}
