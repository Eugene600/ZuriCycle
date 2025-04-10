import 'package:freezed_annotation/freezed_annotation.dart';
part 'cycle.freezed.dart';
part 'cycle.g.dart';

@freezed
abstract class Cycle with _$Cycle {
  const factory Cycle({
    int? id,
    required String period_start,
    required String period_end,
    required String fertile_start,
    required String fertile_end,
    required String ovulation,
    required String predicted_period_start,
    required String predicted_period_end,
    String? created_at,
    String? edited_at, 
  }) = _Cycle;

  factory Cycle.fromJson(Map<String, Object?> json) => _$CycleFromJson(json);
}