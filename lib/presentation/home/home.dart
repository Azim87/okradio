import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_svg/svg.dart';
import '../../util/assets.dart';
import '../message/message_page.dart';
import '../play/play_page.dart';
import '../profile/profile_page.dart';
import '../program/program_page.dart';

const FIRST_PAGE_INDEX = 0;

class OkRadioHomePage extends StatefulWidget {
  @override
  _OkRadioHomePageState createState() => _OkRadioHomePageState();
}

class _OkRadioHomePageState extends State<OkRadioHomePage> {
  final _pageViewController = PageController();
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _removeSplash();
  }

  Future<void> _removeSplash() async {
    await Future.delayed(const Duration(seconds: 1));
    FlutterNativeSplash.remove();
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
  }

  Future<bool> _onWillPopCallback() async {
    if (_currentIndex > FIRST_PAGE_INDEX) {
      _pageViewController.animateToPage(
        FIRST_PAGE_INDEX,
        duration: Duration(milliseconds: 400),
        curve: Curves.easeIn,
      );
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPopCallback,
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(Assets.uPlay),
              activeIcon: SvgPicture.asset(Assets.play),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(Assets.uEnvelop),
              activeIcon: SvgPicture.asset(Assets.envelop),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(Assets.uBrowser),
              activeIcon: SvgPicture.asset(Assets.browser),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(Assets.uList),
              activeIcon: SvgPicture.asset(Assets.list),
              label: '',
            ),
          ],
          onTap: (index) {
            _pageViewController.animateToPage(
              index,
              duration: Duration(milliseconds: 400),
              curve: Curves.easeIn,
            );
          },
          iconSize: 25,
          elevation: 5,
        ),
        body: PageView(
          controller: _pageViewController,
          children: [
            PlayRadioPage(),
            MessagePage(),
            ProgramsPage(),
            ProfilePage(),
          ],
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
            WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
          },
        ),
      ),
    );
  }
}
