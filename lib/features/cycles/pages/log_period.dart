import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zuricycle/features/cycles/providers/cycle_provider.dart';


class LogPeriod extends ConsumerStatefulWidget {
  const LogPeriod({super.key});

  @override
  ConsumerState<LogPeriod> createState() => _LogPeriodState();
}

class _LogPeriodState extends ConsumerState<LogPeriod> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text("Enter Your Periods 🌸"),
            pinned: true,
            leading: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: Icon(Icons.arrow_back),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.85,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TableCalendar(
                      focusedDay: _focusedDay,
                      firstDay: DateTime(2020),
                      lastDay: DateTime(2030),
                      rangeStartDay: _rangeStart,
                      rangeEndDay: _rangeEnd,
                      rangeSelectionMode: RangeSelectionMode.toggledOn,
                      onRangeSelected: (start, end, focusedDay) {
                        setState(() {
                          _rangeStart = start;
                          _rangeEnd = end;
                          _focusedDay = focusedDay;
                        });
                      },
                      headerStyle: const HeaderStyle(
                        formatButtonVisible: false,
                      ),
                      calendarStyle: CalendarStyle(
                          rangeHighlightColor: theme.colorScheme.primary,
                          todayDecoration: BoxDecoration(
                            color: theme.colorScheme.primary,
                            shape: BoxShape.circle,
                          ),
                          selectedDecoration: BoxDecoration(
                            color: theme.colorScheme.primary,
                            shape: BoxShape.circle,
                          ),
                          rangeStartDecoration: BoxDecoration(
                            color: theme.colorScheme.primaryContainer,
                            shape: BoxShape.circle,
                          ),
                          rangeEndDecoration: BoxDecoration(
                            color: theme.colorScheme.primaryContainer,
                            shape: BoxShape.circle,
                          ),
                          withinRangeTextStyle:
                              TextStyle(color: theme.colorScheme.onPrimary)),
                    ),
                    FilledButton(
                        onPressed: () {
                          if (_rangeStart != null && _rangeEnd != null) {
                            ref.read(cycleNotifierProvider.notifier).postCycle(periodStart: _rangeStart!, periodEnd: _rangeEnd!);
                            context.pop();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                'Please select a range in the calendar',
                              ),
                            ));
                          }
                        },
                        child: Text("Add Periods")),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
