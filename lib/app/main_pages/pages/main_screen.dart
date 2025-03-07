import 'package:flutter/material.dart';
import 'package:vibration/vibration_presets.dart';
import 'package:zuricycle/app/main_pages/pages/stats_screen.dart';
import 'package:vibration/vibration.dart';
import 'pages.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // List of screens to navigate
  final List<Widget> _screens = [
    const HomeScreen(),
    const CalendarScreen(),
    const StatScreen(),
    const ProfileScreen(),  
  ];

  void _onItemTapped(int index) async{
    if (await Vibration.hasVibrator()) {
      Vibration.vibrate(preset: VibrationPreset.singleShortBuzz);
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),  // <-- Stats Icon
            label: 'Stats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        type: BottomNavigationBarType.shifting,
        selectedItemColor: theme.colorScheme.primary,
        unselectedItemColor: theme.disabledColor,
      ),
    );
  }
}
