// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mood_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MoodLog _$MoodLogFromJson(Map<String, dynamic> json) => _MoodLog(
      id: (json['id'] as num).toInt(),
      user: (json['user'] as num).toInt(),
      cycle: (json['cycle'] as num?)?.toInt(),
      date: json['date'] as String,
      mood: json['mood'] as String?,
    );

Map<String, dynamic> _$MoodLogToJson(_MoodLog instance) => <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'cycle': instance.cycle,
      'date': instance.date,
      'mood': instance.mood,
    };
