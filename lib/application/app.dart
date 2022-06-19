import 'package:flutter/material.dart';
import 'package:ok_radio_flutter/core/navigation/navigation.dart';

class OkRadioApp extends StatelessWidget {
  OkRadioApp();

  final navigation = Navigation.router;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: navigation.defaultRouteParser(),
      routerDelegate: navigation.delegate(),
      debugShowCheckedModeBanner: false,
      title: 'Ok radio',
      theme: ThemeData.light(),
    );
  }
}
