import 'package:freezed_annotation/freezed_annotation.dart';

part 'blood_flow_log.freezed.dart';
part 'blood_flow_log.g.dart';

@freezed
abstract class BloodFlowLog with _$BloodFlowLog {
  const factory BloodFlowLog({
    required int id,
    required int user,
    int? cycle,
    required String date,
    String? flow_level,
  }) = _BloodFlowLog;

  factory BloodFlowLog.fromJson(Map<String, dynamic> json) => _$BloodFlowLogFromJson(json);
}
