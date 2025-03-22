// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'symptom_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SymptomLog {
  int get id;
  int get user;
  int? get cycle;
  String get date;
  String? get symptom;

  /// Create a copy of SymptomLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SymptomLogCopyWith<SymptomLog> get copyWith =>
      _$SymptomLogCopyWithImpl<SymptomLog>(this as SymptomLog, _$identity);

  /// Serializes this SymptomLog to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SymptomLog &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.cycle, cycle) || other.cycle == cycle) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.symptom, symptom) || other.symptom == symptom));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, user, cycle, date, symptom);

  @override
  String toString() {
    return 'SymptomLog(id: $id, user: $user, cycle: $cycle, date: $date, symptom: $symptom)';
  }
}

/// @nodoc
abstract mixin class $SymptomLogCopyWith<$Res> {
  factory $SymptomLogCopyWith(
          SymptomLog value, $Res Function(SymptomLog) _then) =
      _$SymptomLogCopyWithImpl;
  @useResult
  $Res call({int id, int user, int? cycle, String date, String? symptom});
}

/// @nodoc
class _$SymptomLogCopyWithImpl<$Res> implements $SymptomLogCopyWith<$Res> {
  _$SymptomLogCopyWithImpl(this._self, this._then);

  final SymptomLog _self;
  final $Res Function(SymptomLog) _then;

  /// Create a copy of SymptomLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user = null,
    Object? cycle = freezed,
    Object? date = null,
    Object? symptom = freezed,
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
      symptom: freezed == symptom
          ? _self.symptom
          : symptom // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _SymptomLog implements SymptomLog {
  const _SymptomLog(
      {required this.id,
      required this.user,
      this.cycle,
      required this.date,
      this.symptom});
  factory _SymptomLog.fromJson(Map<String, dynamic> json) =>
      _$SymptomLogFromJson(json);

  @override
  final int id;
  @override
  final int user;
  @override
  final int? cycle;
  @override
  final String date;
  @override
  final String? symptom;

  /// Create a copy of SymptomLog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SymptomLogCopyWith<_SymptomLog> get copyWith =>
      __$SymptomLogCopyWithImpl<_SymptomLog>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SymptomLogToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SymptomLog &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.cycle, cycle) || other.cycle == cycle) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.symptom, symptom) || other.symptom == symptom));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, user, cycle, date, symptom);

  @override
  String toString() {
    return 'SymptomLog(id: $id, user: $user, cycle: $cycle, date: $date, symptom: $symptom)';
  }
}

/// @nodoc
abstract mixin class _$SymptomLogCopyWith<$Res>
    implements $SymptomLogCopyWith<$Res> {
  factory _$SymptomLogCopyWith(
          _SymptomLog value, $Res Function(_SymptomLog) _then) =
      __$SymptomLogCopyWithImpl;
  @override
  @useResult
  $Res call({int id, int user, int? cycle, String date, String? symptom});
}

/// @nodoc
class __$SymptomLogCopyWithImpl<$Res> implements _$SymptomLogCopyWith<$Res> {
  __$SymptomLogCopyWithImpl(this._self, this._then);

  final _SymptomLog _self;
  final $Res Function(_SymptomLog) _then;

  /// Create a copy of SymptomLog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? user = null,
    Object? cycle = freezed,
    Object? date = null,
    Object? symptom = freezed,
  }) {
    return _then(_SymptomLog(
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
      symptom: freezed == symptom
          ? _self.symptom
          : symptom // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
