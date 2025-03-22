import 'package:freezed_annotation/freezed_annotation.dart';

part 'sexual_intercourse_log.freezed.dart';
part 'sexual_intercourse_log.g.dart';

@freezed
abstract class SexualIntercourseLog with _$SexualIntercourseLog {
  const factory SexualIntercourseLog({
    required int id,
    required int user,
    int? cycle,
    required String date,
    String? protection_used,
  }) = _SexualIntercourseLog;

  factory SexualIntercourseLog.fromJson(Map<String, dynamic> json) =>
      _$SexualIntercourseLogFromJson(json);
}
