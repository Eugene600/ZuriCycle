import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zuricycle/features/logs/models/models.dart';
import 'package:zuricycle/features/logs/repository/logs_repository.dart';

class LogsNotifier extends StateNotifier<Map<String, Set<String>>> {
  final LogsRepository _logsRepository;

  LogsNotifier(this._logsRepository) : super({});

  void toggleEntry(String category, String entry) {
    final currentEntries = state[category] ?? {};

    state = {
      ...state,
      category: currentEntries.contains(entry)
          ? currentEntries.difference({entry})
          : {...currentEntries, entry}
    };
  }

  Future<String> submitLogs(
      List<Map<String, dynamic>> categories, String date) async {
    bool hasErrors = false;

    debugPrint("Submitting logs: Total categories - ${categories.length}");

    for (var category in categories) {
      final categoryName = category['name'];
      debugPrint("Processing category: $categoryName");

      if (!state.containsKey(categoryName)) {
        debugPrint("Category $categoryName not found in state. Skipping.");
        continue;
      }

      debugPrint("Entries in state for $categoryName: ${state[categoryName]}");

      for (var entry in state[categoryName]!) {
        debugPrint("Processing entry: $entry");

        final entryData =
            (category['entries'] as List<Map<String, dynamic>>).firstWhere(
          (e) => e['name'] == entry,
          // orElse: () => <String, dynamic>{},
        );

        // if (entryData.isEmpty) {
        //   debugPrint("No entry data found for $entry. Skipping.");
        //   continue;
        // }

        final value = entryData['value'];
        debugPrint("Entry value: $value");

        final result = await _logsRepository.addLog(
            date: date,
            title: category['title'],
            categoryRequest: category['request'],
            value: value,
            model: category['model']);

        result.fold((error) => hasErrors = true, (log) => hasErrors = false);
      }
    }

    state = {};

    return hasErrors
        ? "Log failed, Please try again"
        : "Logged changes successfully";
  }

  Future<void> getLogs(
      List<Map<String, dynamic>> categories, String date) async {
    debugPrint("Loading logs for date: $date");

    Map<String, Set<String>> newState = {};

    for (var category in categories) {
      final categoryName = category['name'];
      debugPrint("Fetching logs for: $categoryName");

      final result = await _logsRepository.fetchLogs(
          title: category['title'], model: category['model'], date: date);

      result.fold((error) {
        debugPrint("Failed to fetch logs for $categoryName: $error");

        newState[categoryName] = {};
      }, (logs) {
        debugPrint("Fetched logs for $categoryName: $logs");

        final selectedEntries = logs
            .map((log) {
              switch (categoryName) {
                case 'Sexual Intercourse':
                  return (log as SexualIntercourseLog).protection_used;
                case 'Mood':
                  return (log as MoodLog).mood;
                case 'Blood Flow':
                  return (log as BloodFlowLog).flow_level;
                case 'Medication':
                  return (log as MedicationLog).medication;
                case 'Symptoms':
                  return (log as SymptomLog).symptom;
                default:
                  null;
              }
            })
            .whereType<String>()
            .toSet();

        newState[categoryName] = selectedEntries;
      });
    }

    state = newState;
  }
}
