import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:zuricycle/utils/utils.dart';

final selectedEntriesProvider =
    StateProvider<Map<String, Set<String>>>((ref) => {});

class LogsScreen extends ConsumerStatefulWidget {
  const LogsScreen({super.key});

  @override
  ConsumerState<LogsScreen> createState() => _LogsScreenState();
}

class _LogsScreenState extends ConsumerState<LogsScreen> {
  DateTime selectedDate = DateTime.now();
  late ScrollController _scrollController;
  bool isAtBottom = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_checkScrollPosition);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _checkScrollPosition() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 50) {
      // User has scrolled to the bottom
      setState(() {
        isAtBottom = true;
      });
    } else {
      setState(() {
        isAtBottom = false;
      });
    }
  }

  void updateDate(int days) {
    setState(() {
      DateTime newDate = selectedDate.add(Duration(days: days));
      if (newDate.isAfter(DateTime.now())) {
        return;
      }
      selectedDate = newDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    String formattedDate = DateFormat('EEEE, MMM d').format(selectedDate);

    final selectedEntries = ref.watch(selectedEntriesProvider);

    bool hasSelectedEntries =
        selectedEntries.values.any((entries) => entries.isNotEmpty);

    final List<Map<String, dynamic>> categories = [
      {
        "name": "Sexual Intercourse",
        "entries": [
          {"name": "Protected", "icon": Icons.security},
          {"name": "Unprotected", "icon": Icons.report_problem},
        ],
      },
      {
        "name": "Mood",
        "entries": [
          {"name": "Happy", "icon": Icons.emoji_emotions},
          {"name": "Energized", "icon": Icons.bolt},
          {"name": "Confident", "icon": Icons.emoji_events},
          {"name": "Optimistic", "icon": Icons.wb_sunny},
          {"name": "Relaxed", "icon": Icons.airline_seat_recline_extra},
          {"name": "Focused", "icon": Icons.center_focus_strong},
          {"name": "Sociable", "icon": Icons.handshake},
          {"name": "Irritable", "icon": Icons.sentiment_very_dissatisfied},
          {"name": "Anxious", "icon": Icons.psychology},
          {"name": "Sad", "icon": Icons.sentiment_dissatisfied},
          {"name": "Depressed", "icon": Icons.cloud},
          {"name": "Fatigued", "icon": Icons.nights_stay},
          {"name": "Stressed", "icon": Icons.speed},
          {"name": "Restless", "icon": Icons.snooze},
        ],
      },
      {
        "name": "Blood Flow",
        "entries": [
          {"name": "None", "icon": Icons.not_interested},
          {"name": "Light", "icon": Icons.invert_colors},
          {"name": "Spotting", "icon": Icons.brightness_medium},
          {"name": "Medium", "icon": Icons.invert_colors_off},
          {"name": "Heavy", "icon": Icons.local_fire_department},
          {"name": "Very Heavy", "icon": Icons.priority_high},
        ],
      },
      {
        "name": "Medication",
        "entries": [
          {"name": "Painkillers", "icon": Icons.medication},
          {"name": "Antibiotics", "icon": Icons.vaccines},
          {"name": "Birth Control", "icon": Icons.medication_liquid},
        ],
      },
      {
        "name": "Symptoms",
        "entries": [
          {"name": "Cramps", "icon": Icons.female},
          {"name": "Low Energy", "icon": Icons.battery_2_bar},
          {"name": "Mood Swings", "icon": Icons.compare_arrows},
          {"name": "Increased Energy", "icon": Icons.local_fire_department},
          {"name": "Clearer Skin", "icon": Icons.face_retouching_natural},
          {"name": "Clear Cervical Mucus", "icon": Icons.opacity},
          {"name": "Egg White Cervical Mucus", "icon": Icons.egg_alt},
          {"name": "Increased Libido", "icon": Icons.favorite_border},
          {"name": "BBT Rise", "icon": Icons.thermostat_auto},
          {"name": "Cravings", "icon": Icons.cookie},
          {"name": "Bloating", "icon": Icons.circle},
          {"name": "Acne", "icon": Icons.sick},
        ],
      }
    ];

    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                leading: IconButton(
                    onPressed: () {
                      context.pop(RouteNames.CALENDAR_SCREEN);
                    },
                    icon: Icon(Icons.arrow_back)),
                title: const Text("📝 Logs Screen"),
                pinned: true,
                floating: true,
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          hintText: "Search Categories...",
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () => updateDate(-1),
                              icon: Icon(Icons.arrow_back)),
                          Text(formattedDate,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          if (selectedDate.isBefore(DateTime.now()))
                            IconButton(
                                onPressed: selectedDate.isBefore(DateTime.now())
                                    ? () => updateDate(1)
                                    : null,
                                icon: Icon(Icons.arrow_forward)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final category = categories[index];
                  final selectedEntries = ref.watch(selectedEntriesProvider);
                  final selectedCategoryEntries =
                      selectedEntries[category["name"]] ?? {};
                  return Card(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                category["name"],
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: theme.colorScheme.onSurface),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 4.5,
                              crossAxisSpacing: 7,
                              mainAxisSpacing: 7,
                            ),
                            itemCount: category["entries"].length,
                            itemBuilder: (context, entryIndex) {
                              final entry = category["entries"][entryIndex];
                              final isSelected = selectedCategoryEntries
                                  .contains(entry["name"]);

                              return OutlinedButton.icon(
                                onPressed: () {
                                  ref
                                      .read(selectedEntriesProvider.notifier)
                                      .state = {
                                    ...selectedEntries,
                                    category["name"]: isSelected
                                        ? selectedCategoryEntries
                                            .difference({entry["name"]})
                                        : {
                                            ...selectedCategoryEntries,
                                            entry["name"]
                                          },
                                  };
                                },
                                icon: Icon(
                                  entry["icon"],
                                  size: 18,
                                  color: isSelected
                                      ? Colors.white
                                      : theme.colorScheme.primary,
                                ),
                                label: Text(entry["name"]),
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: isSelected
                                      ? theme.colorScheme.primary
                                      : null,
                                  foregroundColor: isSelected
                                      ? Colors.white
                                      : theme.colorScheme.primary,
                                  side: BorderSide(
                                      color: theme.colorScheme.primary),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 10),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                }, childCount: categories.length),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: hasSelectedEntries ? 60 : 0,
                ),
              ),
            ],
          ),
          if (hasSelectedEntries)
            AnimatedPositioned(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeOut,
              bottom: isAtBottom ? 0 : 20,
              left: 20,
              right: 20,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primaryContainer,
                    foregroundColor: theme.colorScheme.onPrimaryContainer,
                    fixedSize: Size(40, 40)),
                onPressed: () {
                  // Handle apply action here
                },
                child: Text("Apply"),
              ),
            ),
        ],
      ),
    );
  }
}
