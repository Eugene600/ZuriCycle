import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zuricycle/features/logs/models/models.dart';
import 'package:zuricycle/features/logs/repository/logs_repository.dart';

class LogsState {
  final Map<String, Set<String>> currentEntries;
  final Map<String, Set<String>> originalEntries;

  LogsState({required this.currentEntries, required this.originalEntries});

  bool get hasChanges {
    for (var category in currentEntries.keys) {
      final current = currentEntries[category] ?? {};
      final original = originalEntries[category] ?? {};

      if (current != original) {
        return true;
      }
    }
    return false;
  }

  LogsState copyWith({
    Map<String, Set<String>>? currentEntries,
    Map<String, Set<String>>? originalEntries,
  }) {
    return LogsState(
        currentEntries: currentEntries ?? this.currentEntries,
        originalEntries: originalEntries ?? this.originalEntries);
  }
}

class LogsNotifier extends StateNotifier<LogsState> {
  final LogsRepository _logsRepository;

  LogsNotifier(this._logsRepository)
      : super(LogsState(currentEntries: {}, originalEntries: {}));

  void toggleEntry(String category, String entry) {
    final currentEntries = {...state.currentEntries};
    final currentCategoryEntries = currentEntries[category] ?? {};

    currentEntries[category] = currentCategoryEntries.contains(entry)
        ? currentCategoryEntries.difference({entry})
        : {...currentCategoryEntries, entry};

    state = state.copyWith(currentEntries: currentEntries);
  }

  Future<String> submitLogs(
      List<Map<String, dynamic>> categories, String date) async {
    bool hasErrors = false;

    debugPrint("Submitting logs: Total categories - ${categories.length}");

    for (var category in categories) {
      final categoryName = category['name'];
      debugPrint("Processing category: $categoryName");

      if (!state.currentEntries.containsKey(categoryName)) {
        debugPrint("Category $categoryName not found in state. Skipping.");
        continue;
      }

      debugPrint(
          "Entries in state for $categoryName: ${state.currentEntries[categoryName]}");

      for (var entry in state.currentEntries[categoryName]!) {
        debugPrint("Processing entry: $entry");

        final entryData =
            (category['entries'] as List<Map<String, dynamic>>).firstWhere(
          (e) => e['name'] == entry,
        );

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

    if (!hasErrors) {
      state = state.copyWith(originalEntries: {...state.currentEntries});
    }

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
            .where((value) {
              return (category['entries'] as List<Map<String, dynamic>>)
                  .any((e) => e['value'] == value);
            })
            .map((value) {
              final entry = (category['entries'] as List<Map<String, dynamic>>)
                  .firstWhere(
                (e) => e['value'] == value,
              );

              return entry['name'].toString();
            })
            .toSet();

        newState[categoryName] = selectedEntries;
      });
    }

    state = LogsState(currentEntries: newState, originalEntries: {...newState});
  }

  void resetState() {
    state = LogsState(currentEntries: {}, originalEntries: {});
  }
}
