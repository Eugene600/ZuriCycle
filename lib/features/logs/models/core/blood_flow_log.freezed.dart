// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'blood_flow_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BloodFlowLog {
  int get id;
  int get user;
  int? get cycle;
  String get date;
  String? get flow_level;

  /// Create a copy of BloodFlowLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BloodFlowLogCopyWith<BloodFlowLog> get copyWith =>
      _$BloodFlowLogCopyWithImpl<BloodFlowLog>(
          this as BloodFlowLog, _$identity);

  /// Serializes this BloodFlowLog to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BloodFlowLog &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.cycle, cycle) || other.cycle == cycle) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.flow_level, flow_level) ||
                other.flow_level == flow_level));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, user, cycle, date, flow_level);

  @override
  String toString() {
    return 'BloodFlowLog(id: $id, user: $user, cycle: $cycle, date: $date, flow_level: $flow_level)';
  }
}

/// @nodoc
abstract mixin class $BloodFlowLogCopyWith<$Res> {
  factory $BloodFlowLogCopyWith(
          BloodFlowLog value, $Res Function(BloodFlowLog) _then) =
      _$BloodFlowLogCopyWithImpl;
  @useResult
  $Res call({int id, int user, int? cycle, String date, String? flow_level});
}

/// @nodoc
class _$BloodFlowLogCopyWithImpl<$Res> implements $BloodFlowLogCopyWith<$Res> {
  _$BloodFlowLogCopyWithImpl(this._self, this._then);

  final BloodFlowLog _self;
  final $Res Function(BloodFlowLog) _then;

  /// Create a copy of BloodFlowLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user = null,
    Object? cycle = freezed,
    Object? date = null,
    Object? flow_level = freezed,
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
      flow_level: freezed == flow_level
          ? _self.flow_level
          : flow_level // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _BloodFlowLog implements BloodFlowLog {
  const _BloodFlowLog(
      {required this.id,
      required this.user,
      this.cycle,
      required this.date,
      this.flow_level});
  factory _BloodFlowLog.fromJson(Map<String, dynamic> json) =>
      _$BloodFlowLogFromJson(json);

  @override
  final int id;
  @override
  final int user;
  @override
  final int? cycle;
  @override
  final String date;
  @override
  final String? flow_level;

  /// Create a copy of BloodFlowLog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BloodFlowLogCopyWith<_BloodFlowLog> get copyWith =>
      __$BloodFlowLogCopyWithImpl<_BloodFlowLog>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BloodFlowLogToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BloodFlowLog &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.cycle, cycle) || other.cycle == cycle) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.flow_level, flow_level) ||
                other.flow_level == flow_level));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, user, cycle, date, flow_level);

  @override
  String toString() {
    return 'BloodFlowLog(id: $id, user: $user, cycle: $cycle, date: $date, flow_level: $flow_level)';
  }
}

/// @nodoc
abstract mixin class _$BloodFlowLogCopyWith<$Res>
    implements $BloodFlowLogCopyWith<$Res> {
  factory _$BloodFlowLogCopyWith(
          _BloodFlowLog value, $Res Function(_BloodFlowLog) _then) =
      __$BloodFlowLogCopyWithImpl;
  @override
  @useResult
  $Res call({int id, int user, int? cycle, String date, String? flow_level});
}

/// @nodoc
class __$BloodFlowLogCopyWithImpl<$Res>
    implements _$BloodFlowLogCopyWith<$Res> {
  __$BloodFlowLogCopyWithImpl(this._self, this._then);

  final _BloodFlowLog _self;
  final $Res Function(_BloodFlowLog) _then;

  /// Create a copy of BloodFlowLog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? user = null,
    Object? cycle = freezed,
    Object? date = null,
    Object? flow_level = freezed,
  }) {
    return _then(_BloodFlowLog(
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
      flow_level: freezed == flow_level
          ? _self.flow_level
          : flow_level // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
