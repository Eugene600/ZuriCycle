import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:zuricycle/utils/utils.dart';

import '../models/models.dart';

final selectedEntriesProvider =
    StateProvider<Map<String, Set<String>>>((ref) => {});

final searchQueryProvider = StateProvider<String>((ref) => '');

class LogsScreen extends ConsumerStatefulWidget {
  const LogsScreen({super.key});

  @override
  ConsumerState<LogsScreen> createState() => _LogsScreenState();
}

class _LogsScreenState extends ConsumerState<LogsScreen> {
  DateTime selectedDate = DateTime.now();
  late ScrollController _scrollController;
  bool isAtBottom = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_checkScrollPosition);

    _searchController.addListener(() {
      ref.read(searchQueryProvider.notifier).state = _searchController.text;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
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

  List<Map<String, dynamic>> getFilteredCategories(
      List<Map<String, dynamic>> categories, String query) {
    if (query.isEmpty) {
      return categories;
    }

    final lowerCaseQuery = query.toLowerCase();

    return categories.map((category) {
      final categoryName = category['name'].toString().toLowerCase();
      final bool categoryMatches = categoryName.contains(lowerCaseQuery);

      final Map<String, dynamic> filteredCategory = {
        ...category
      }; //created a copy of the category

      if (categoryMatches) {
        return filteredCategory;
      } else {
        final List<Map<String, dynamic>> filteredEntries = (category['entries']
                as List<Map<String, dynamic>>)
            .where((entry) =>
                entry['name'].toString().toLowerCase().contains(lowerCaseQuery))
            .toList();

        filteredCategory['entries'] = filteredEntries;

        return filteredCategory;
      }
    }).where((category) {
      final categoryName = category['name'].toString().toLowerCase();
      final bool categoryMatches = categoryName.contains(lowerCaseQuery);
      final bool hasMatchingEntries = (category['entries'] as List).isNotEmpty;

      return categoryMatches || hasMatchingEntries;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    String formattedDate = DateFormat('EEEE, MMM d').format(selectedDate);

    final selectedEntries = ref.watch(selectedEntriesProvider);

    final searchQuery = ref.watch(searchQueryProvider);

    bool hasSelectedEntries =
        selectedEntries.values.any((entries) => entries.isNotEmpty);

    final List<Map<String, dynamic>> categories = [
      {
        "name": "Sexual Intercourse",
        "title": "sexual-intercourse",
        "request": "protection_used",
        "model": SexualIntercourseLog.fromJson,
        "entries": [
          {"name": "Protected", "icon": Icons.security, "value": "protected"},
          {
            "name": "Unprotected",
            "icon": Icons.report_problem,
            "value": "unprotected"
          },
        ],
      },
      {
        "name": "Mood",
        "title": "mood",
        "request": "mood",
        "model": MoodLog.fromJson,
        "entries": [
          {"name": "Happy", "icon": Icons.emoji_emotions, "value": "happy"},
          {"name": "Energized", "icon": Icons.bolt, "value": "energized"},
          {
            "name": "Confident",
            "icon": Icons.emoji_events,
            "value": "confident"
          },
          {"name": "Optimistic", "icon": Icons.wb_sunny, "value": "optimistic"},
          {
            "name": "Relaxed",
            "icon": Icons.airline_seat_recline_extra,
            "value": "relaxed"
          },
          {
            "name": "Focused",
            "icon": Icons.center_focus_strong,
            "value": "focused"
          },
          {"name": "Sociable", "icon": Icons.handshake, "value": "sociable"},
          {
            "name": "Irritable",
            "icon": Icons.sentiment_very_dissatisfied,
            "value": "irritable"
          },
          {"name": "Anxious", "icon": Icons.psychology, "value": "anxious"},
          {"name": "Sad", "icon": Icons.sentiment_dissatisfied, "value": "sad"},
          {"name": "Depressed", "icon": Icons.cloud, "value": "depressed"},
          {"name": "Fatigued", "icon": Icons.nights_stay, "value": "fatigued"},
          {"name": "Stressed", "icon": Icons.speed, "value": "stressed"},
          {"name": "Restless", "icon": Icons.snooze, "value": "restless"},
        ],
      },
      {
        "name": "Blood Flow",
        "title": "blood-flow",
        "request": "flow_level",
        "model": BloodFlowLog.fromJson,
        "entries": [
          {"name": "None", "icon": Icons.not_interested, "value": "none"},
          {"name": "Light", "icon": Icons.invert_colors, "value": "light"},
          {
            "name": "Spotting",
            "icon": Icons.brightness_medium,
            "value": "spotting"
          },
          {
            "name": "Medium",
            "icon": Icons.invert_colors_off,
            "value": "medium"
          },
          {
            "name": "Heavy",
            "icon": Icons.local_fire_department,
            "value": "heavy"
          },
          {
            "name": "Very Heavy",
            "icon": Icons.priority_high,
            "value": "very_heavy"
          },
        ],
      },
      {
        "name": "Medication",
        "title": "medication",
        "request": "medication",
        "model": MedicationLog.fromJson,
        "entries": [
          {
            "name": "Birth Control Pills",
            "icon": Icons.medication,
            "value": "birth_control"
          },
          {
            "name": "Depo-Provera Shot",
            "icon": Icons.vaccines,
            "value": "depo_shot"
          },
          {
            "name": "Hormone Therapy",
            "icon": Icons.medication_liquid,
            "value": "hormone_therapy"
          },
          {
            "name": "Fertility Drugs",
            "icon": Icons.local_pharmacy,
            "value": "fertility_drugs"
          },
          {
            "name": "Pain Relief (e.g., Ibuprofen)",
            "icon": Icons.healing,
            "value": "pain_relief"
          },
          {
            "name": "PCOS Medication",
            "icon": Icons.spa,
            "value": "pcos_medication"
          },
          {
            "name": "Thyroid Medication",
            "icon": Icons.health_and_safety,
            "value": "thyroid_medication"
          },
          {
            "name": "Antidepressants",
            "icon": Icons.sentiment_satisfied,
            "value": "antidepressants"
          },
          {
            "name": "Antibiotics",
            "icon": Icons.medical_services,
            "value": "antibiotics"
          },
        ],
      },
      {
        "name": "Symptoms",
        "title": "symptom",
        "request": "symptom",
        "model": SymptomLog.fromJson,
        "entries": [
          {"name": "Cramps", "icon": Icons.female, "value": "cramps"},
          {
            "name": "Low Energy",
            "icon": Icons.battery_2_bar,
            "value": "low_energy"
          },
          {
            "name": "Mood Swings",
            "icon": Icons.compare_arrows,
            "value": "mood_swings"
          },
          {
            "name": "Increased Energy",
            "icon": Icons.local_fire_department,
            "value": "increased_energy"
          },
          {
            "name": "Clearer Skin",
            "icon": Icons.face_retouching_natural,
            "value": "clearer_skin"
          },
          {
            "name": "Clear Cervical Mucus",
            "icon": Icons.opacity,
            "value": "clear_cervical_mucus"
          },
          {
            "name": "Egg White Cervical Mucus",
            "icon": Icons.egg_alt,
            "value": "egg_white_cervical_mucus"
          },
          {
            "name": "Increased Libido",
            "icon": Icons.favorite_border,
            "value": "increased_libido"
          },
          {
            "name": "BBT Rise",
            "icon": Icons.thermostat_auto,
            "value": "bbt_rise"
          },
          {"name": "Cravings", "icon": Icons.cookie, "value": "cravings"},
          {"name": "Bloating", "icon": Icons.circle, "value": "bloating"},
          {"name": "Acne", "icon": Icons.sick, "value": "acne"},
        ],
      },
    ];

    final filteredCategories = getFilteredCategories(categories, searchQuery);

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
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: "Search Categories...",
                          prefixIcon: Icon(Icons.search),
                          suffixIcon: searchQuery.isNotEmpty
                              ? IconButton(
                                  onPressed: () {
                                    _searchController.clear();
                                  },
                                  icon: Icon(Icons.clear))
                              : null,
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
                          IconButton(
                              onPressed: () => updateDate(1),
                              icon: Icon(Icons.arrow_forward)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final category = filteredCategories[index];
                  final selectedEntries = ref.watch(selectedEntriesProvider);
                  final selectedCategoryEntries =
                      selectedEntries[category["name"]] ?? {};

                  if ((category['entries'] as List).isEmpty) {
                    return SizedBox.shrink();
                  }

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
                }, childCount: filteredCategories.length),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: hasSelectedEntries ? 60 : 0,
                ),
              ),
            ],
          ),
          if (filteredCategories.isEmpty)
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.search_off,
                    size: 64,
                    color: Colors.grey[400],
                  ),
                  SizedBox(height: 16),
                  Text(
                    "No matches found",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Try a different search term",
                    style: TextStyle(
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
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
