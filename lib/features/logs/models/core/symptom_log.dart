import 'package:freezed_annotation/freezed_annotation.dart';

part 'symptom_log.freezed.dart';
part 'symptom_log.g.dart';

@freezed
abstract class SymptomLog with _$SymptomLog {
  const factory SymptomLog({
    required int id,
    required int user,
    int? cycle,
    required String date,
    String? symptom,
  }) = _SymptomLog;

  factory SymptomLog.fromJson(Map<String, dynamic> json) => _$SymptomLogFromJson(json);
}
