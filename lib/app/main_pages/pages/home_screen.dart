import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_animate/flutter_animate.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final DateTime _focusedDay = DateTime.now();
  late AnimationController _textController;
  late Animation<double> _textFadeAnimation;

  @override
  void initState() {
    super.initState();
    _textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _textFadeAnimation = CurvedAnimation(
      parent: _textController,
      curve: Curves.easeInOut,
    );
    _textController.forward();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert, color: Colors.white, size: 28),
            onSelected: (value) {
              // if (value == 'settings') {
              //     context.goNamed(RouteNames.SETTINGS_SCREEN);
              // } 
              if (value == 'logout') {
                // Handle logout logic
              }
            },
            itemBuilder: (BuildContext context) => [
              // PopupMenuItem(
              //   value: 'settings',
              //   child: ListTile(
              //     leading: Icon(Icons.settings,
              //         color: theme.colorScheme.onSurface),
              //     title: const Text('Settings'),
              //   ),
              // ),
              PopupMenuItem(
                value: 'logout',
                child: ListTile(
                  leading:
                      Icon(Icons.logout, color: theme.colorScheme.onSurface),
                  title: const Text('Logout'),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFFFF758C),
              Color(0xFFFF7EB3),
              Color(0xFFFEC3A6),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Column(
              children: [
                const Text(
                  "❤️",
                  style: TextStyle(fontSize: 88),
                ).animate().shake(duration: 1.seconds),
                Text(
                  "Period",
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 8),
                FadeTransition(
                  opacity: _textFadeAnimation,
                  child: Text(
                    "Day 3",
                    style: theme.textTheme.displayMedium?.copyWith(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 70),
                Text(
                  "Low Chances of Getting Pregnant",
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.white70,
                    letterSpacing: 0.8,
                  ),
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.pinkAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 12),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Log Period",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),

            // Period Days Section
            const Spacer(),
            // Weekly Calendar Section
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(),
                    blurRadius: 10,
                    spreadRadius: 2,
                  )
                ],
              ),
              child: TableCalendar(
                firstDay: DateTime(2020),
                lastDay: DateTime(2030),
                focusedDay: _focusedDay,
                calendarFormat: CalendarFormat.week,
                headerVisible: false,
                calendarStyle: const CalendarStyle(
                  isTodayHighlighted: true,
                  todayDecoration: BoxDecoration(
                    color: Colors.pinkAccent,
                    shape: BoxShape.circle,
                  ),
                  defaultDecoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  weekendDecoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                ),
                daysOfWeekStyle: DaysOfWeekStyle(
                  weekendStyle:
                      TextStyle(color: theme.colorScheme.onSurface),
                  weekdayStyle:
                      TextStyle(color: theme.colorScheme.onSurface),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
