import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zuricycle/features/logs/models/models.dart';
import 'package:zuricycle/features/logs/repository/logs_repository.dart';
import 'package:collection/collection.dart';

class LogsState {
  final Map<String, Set<String>> currentEntries;
  final Map<String, Map<String, int>> originalEntries;

  LogsState({required this.currentEntries, required this.originalEntries});

  final setEquality = const SetEquality<String>();

  bool get hasChanges {
    final allCategories = {...currentEntries.keys, ...originalEntries.keys};
    for (var category in allCategories) {
      final current = currentEntries[category] ?? {};
      final original = originalEntries[category]?.keys.toSet() ?? {};

      if (!setEquality.equals(current, original)) {
        debugPrint("Current: $current, Original: $original");
        return true;
      }
    }

    return false;
  }

  LogsState copyWith({
    Map<String, Set<String>>? currentEntries,
    Map<String, Map<String, int>>? originalEntries,
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

    Map<String, Map<String, int>> newOriginalEntries = {
      ...state.originalEntries
    };

    for (var category in categories) {
      final categoryName = category['name'];
      final categoryTitle = category['title'];
      debugPrint("Processing category: $categoryName");

      if (!state.currentEntries.containsKey(categoryName)) {
        debugPrint("Category $categoryName not found in state. Skipping.");
        continue;
      }

      final currentSet = state.currentEntries[categoryName] ?? {};
      final originalSet =
          state.originalEntries[categoryName]?.keys.toSet() ?? {};
      final newEntries = currentSet.difference(originalSet);
      final removedEntries = originalSet.difference(currentSet);

      debugPrint(
          "Entries in state  for $categoryName: ${state.currentEntries[categoryName]}");

      debugPrint(
          "Original entries for $categoryName before submitting logs: ${state.originalEntries[categoryName]?.keys}");
      debugPrint(
          "Current entries for $categoryName: before submitting logs${state.currentEntries[categoryName]}");

      for (var removedEntry in removedEntries) {
        final logId = state.originalEntries[categoryName]?[removedEntry];

        if (logId != null) {
          debugPrint("Removing unselected entry: $removedEntry in $categoryName");
          await deleteLogs(logId, categoryTitle, categoryName, removedEntry);
        }
      }    

      for (var entry in newEntries) {
        debugPrint("Processing entry: $entry");

        final entryData = (category['entries'] as List<Map<String, dynamic>>)
            .firstWhere((e) => e['name'] == entry,
                orElse: () => <String, Object>{});

        final value = entryData['value'];
        debugPrint("Entry value: $value");

        final result = await _logsRepository.addLog(
            date: date,
            title: categoryTitle,
            categoryRequest: category['request'],
            value: value,
            model: category['model']);

        result.fold((error) {
          hasErrors = true;
        }, (log) {
          int? logId;
          switch (categoryName) {
            case 'Sexual Intercourse':
              logId = (log as SexualIntercourseLog).id;
              break;
            case 'Mood':
              logId = (log as MoodLog).id;
              break;
            case 'Blood Flow':
              logId = (log as BloodFlowLog).id;
              break;
            case 'Medication':
              logId = (log as MedicationLog).id;
              break;
            case 'Symptoms':
              logId = (log as SymptomLog).id;
              break;
            default:
              logId = null;
              break;
          }

          final entryName = entryData['name'];

          if (logId != null) {
            newOriginalEntries[categoryName] ??= {};
            newOriginalEntries[categoryName]![entryName] = logId;
          }
        });
      }
    }

    if (!hasErrors) {
      state = state.copyWith(originalEntries: {...newOriginalEntries});
    }

    debugPrint(
        "Original entries after submitting logs: ${state.originalEntries}");
    debugPrint("Current entries after submitting logs${state.currentEntries}");

    return hasErrors
        ? "Log failed, Please try again"
        : "Logged changes successfully";
  }

  Future<void> getLogs(
      List<Map<String, dynamic>> categories, String date) async {
    debugPrint("Loading logs for date: $date");

    Map<String, Set<String>> newCurrentEntries = {};
    Map<String, Map<String, int>> newOriginalEntries = {};

    for (var category in categories) {
      final categoryName = category['name'];
      debugPrint("Fetching logs for: $categoryName");

      final result = await _logsRepository.fetchLogs(
          title: category['title'], model: category['model'], date: date);

      result.fold((error) {
        debugPrint("Failed to fetch logs for $categoryName: $error");

        newCurrentEntries[categoryName] = {};
        newOriginalEntries[categoryName] = {};
      }, (logs) {
        debugPrint("Fetched logs for $categoryName: $logs");

        for (var log in logs) {
          String? valueKey;
          int? logId;

          switch (categoryName) {
            case 'Sexual Intercourse':
              valueKey = (log as SexualIntercourseLog).protection_used;
              logId = log.id;
              break;
            case 'Mood':
              valueKey = (log as MoodLog).mood;
              logId = log.id;
              break;
            case 'Blood Flow':
              valueKey = (log as BloodFlowLog).flow_level;
              logId = log.id;
              break;
            case 'Medication':
              valueKey = (log as MedicationLog).medication;
              logId = log.id;
              break;
            case 'Symptoms':
              valueKey = (log as SymptomLog).symptom;
              logId = log.id;
              break;
            default:
              valueKey = null;
              logId = null;
              break;
          }

          if (valueKey != null && logId != null) {
            final entry = (category['entries'] as List<Map<String, dynamic>>)
                .firstWhere((e) => e['value'] == valueKey,
                    orElse: () => <String, Object>{});

            final displayName = entry['name'].toString();
            debugPrint("Display name is $displayName");

            if (entry.isEmpty) {
              debugPrint("Warning: No matching entry found for $displayName");
              continue;
            }

            // newCurrentEntries.putIfAbsent(categoryName, () => {});
            // newOriginalEntries.putIfAbsent(categoryName, () => {});

            newCurrentEntries[categoryName] ??= {};
            newOriginalEntries[categoryName] ??= {};

            if (!newOriginalEntries[categoryName]!.containsKey(displayName)) {
              newCurrentEntries[categoryName]!.add(displayName);
            }

            newOriginalEntries[categoryName]![displayName] = logId;
            debugPrint(
                "New Current Entries: $newCurrentEntries, New Original Entries: $newOriginalEntries");
          }
        }
      });
    }
    state = LogsState(
        currentEntries: newCurrentEntries, originalEntries: newOriginalEntries);
  }

  Future<void> deleteLogs(int logId, String title, String category, String entry) async{

    final result = await _logsRepository.deleteLog(logId: logId, title: title);
    result.fold(
      (error) {
        debugPrint("Failed to delete log for $entry in $category: $error");
      },
      (logs) {
        final updatedOriginalEntries = {...state.originalEntries};
        
        if (updatedOriginalEntries.containsKey(category)) {
          updatedOriginalEntries[category]?.remove(entry);
        }

        //if the inner map becomes empty remove the category entirely
        //eg if 'Moods": {} then just remove Moods entirely
        if (updatedOriginalEntries[category]!.isEmpty) {
          updatedOriginalEntries.remove(category);
        }

        state = state.copyWith(originalEntries: updatedOriginalEntries);
        debugPrint("Deleted log for $entry in $category. Updated entries: ${state.originalEntries}");
      }
      );
  }

  void resetState() {
    state = LogsState(currentEntries: {}, originalEntries: {});
  }
}
