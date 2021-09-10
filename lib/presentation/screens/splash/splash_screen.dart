import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ok_radio_flutter/assets.dart';
import 'package:ok_radio_flutter/presentation/home.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(milliseconds: 800),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => OkRadioHomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            OkRadioBackgroundContainer(),
            Center(child: SvgPicture.asset(Assets.app_logo)),
          ],
        ));
  }
}

class OkRadioBackgroundContainer extends StatelessWidget {
  const OkRadioBackgroundContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage(Assets.background),
        fit: BoxFit.fitWidth,
        alignment: Alignment.topCenter,
      )),
    );
  }
}
