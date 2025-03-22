// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blood_flow_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BloodFlowLog _$BloodFlowLogFromJson(Map<String, dynamic> json) =>
    _BloodFlowLog(
      id: (json['id'] as num).toInt(),
      user: (json['user'] as num).toInt(),
      cycle: (json['cycle'] as num?)?.toInt(),
      date: json['date'] as String,
      flow_level: json['flow_level'] as String?,
    );

Map<String, dynamic> _$BloodFlowLogToJson(_BloodFlowLog instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'cycle': instance.cycle,
      'date': instance.date,
      'flow_level': instance.flow_level,
    };
