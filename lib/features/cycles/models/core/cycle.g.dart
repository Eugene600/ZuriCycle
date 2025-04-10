// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cycle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Cycle _$CycleFromJson(Map<String, dynamic> json) => _Cycle(
      id: (json['id'] as num?)?.toInt(),
      period_start: json['period_start'] as String,
      period_end: json['period_end'] as String,
      fertile_start: json['fertile_start'] as String,
      fertile_end: json['fertile_end'] as String,
      ovulation: json['ovulation'] as String,
      predicted_period_start: json['predicted_period_start'] as String,
      predicted_period_end: json['predicted_period_end'] as String,
      created_at: json['created_at'] as String?,
      edited_at: json['edited_at'] as String?,
    );

Map<String, dynamic> _$CycleToJson(_Cycle instance) => <String, dynamic>{
      'id': instance.id,
      'period_start': instance.period_start,
      'period_end': instance.period_end,
      'fertile_start': instance.fertile_start,
      'fertile_end': instance.fertile_end,
      'ovulation': instance.ovulation,
      'predicted_period_start': instance.predicted_period_start,
      'predicted_period_end': instance.predicted_period_end,
      'created_at': instance.created_at,
      'edited_at': instance.edited_at,
    };
