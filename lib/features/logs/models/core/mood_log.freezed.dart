// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mood_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MoodLog {
  int get id;
  int get user;
  int? get cycle;
  String get date;
  String? get mood;

  /// Create a copy of MoodLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MoodLogCopyWith<MoodLog> get copyWith =>
      _$MoodLogCopyWithImpl<MoodLog>(this as MoodLog, _$identity);

  /// Serializes this MoodLog to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MoodLog &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.cycle, cycle) || other.cycle == cycle) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.mood, mood) || other.mood == mood));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, user, cycle, date, mood);

  @override
  String toString() {
    return 'MoodLog(id: $id, user: $user, cycle: $cycle, date: $date, mood: $mood)';
  }
}

/// @nodoc
abstract mixin class $MoodLogCopyWith<$Res> {
  factory $MoodLogCopyWith(MoodLog value, $Res Function(MoodLog) _then) =
      _$MoodLogCopyWithImpl;
  @useResult
  $Res call({int id, int user, int? cycle, String date, String? mood});
}

/// @nodoc
class _$MoodLogCopyWithImpl<$Res> implements $MoodLogCopyWith<$Res> {
  _$MoodLogCopyWithImpl(this._self, this._then);

  final MoodLog _self;
  final $Res Function(MoodLog) _then;

  /// Create a copy of MoodLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user = null,
    Object? cycle = freezed,
    Object? date = null,
    Object? mood = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as int,
      cycle: freezed == cycle
          ? _self.cycle
          : cycle // ignore: cast_nullable_to_non_nullable
              as int?,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      mood: freezed == mood
          ? _self.mood
          : mood // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _MoodLog implements MoodLog {
  const _MoodLog(
      {required this.id,
      required this.user,
      this.cycle,
      required this.date,
      this.mood});
  factory _MoodLog.fromJson(Map<String, dynamic> json) =>
      _$MoodLogFromJson(json);

  @override
  final int id;
  @override
  final int user;
  @override
  final int? cycle;
  @override
  final String date;
  @override
  final String? mood;

  /// Create a copy of MoodLog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MoodLogCopyWith<_MoodLog> get copyWith =>
      __$MoodLogCopyWithImpl<_MoodLog>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MoodLogToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MoodLog &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.cycle, cycle) || other.cycle == cycle) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.mood, mood) || other.mood == mood));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, user, cycle, date, mood);

  @override
  String toString() {
    return 'MoodLog(id: $id, user: $user, cycle: $cycle, date: $date, mood: $mood)';
  }
}

/// @nodoc
abstract mixin class _$MoodLogCopyWith<$Res> implements $MoodLogCopyWith<$Res> {
  factory _$MoodLogCopyWith(_MoodLog value, $Res Function(_MoodLog) _then) =
      __$MoodLogCopyWithImpl;
  @override
  @useResult
  $Res call({int id, int user, int? cycle, String date, String? mood});
}

/// @nodoc
class __$MoodLogCopyWithImpl<$Res> implements _$MoodLogCopyWith<$Res> {
  __$MoodLogCopyWithImpl(this._self, this._then);

  final _MoodLog _self;
  final $Res Function(_MoodLog) _then;

  /// Create a copy of MoodLog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? user = null,
    Object? cycle = freezed,
    Object? date = null,
    Object? mood = freezed,
  }) {
    return _then(_MoodLog(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as int,
      cycle: freezed == cycle
          ? _self.cycle
          : cycle // ignore: cast_nullable_to_non_nullable
              as int?,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      mood: freezed == mood
          ? _self.mood
          : mood // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
