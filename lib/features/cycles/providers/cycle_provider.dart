import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zuricycle/features/cycles/controllers/cycle_notifier.dart';
import 'package:zuricycle/features/cycles/repository/cycle_repository.dart';

import '../models/models.dart';

final cycleRepositoryProvider = Provider<CycleRepository>((ref) {
  final service = CycleService();
  return CycleRepository(service);
});


final cycleNotifierProvider =
    StateNotifierProvider<CycleNotifier, Cycle?>(
  (ref) => CycleNotifier(ref.watch(cycleRepositoryProvider)),
);
