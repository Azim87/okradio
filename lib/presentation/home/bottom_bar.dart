import 'package:flutter/material.dart';

class BottomBarItem {
  final IconData icon;
  const BottomBarItem({required this.icon});
}

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late List<BottomNavigationBarItem>? bottomBarListItem;
  late List<IconData> _iconData = [
    Icons.ac_unit,
    Icons.add,
    Icons.access_alarm,
    Icons.check
  ];
  int _currentIndex = 0;

  @override
  void initState() {
    bottomBarListItem = [];
    _iconData.forEach((icons) {
      bottomBarListItem!.add(BottomNavigationBarItem(
        icon: Icon(icons),
        label: "",
      ));
    });
    super.initState();
  }

  onItemTap(int index) => setState(() => _currentIndex = index);

  @override
  Widget build(BuildContext context) => BottomNavigationBar(
        currentIndex: _currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.shifting,
        items: bottomBarListItem!,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.red,
        onTap: onItemTap,
        iconSize: 25,
        elevation: 5,
      );
}
