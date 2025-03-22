import 'package:freezed_annotation/freezed_annotation.dart';

part 'medication_log.freezed.dart';
part 'medication_log.g.dart';

@freezed
abstract class MedicationLog with _$MedicationLog {
  const factory MedicationLog({
    required int id,
    required int user,
    int? cycle,
    required String date,
    String? medication,
  }) = _MedicationLog;

  factory MedicationLog.fromJson(Map<String, dynamic> json) => _$MedicationLogFromJson(json);
}
