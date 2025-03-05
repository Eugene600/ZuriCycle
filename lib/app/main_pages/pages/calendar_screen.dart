import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  final DateTime _focusedDay = DateTime.now();

  final DateTime _fertileStart = DateTime(2025, 3, 3);
  final DateTime _ovulationDay = DateTime(2025, 3, 8);
  final DateTime _fertileEnd = DateTime(2025, 3, 10);

  /// Other Highlighted Dates (Period Days)
  final Map<DateTime, Color> _highlightedDates = {
    DateTime(2025, 3, 24): Colors.pinkAccent,
    DateTime(2025, 3, 25): Colors.pinkAccent,
    DateTime(2025, 3, 26): Colors.pinkAccent,
    DateTime(2025, 3, 27): Colors.pinkAccent,
    DateTime(2025, 3, 28): Colors.pinkAccent,
    DateTime(2025, 2, 17): Colors.pinkAccent,
    DateTime(2025, 2, 18): Colors.pinkAccent,
    DateTime(2025, 2, 19): Colors.pinkAccent,
    DateTime(2025, 2, 20): Colors.pinkAccent,
    DateTime(2025, 2, 21): Colors.pinkAccent,
  };

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("📅 Calendar Section"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.info_rounded),
          ),
        ],
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime(2020),
            lastDay: DateTime(2030),
            headerStyle: const HeaderStyle(
              formatButtonVisible: false,
            ),
            focusedDay: _focusedDay,
            calendarFormat: CalendarFormat.month,
            headerVisible: true,
            calendarStyle: CalendarStyle(
              defaultDecoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              todayDecoration: const BoxDecoration(), // Removes highlight
              todayTextStyle: TextStyle(
                color: theme.colorScheme.onSurface, // Ensures today’s date remains visible
                fontWeight:
                    FontWeight.normal, // Keeps it consistent with other dates
              ),
              weekendDecoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
            ),
            calendarBuilders: CalendarBuilders(
              defaultBuilder: (context, day, focusedDay) {
                DateTime normalizedDay = DateTime(day.year, day.month, day.day);
                
                /// Check if the date is in the fertile window
                if (normalizedDay.isAfter(_fertileStart.subtract(const Duration(days: 1))) &&
                    normalizedDay.isBefore(_fertileEnd.add(const Duration(days: 1)))) {
                  
                  Color fertileColor = _getFertileGradientColor(normalizedDay);
                  
                  return _buildHighlightedDay(day, fertileColor);
                }

                /// Check for other highlighted dates (periods)
                if (_highlightedDates.containsKey(normalizedDay)) {
                  Color baseColor = _highlightedDates[normalizedDay]!;
                  return _buildHighlightedDay(day, baseColor);
                }
                return null;
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          /// Gradient Container (Expands to Fill Remaining Space)
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFFF758C),
                    Color(0xFFFF7EB3),
                    Color(0xFFFEC3A6),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      // Log today's symptoms action
                    },
                    icon: const Icon(Icons.add, color: Colors.white),
                    label: const Text(
                      "Log Today's Symptoms",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black.withValues(),
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  OutlinedButton.icon(
                    onPressed: () {
                      // View cycle history action
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
                  const SizedBox(height: 15),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Edit periods action
                    },
                    icon: const Icon(Icons.edit_calendar, color: Colors.white),
                    label: const Text(
                      "Edit Periods",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black.withValues(),
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

  /// Function to determine color intensity based on fertile day position
  Color _getFertileGradientColor(DateTime date) {
    int totalDays = _fertileEnd.difference(_fertileStart).inDays;
    int daysFromStart = date.difference(_fertileStart).inDays;
    int daysFromOvulation = date.difference(_ovulationDay).inDays.abs();

    /// Define color brightness variation
    double intensity = (daysFromStart / totalDays).clamp(0.0, 1.0);
    if (date == _ovulationDay) {
      intensity = 1.0; // Ovulation is the brightest
    } else if (date.isAfter(_ovulationDay)) {
      intensity = 1.0 - (daysFromOvulation / 2); // Gradually dim after ovulation
    }

    return Color.lerp(Colors.deepPurpleAccent.shade100, Colors.deepPurpleAccent.shade700, intensity)!;
  }

  /// Widget for highlighted days
  Widget _buildHighlightedDay(DateTime day, Color color) {
    return Container(
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
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
  }
}
