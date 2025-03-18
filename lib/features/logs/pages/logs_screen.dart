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

    final List<Map<String, dynamic>> categories = [
      {
        "name": "Sexual Intercourse",
        "entries": [
          {"name": "Protected", "icon": Icons.shield},
          {"name": "Unprotected", "icon": Icons.warning},
        ],
      },
      {
        "name": "Mood",
        "entries": [
          {"name": "Happy", "icon": Icons.sentiment_satisfied},
          {"name": "Energized", "icon": Icons.flash_on},
          {"name": "Confident", "icon": Icons.thumb_up},
          {"name": "Optimistic", "icon": Icons.wb_sunny},
          {"name": "Relaxed", "icon": Icons.self_improvement},
          {"name": "Focused", "icon": Icons.track_changes},
          {"name": "Sociable", "icon": Icons.group},
          {"name": "Irritable", "icon": Icons.sentiment_very_dissatisfied},
          {"name": "Anxious", "icon": Icons.error_outline},
          {"name": "Sad", "icon": Icons.sentiment_dissatisfied},
          {"name": "Depressed", "icon": Icons.mood_bad},
          {"name": "Fatigued", "icon": Icons.bedtime},
          {"name": "Stressed", "icon": Icons.warning},
          {"name": "Restless", "icon": Icons.sync_problem},
        ],
      },
      {
        "name": "Blood Flow",
        "entries": [
          {"name": "None", "icon": Icons.not_interested},
          {"name": "Light", "icon": Icons.water_drop},
          {"name": "Spotting", "icon": Icons.brightness_1},
          {"name": "Medium", "icon": Icons.opacity},
          {"name": "Heavy", "icon": Icons.local_fire_department},
          {"name": "Very Heavy", "icon": Icons.warning},
        ],
      },
      {
        "name": "Medication",
        "entries": [
          {"name": "Painkillers", "icon": Icons.medical_services},
          {"name": "Antibiotics", "icon": Icons.healing},
          {"name": "Birth Control", "icon": Icons.pregnant_woman},
        ],
      },
      {
        "name": "Symptoms",
        "entries": [
          {"name": "Cramps", "icon": Icons.spa},
          {"name": "Low Energy", "icon": Icons.battery_alert},
          {"name": "Mood Swings", "icon": Icons.swap_horiz},
          {"name": "Increased Energy", "icon": Icons.flash_on},
          {"name": "Clearer Skin", "icon": Icons.face},
          {"name": "Clear Cervical Mucus", "icon": Icons.water_drop},
          {"name": "Egg White Cervical Mucus", "icon": Icons.egg},
          {"name": "Increased Libido", "icon": Icons.favorite},
          {"name": "BBT Rise", "icon": Icons.thermostat},
          {"name": "Cravings", "icon": Icons.fastfood},
          {"name": "Bloating", "icon": Icons.air},
          {"name": "Acne", "icon": Icons.warning},
        ],
      },
    ];

    return Scaffold(
      body: CustomScrollView(
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
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
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
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
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
                          crossAxisCount: 2, // 2 items per row
                          childAspectRatio: 4.5, // Adjust for compactness
                          crossAxisSpacing: 7, // Reduce horizontal spacing
                          mainAxisSpacing: 7, // Reduce vertical spacing
                        ),
                        itemCount: category["entries"].length,
                        itemBuilder: (context, entryIndex) {
                          final entry = category["entries"][entryIndex];
                          final isSelected =
                              selectedCategoryEntries.contains(entry["name"]);

                          return OutlinedButton.icon(
                            onPressed: () {
                              ref.read(selectedEntriesProvider.notifier).state =
                                  {
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
                              backgroundColor:
                                  isSelected ? theme.colorScheme.primary : null,
                              foregroundColor: isSelected
                                  ? Colors.white
                                  : theme.colorScheme.primary,
                              side:
                                  BorderSide(color: theme.colorScheme.primary),
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
        ],
      ),
    );
  }
}
