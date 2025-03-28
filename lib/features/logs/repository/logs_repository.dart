import 'package:either_dart/either.dart';

import '../models/models.dart';


class LogsRepository {
  final LogsService _logsService;

  LogsRepository(this._logsService);

  Future<Either<String, T>> addLog<T>({
    required String date,
    int? cycle,
    required String title,
    required String categoryRequest,
    required String value,
    required T Function(Map<String, dynamic>) model,
  }) async {
    return await _logsService.addLog(
      date: date,
      cycle: cycle,
      title: title,
      categoryRequest: categoryRequest,
      value: value,
      model: model,
    );
  }

  Future<Either<String, List<T>>> fetchLogs<T>({
    required String title,
    required T Function(Map<String, dynamic>) model,
    required String date,
  }) async {
    return await _logsService.fetchLogs(title, model, date);
  }

  Future<Either<String, T>> updateLog<T>({
    required int logId,
    String? date,
    String? value,
    int? cycle,
    required String title,
    required String categoryRequest,
    required T Function(Map<String, dynamic>) model,
  }) async {
    return await _logsService.updateLog(
      logId: logId,
      date: date,
      value: value,
      cycle: cycle,
      title: title,
      categoryRequest: categoryRequest,
      model: model,
    );
  }

  Future<Either<String, String>> deleteLog({
    required int logId,
    required String title,
  }) async {
    return await _logsService.deleteLog(logId, title);
  }
}
