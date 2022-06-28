import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ok_radio_flutter/presentation/message/message_page.dart';

import '../../assets.dart';
import '../play/play_page.dart';

class OkRadioHomePage extends StatefulWidget {
  @override
  _OkRadioHomePageState createState() => _OkRadioHomePageState();
}

class _OkRadioHomePageState extends State<OkRadioHomePage> {
  late final _pageViewController = PageController();

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  void dispose() {
    _pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                  _currentIndex == 0 ? Assets.play : Assets.uPlay),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                  _currentIndex == 1 ? Assets.envelop : Assets.uEnvelop),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                  _currentIndex == 2 ? Assets.browser : Assets.uBrowser),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                  _currentIndex == 3 ? Assets.list : Assets.uList),
              label: '',
            ),
          ],
          onTap: (index) {
            _pageViewController.animateToPage(index,
                duration: Duration(milliseconds: 400), curve: Curves.easeIn);
          },
          iconSize: 25,
          elevation: 5,
        ),
        body: PageView(
          controller: _pageViewController,
          children: [
            PlayRadioPage(),
            MessagePage(),
            PlayRadioPage(),
            PlayRadioPage()
          ],
          onPageChanged: (index) => setState(() => _currentIndex = index),
        ),
      );
}
