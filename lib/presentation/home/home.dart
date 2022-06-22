import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ok_radio_flutter/colors.dart';

import '../../assets.dart';
import '../play/play_page.dart';

class OkRadioHomePage extends StatefulWidget {
  @override
  _OkRadioHomePageState createState() => _OkRadioHomePageState();
}

class _OkRadioHomePageState extends State<OkRadioHomePage> {
  late final List<BottomNavigationBarItem>? bottomBarListItem;
  late List _iconData = [
    PlayRadioPage(),
    PlayRadioPage(),
    // PlayRadioPage(),
    // PlayRadioPage()
  ];
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.play,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.play,
              color: Colors.amber,
            ),
            label: '',
          ),
          // BottomNavigationBarItem(
          //   icon: Image.asset(
          //     _currentIndex == 2 ? Assets.play : Assets.uPlay,
          //   ),
          //   label: '',
          // ),
          // BottomNavigationBarItem(
          //   icon: Image.asset(
          //     _currentIndex == 3 ? Assets.browser : Assets.uBrowser,
          //   ),
          //   label: '',
          // ),
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.red,
        onTap: onItemTap,
        iconSize: 25,
        elevation: 5,
      ),
      body: _iconData[_currentIndex],
    );
  }

  onItemTap(int index) {
    setState(() => _currentIndex = index);
  }
}
