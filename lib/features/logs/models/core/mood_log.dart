import 'package:freezed_annotation/freezed_annotation.dart';

part 'mood_log.freezed.dart';
part 'mood_log.g.dart';

@freezed
abstract class MoodLog with _$MoodLog {
  const factory MoodLog({
    required int id,
    required int user,
    int? cycle,
    required String date,
    String? mood,
  }) = _MoodLog;

  factory MoodLog.fromJson(Map<String, dynamic> json) =>
      _$MoodLogFromJson(json);
}
