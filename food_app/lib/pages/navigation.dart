import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:food_app/pages/favorite.dart';
import 'package:food_app/pages/home.dart';
import 'package:food_app/pages/search.dart';
import 'package:food_app/pages/user.dart';
import 'package:flutter/cupertino.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int pageIndex = 0;
  List<Widget> pages = [
    Home(),
    Search(),
    Favorite(),
    User(),
  ];

  void _onItemTapped(int index) async {
    setState(
      () {
        pageIndex = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: pages,
      ),
      floatingActionButton: SafeArea(
        child: FloatingActionButton(
          onPressed: () {},
          child: Icon(
            Icons.add,
            size: 20,
            color: Colors.white,
          ),
          shape: const CircleBorder(), // Đảm bảo hình tròn

          backgroundColor: Color(0xFFCEA700),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        height: 80,
        shadow: Shadow(
          color: Colors.black.withOpacity(0.2),
          offset: Offset(0, 4),
          blurRadius: 10,
        ),
        icons: [
          CupertinoIcons.house,
          CupertinoIcons.search,
          CupertinoIcons.bookmark,
          CupertinoIcons.person,
        ],
        inactiveColor: Colors.black.withOpacity(0.5),
        activeColor: Color(0xFFCEA700),
        gapLocation: GapLocation.center,
        activeIndex: pageIndex,
        notchSmoothness: NotchSmoothness.softEdge,
        leftCornerRadius: 10,
        iconSize: 25,
        rightCornerRadius: 10,
        elevation: 0,
        onTap: _onItemTapped,
      ),
    );
  }
}
