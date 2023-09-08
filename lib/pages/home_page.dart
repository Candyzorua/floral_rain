import 'package:floral_rain/pages/start_game_page.dart';
import 'package:floral_rain/pages/stats_page.dart';
import 'package:flutter/material.dart';
import '../components/bottom_nav_bar.dart';
import '../const.dart';
import '../services/isar_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final isarService = IsarService();
  int _selectedIndex = 1;

  // pages
  final List _pages = [const StatsPage(), const StartGamePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BGCOLOR,
      bottomNavigationBar: BottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: _pages[_selectedIndex],
    );
  }

  // navigate bottom bar
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
