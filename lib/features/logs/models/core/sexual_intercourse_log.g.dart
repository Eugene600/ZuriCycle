// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sexual_intercourse_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SexualIntercourseLog _$SexualIntercourseLogFromJson(
        Map<String, dynamic> json) =>
    _SexualIntercourseLog(
      id: (json['id'] as num).toInt(),
      user: (json['user'] as num).toInt(),
      cycle: (json['cycle'] as num?)?.toInt(),
      date: json['date'] as String,
      protection_used: json['protection_used'] as String?,
    );

Map<String, dynamic> _$SexualIntercourseLogToJson(
        _SexualIntercourseLog instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'cycle': instance.cycle,
      'date': instance.date,
      'protection_used': instance.protection_used,
    };
