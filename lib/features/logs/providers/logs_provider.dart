import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zuricycle/features/logs/controllers/logs_notifier.dart';
import 'package:zuricycle/features/logs/models/models.dart';
import 'package:zuricycle/features/logs/repository/logs_repository.dart';

final logsRepositoryProvider = Provider<LogsRepository>((ref) {
  final service = LogsService();
  return LogsRepository(service);
});

final logsNotifierProvider =
    StateNotifierProvider<LogsNotifier, LogsState>(
  (ref) => LogsNotifier(ref.watch(logsRepositoryProvider)),
);
