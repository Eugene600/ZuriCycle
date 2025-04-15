import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:zuricycle/app/auth/providers/user_provider.dart';
import 'package:zuricycle/features/cycles/controllers/cycle_notifier.dart';
import 'package:zuricycle/features/cycles/providers/cycle_provider.dart';

import '../../../utils/utils.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with TickerProviderStateMixin {
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

    Future.microtask(() async {
      await ref.read(cycleNotifierProvider.notifier).getCycle();
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cycle = ref.watch(cycleNotifierProvider);
    final stage = ref.watch(cycleNotifierProvider.notifier).cycleStage();
    final now = DateTime.now();

    String emoji = '';
    String title = "";
    String subtitle = "";
    String description = "";
    bool showButton = true;

    // if (cycle == null) {
    //   return Center(
    //     child: Text(
    //       "No cycle data",
    //       style: theme.textTheme.headlineSmall?.copyWith(color: Colors.white),
    //     ),
    //   );
    // }

    switch (stage) {
      case CycleStage.period:
        final periodStart = DateTime.parse(cycle!.period_start);
        emoji = "❤️";
        title = "Period";
        subtitle = "Day ${now.difference(periodStart).inDays + 1}";
        description = "Low chances of getting pregnant";
        showButton = false;
        break;
      case CycleStage.fertile:
        final ovulation = DateTime.parse(cycle!.ovulation);
        emoji = "🌿";
        title = "Ovulation in";
        subtitle = "${ovulation.difference(now).inDays} days";
        description = "High fertility — good chances of conception";
        break;
      case CycleStage.ovulation:
        emoji = "🌕";
        title = "Ovulation is";
        subtitle = "Today";
        description = "Fertile peak — ovulation happening";
        break;
      case CycleStage.predicted:
        emoji = "🩸";
        title = "Period may happen";
        subtitle = "Today";
        description = "You may start your period today";
        break;
      case CycleStage.afterOvulation:
        final predictedPeriodStart =
            DateTime.parse(cycle!.predicted_period_start);
        emoji = "🗓️";
        title = "Next Period";
        subtitle = "in ${predictedPeriodStart.difference(now).inDays} days";
        description = "Low chances of getting pregnant";
        break;
      case CycleStage.none:
        emoji = "🗓️";
        title = "Log Period";
        subtitle = "Get Started\n\t\t\t\t Today";
        description = "Track your cycle to stay prepared";
        break;
    }

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
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Confirm Logout"),
                      content: const Text("Are you sure you want to logout?"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            context.pop();
                          },
                          child: const Text("Cancel"),
                        ),
                        TextButton(
                          onPressed: () {
                            ref.read(authNotifierProvider.notifier).logout();

                            context.goNamed(RouteNames.LOGIN_SCREEN);
                          },
                          child: const Text("Logout"),
                        ),
                      ],
                    );
                  },
                );
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
                Text(
                  emoji,
                  style: TextStyle(fontSize: 88),
                ).animate().shake(duration: 1.seconds),
                Text(
                  title,
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
                    subtitle,
                    style: theme.textTheme.displayMedium?.copyWith(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 70),
                Text(
                  description,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.white70,
                    letterSpacing: 0.8,
                  ),
                ),
                const SizedBox(height: 50),
                if (showButton)
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
                    onPressed: () {
                      context.goNamed(RouteNames.LOG_PERIOD);
                    },
                    child: const Text(
                      "Log Period",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                  weekendStyle: TextStyle(color: theme.colorScheme.onSurface),
                  weekdayStyle: TextStyle(color: theme.colorScheme.onSurface),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
