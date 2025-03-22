// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medication_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MedicationLog _$MedicationLogFromJson(Map<String, dynamic> json) =>
    _MedicationLog(
      id: (json['id'] as num).toInt(),
      user: (json['user'] as num).toInt(),
      cycle: (json['cycle'] as num?)?.toInt(),
      date: json['date'] as String,
      medication: json['medication'] as String?,
    );

Map<String, dynamic> _$MedicationLogToJson(_MedicationLog instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'cycle': instance.cycle,
      'date': instance.date,
      'medication': instance.medication,
    };
