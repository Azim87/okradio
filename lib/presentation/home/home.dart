import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import '../play/play_page.dart';

class OkRadioHomePage extends StatefulWidget {
  @override
  _OkRadioHomePageState createState() => _OkRadioHomePageState();
}

class _OkRadioHomePageState extends State<OkRadioHomePage> {
  late final List<BottomNavigationBarItem>? bottomBarListItem;
  late List _iconData = [PlayRadioPage(), PlayRadioPage()];
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
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Screen A'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Screen B")
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

  onItemTap(int? index) {
    setState(() => _currentIndex = index!);
  }
}
