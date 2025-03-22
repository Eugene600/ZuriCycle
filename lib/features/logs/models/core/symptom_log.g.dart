// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'symptom_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SymptomLog _$SymptomLogFromJson(Map<String, dynamic> json) => _SymptomLog(
      id: (json['id'] as num).toInt(),
      user: (json['user'] as num).toInt(),
      cycle: (json['cycle'] as num?)?.toInt(),
      date: json['date'] as String,
      symptom: json['symptom'] as String?,
    );

Map<String, dynamic> _$SymptomLogToJson(_SymptomLog instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'cycle': instance.cycle,
      'date': instance.date,
      'symptom': instance.symptom,
    };
