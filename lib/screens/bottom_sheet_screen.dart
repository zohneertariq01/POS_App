import 'package:flutter/material.dart';
import 'package:pos_app/screens/setting_screen.dart';
import 'package:pos_app/utils/constants.dart';
import 'package:provider/provider.dart';
import '../provider/bottom_sheet_provider.dart';
import 'home_screen.dart';

class BottomSheetScreen extends StatelessWidget {
  const BottomSheetScreen({super.key});

  static const List<Widget> _widgetOptions = [
    HomeScreen(),
    SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<BottomSheetProvider>(
        builder: (context, value, child) {
          return Center(
            child: _widgetOptions.elementAt(value.selectedIndex),
          );
        },
      ),
      bottomNavigationBar: Consumer<BottomSheetProvider>(
        builder: (context, value, child) {
          return BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
            currentIndex: value.selectedIndex,
            selectedItemColor: hoverColor,
            onTap: value.onItemTapped,
          );
        },
      ),
    );
  }
}
