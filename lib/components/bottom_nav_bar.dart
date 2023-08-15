import 'package:floral_rain/const.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key, required this.onTabChange});
  final void Function(int tabNum)? onTabChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(45),
      child: GNav(
        onTabChange: (value) => {onTabChange!(value)},
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          tabBorderRadius: 25.0,
          mainAxisAlignment: MainAxisAlignment.center,
          tabBackgroundColor: Colors.grey.shade100,
          activeColor: Colors.green[700],
          haptic: true,
          tabs: [
            GButton(icon: Icons.leaderboard, text: 'stats', textStyle: BOTTOM_NAVBAR_STYLE,),
            GButton(icon: Icons.play_arrow_rounded, text: 'play', textStyle: BOTTOM_NAVBAR_STYLE,)
          ]),
    );
  }
}
