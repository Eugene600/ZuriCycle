import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';


class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen>
    with SingleTickerProviderStateMixin {
  DateTime _focusedDay = DateTime.now();
  late AnimationController _glowAnimationController;
  late Animation<double> _glowAnimation;

  @override
  void initState() {
    super.initState();

    _glowAnimationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _glowAnimation = Tween<double>(begin: 2, end: 10).animate(
      CurvedAnimation(
        parent: _glowAnimationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _glowAnimationController.dispose();
    super.dispose();
  }

  final Map<DateTime, Color> _highlightedDates = {
    for (var date in [
      DateTime(2025, 3, 3),
      DateTime(2025, 3, 4),
      DateTime(2025, 3, 5),
      DateTime(2025, 3, 6),
      DateTime(2025, 3, 7),
      DateTime(2025, 3, 8),
      DateTime(2025, 3, 24),
      DateTime(2025, 3, 25),
      DateTime(2025, 3, 26),
      DateTime(2025, 3, 27),
      DateTime(2025, 3, 28),
      DateTime(2025, 2, 17),
      DateTime(2025, 2, 18),
      DateTime(2025, 2, 19),
      DateTime(2025, 2, 20),
      DateTime(2025, 2, 21),
    ])
      DateTime(date.year, date.month, date.day):
          date.month == 3 && date.day == 8
              ? Colors.blue
              : (date.month == 3 && date.day >= 3 && date.day <= 7)
                  ? Colors.green
                  : (date.month == 3 && date.day >= 24 && date.day <= 28)
                      ? Colors.yellow
                      : Colors.pink,
  };

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text("Calendar Section"),
            pinned: true,
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.info_rounded),
              ),
            ],
          ),

          SliverToBoxAdapter(
            child: TableCalendar(
              firstDay: DateTime(2020),
              lastDay: DateTime(2030),
              focusedDay: _focusedDay,
              calendarFormat: CalendarFormat.month,
              headerVisible: true,
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
                weekendStyle: TextStyle(color: theme.colorScheme.onBackground),
                weekdayStyle: TextStyle(color: theme.colorScheme.onBackground),
              ),
              calendarBuilders: CalendarBuilders(
                defaultBuilder: (context, day, focusedDay) {
                  DateTime normalizedDay =
                      DateTime(day.year, day.month, day.day);
                  if (_highlightedDates.containsKey(normalizedDay)) {
                    Color baseColor = _highlightedDates[normalizedDay]!;

                    return AnimatedBuilder(
                      animation: _glowAnimationController,
                      builder: (context, child) {
                        double glow = _glowAnimation.value;
                        Color glowColor = baseColor.withOpacity(
                          (0.6 + (glow / 20)).clamp(0.0, 1.0),
                        );

                        return Container(
                          margin: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: baseColor,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: glowColor,
                                blurRadius: glow,
                                spreadRadius: glow / 2,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              day.day.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return null;
                },
              ),
            ),
          ),

          /// Gradient Container with Buttons
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFFFF758C),
                    Color(0xFFFF7EB3),
                    Color(0xFFFEC3A6),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      // Add action here
                    },
                    icon: const Icon(Icons.add, color: Colors.white),
                    label: const Text(
                      "Log Today's Symptoms",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black.withOpacity(0.6),
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  OutlinedButton.icon(
                    onPressed: () {
                      // Add action here
                    },
                    icon: const Icon(Icons.bar_chart, color: Colors.white),
                    label: const Text(
                      "View Cycle History",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.white, width: 2),
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Add action here
                    },
                    icon: const Icon(Icons.health_and_safety, color: Colors.white),
                    label: const Text(
                      "Get Personalized Advice",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black.withOpacity(0.6),
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
