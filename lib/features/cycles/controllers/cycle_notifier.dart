import 'package:either_dart/either.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zuricycle/features/cycles/repository/cycle_repository.dart';
import 'package:zuricycle/local_storage/local_storage.dart';

import '../models/models.dart';

enum CycleStage { period, fertile, ovulation, afterOvulation, predicted, none }

class CycleNotifier extends StateNotifier<Cycle?> {
  final CycleRepository _repository;
  CycleNotifier(this._repository) : super(null);

  Future<Either<String, Cycle>> postCycle(
      {required DateTime periodStart, required DateTime periodEnd}) async {
    final cycle = _predictCycle(periodStart, periodEnd);
    final result = await _repository.postCycles(cycle);

    result.fold(
      (error) => null,
      (success) async {
        state = success;

        final existingCycleId = await LocalStorage.getCycleId();
        if (existingCycleId != null) {
          await LocalStorage.deleteCycleId();
        }

        if (success.id != null) {
          await LocalStorage.saveCycleId(success.id!);
        }
      },
    );

    return result;
  }

  Future<Either<String, Cycle>?> getCycle() async {
    final cycleDetails = await LocalStorage.getCycleId();

    if (cycleDetails == null) {
      state = null;
      return null;
    }

    final cycleId = cycleDetails['cycle_id'];

    if (cycleId == null) return null;

    final result = await _repository.getCycle(cycleId);

    result.fold(
      (error) => error,
      (success) => state = success,
    );

    return result;
  }

  CycleStage cycleStage() {
    if (state == null) return CycleStage.none;

    final now = DateTime.now();

    final periodStart = DateTime.parse(state!.period_start);
    final periodEnd = DateTime.parse(state!.period_end);

    final fertileStart = DateTime.parse(state!.fertile_start);
    final fertileEnd = DateTime.parse(state!.fertile_end);

    final ovulation = DateTime.parse(state!.ovulation);

    final predictedStart = DateTime.parse(state!.predicted_period_start);
    final predictedEnd = DateTime.parse(state!.predicted_period_end);

    if (_isBetween(now, periodStart, periodEnd)) {
      return CycleStage.period;
    } else if (_isBetween(now, fertileStart, fertileEnd)) {
      return CycleStage.fertile;
    } else if (_isSameDay(now, ovulation)) {
      return CycleStage.ovulation;
    } else if (_isBetween(now, predictedStart, predictedEnd)) {
      return CycleStage.predicted;
    } else if (now.isAfter(ovulation) && now.isBefore(predictedStart)) {
      return CycleStage.afterOvulation;
    } else if (now.isAfter(periodEnd) && now.isBefore(fertileStart)) {
      return CycleStage.fertile;
    } else if (now.isAfter(fertileEnd) && now.isBefore(predictedStart)) {
      return CycleStage.afterOvulation;
    }

    return CycleStage.none;
  }

  DateTime _normalize(DateTime dt) => DateTime(dt.year, dt.month, dt.day);

  bool _isBetween(DateTime check, DateTime start, DateTime end) {
    final d = _normalize(check);
    return !d.isBefore(_normalize(start)) && !d.isAfter(_normalize(end));
  }

  bool _isSameDay(DateTime a, DateTime b) {
    final da = _normalize(a);
    final db = _normalize(b);
    return da == db;
  }

  Cycle _predictCycle(DateTime periodStart, DateTime periodEnd) {
    final ovulation = periodStart.add(const Duration(days: 14));
    final fertileStart = periodStart.add(const Duration(days: 10));
    final fertileEnd = periodStart.add(const Duration(days: 15));

    final periodLength = periodEnd.difference(periodStart).inDays + 1;

    final predictedPeriodStart = periodStart.add(const Duration(days: 28));
    final predictedPeriodEnd =
        predictedPeriodStart.add(Duration(days: periodLength - 1));

    return Cycle(
        period_start: periodStart.toIso8601String().split('T').first,
        period_end: periodEnd.toIso8601String().split('T').first,
        fertile_start: fertileStart.toIso8601String().split('T').first,
        fertile_end: fertileEnd.toIso8601String().split('T').first,
        ovulation: ovulation.toIso8601String().split('T').first,
        predicted_period_start:
            predictedPeriodStart.toIso8601String().split('T').first,
        predicted_period_end:
            predictedPeriodEnd.toIso8601String().split('T').first);
  }
}
