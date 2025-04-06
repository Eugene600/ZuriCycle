import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vibration/vibration_presets.dart';
import 'package:vibration/vibration.dart';
import '../../../utils/utils.dart';

class MainScreen extends StatelessWidget {
  final Widget child;

  const MainScreen({super.key, required this.child});

  static const List<String> routeNames = [
    RouteNames.HOME_SCREEN,
    RouteNames.CALENDAR_SCREEN,
    RouteNames.STATS_SCREEN,
    RouteNames.PROFILE_SCREEN,
  ];

  void _onItemTapped(BuildContext context, int index) async {
    if (await Vibration.hasVibrator()) {
      Vibration.vibrate(preset: VibrationPreset.singleShortBuzz);
    }

    if (!context.mounted) return;
    context.goNamed(routeNames[index]);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final String location =
        GoRouter.of(context).routerDelegate.currentConfiguration.uri.toString();

    int selectedIndex = 0;
    if (location.contains('calendar-screen')) {
      selectedIndex = 1;
    } else if (location.contains('stats-screen')) {
      selectedIndex = 2;
    } else if (location.contains('profile-screen')) {
      selectedIndex = 3;
    }
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) => _onItemTapped(context, index),
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
            icon: Icon(Icons.bar_chart),
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
