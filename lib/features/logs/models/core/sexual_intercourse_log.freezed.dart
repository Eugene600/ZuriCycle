// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sexual_intercourse_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SexualIntercourseLog {
  int get id;
  int get user;
  int? get cycle;
  String get date;
  String? get protection_used;

  /// Create a copy of SexualIntercourseLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SexualIntercourseLogCopyWith<SexualIntercourseLog> get copyWith =>
      _$SexualIntercourseLogCopyWithImpl<SexualIntercourseLog>(
          this as SexualIntercourseLog, _$identity);

  /// Serializes this SexualIntercourseLog to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SexualIntercourseLog &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.cycle, cycle) || other.cycle == cycle) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.protection_used, protection_used) ||
                other.protection_used == protection_used));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, user, cycle, date, protection_used);

  @override
  String toString() {
    return 'SexualIntercourseLog(id: $id, user: $user, cycle: $cycle, date: $date, protection_used: $protection_used)';
  }
}

/// @nodoc
abstract mixin class $SexualIntercourseLogCopyWith<$Res> {
  factory $SexualIntercourseLogCopyWith(SexualIntercourseLog value,
          $Res Function(SexualIntercourseLog) _then) =
      _$SexualIntercourseLogCopyWithImpl;
  @useResult
  $Res call(
      {int id, int user, int? cycle, String date, String? protection_used});
}

/// @nodoc
class _$SexualIntercourseLogCopyWithImpl<$Res>
    implements $SexualIntercourseLogCopyWith<$Res> {
  _$SexualIntercourseLogCopyWithImpl(this._self, this._then);

  final SexualIntercourseLog _self;
  final $Res Function(SexualIntercourseLog) _then;

  /// Create a copy of SexualIntercourseLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user = null,
    Object? cycle = freezed,
    Object? date = null,
    Object? protection_used = freezed,
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
      protection_used: freezed == protection_used
          ? _self.protection_used
          : protection_used // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _SexualIntercourseLog implements SexualIntercourseLog {
  const _SexualIntercourseLog(
      {required this.id,
      required this.user,
      this.cycle,
      required this.date,
      this.protection_used});
  factory _SexualIntercourseLog.fromJson(Map<String, dynamic> json) =>
      _$SexualIntercourseLogFromJson(json);

  @override
  final int id;
  @override
  final int user;
  @override
  final int? cycle;
  @override
  final String date;
  @override
  final String? protection_used;

  /// Create a copy of SexualIntercourseLog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SexualIntercourseLogCopyWith<_SexualIntercourseLog> get copyWith =>
      __$SexualIntercourseLogCopyWithImpl<_SexualIntercourseLog>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SexualIntercourseLogToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SexualIntercourseLog &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.cycle, cycle) || other.cycle == cycle) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.protection_used, protection_used) ||
                other.protection_used == protection_used));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, user, cycle, date, protection_used);

  @override
  String toString() {
    return 'SexualIntercourseLog(id: $id, user: $user, cycle: $cycle, date: $date, protection_used: $protection_used)';
  }
}

/// @nodoc
abstract mixin class _$SexualIntercourseLogCopyWith<$Res>
    implements $SexualIntercourseLogCopyWith<$Res> {
  factory _$SexualIntercourseLogCopyWith(_SexualIntercourseLog value,
          $Res Function(_SexualIntercourseLog) _then) =
      __$SexualIntercourseLogCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id, int user, int? cycle, String date, String? protection_used});
}

/// @nodoc
class __$SexualIntercourseLogCopyWithImpl<$Res>
    implements _$SexualIntercourseLogCopyWith<$Res> {
  __$SexualIntercourseLogCopyWithImpl(this._self, this._then);

  final _SexualIntercourseLog _self;
  final $Res Function(_SexualIntercourseLog) _then;

  /// Create a copy of SexualIntercourseLog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? user = null,
    Object? cycle = freezed,
    Object? date = null,
    Object? protection_used = freezed,
  }) {
    return _then(_SexualIntercourseLog(
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
      protection_used: freezed == protection_used
          ? _self.protection_used
          : protection_used // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
