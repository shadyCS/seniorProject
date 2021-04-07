import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:final_t_and_t/Providers/screen_changer.dart';
import 'package:final_t_and_t/Theme/app_theme.dart';
import 'package:final_t_and_t/constatns.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const String id = 'HomeScreen';
  @override
  Widget build(BuildContext context) {
    final screen = Provider.of<ScreenChanger>(context);
    return Scaffold(
      body: pages[screen.screenIndex],
      bottomNavigationBar: CurvedNavigationBar(
        items: [
          Icon(
            Icons.home,
            color: Colors.black,
          ),
          Icon(
            Icons.search,
            color: Colors.black,
          ),
          Icon(
            Icons.add,
            color: Colors.black,
          ),
          Icon(
            Icons.settings,
            color: Colors.black,
          ),
          Icon(
            Icons.account_circle,
            color: Colors.black,
          ),
        ],
        index: screen.navIndex,
        height: 50,
        animationDuration: Duration(milliseconds: 200),
        color: kPrimaryColor,
        backgroundColor: Colors.white,
        onTap: (index) {
          screen.changeIndex(index);
        },
      ),
    );
  }
}
