// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'medication_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MedicationLog {
  int get id;
  int get user;
  int? get cycle;
  String get date;
  String? get medication;

  /// Create a copy of MedicationLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MedicationLogCopyWith<MedicationLog> get copyWith =>
      _$MedicationLogCopyWithImpl<MedicationLog>(
          this as MedicationLog, _$identity);

  /// Serializes this MedicationLog to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MedicationLog &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.cycle, cycle) || other.cycle == cycle) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.medication, medication) ||
                other.medication == medication));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, user, cycle, date, medication);

  @override
  String toString() {
    return 'MedicationLog(id: $id, user: $user, cycle: $cycle, date: $date, medication: $medication)';
  }
}

/// @nodoc
abstract mixin class $MedicationLogCopyWith<$Res> {
  factory $MedicationLogCopyWith(
          MedicationLog value, $Res Function(MedicationLog) _then) =
      _$MedicationLogCopyWithImpl;
  @useResult
  $Res call({int id, int user, int? cycle, String date, String? medication});
}

/// @nodoc
class _$MedicationLogCopyWithImpl<$Res>
    implements $MedicationLogCopyWith<$Res> {
  _$MedicationLogCopyWithImpl(this._self, this._then);

  final MedicationLog _self;
  final $Res Function(MedicationLog) _then;

  /// Create a copy of MedicationLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user = null,
    Object? cycle = freezed,
    Object? date = null,
    Object? medication = freezed,
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
      medication: freezed == medication
          ? _self.medication
          : medication // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _MedicationLog implements MedicationLog {
  const _MedicationLog(
      {required this.id,
      required this.user,
      this.cycle,
      required this.date,
      this.medication});
  factory _MedicationLog.fromJson(Map<String, dynamic> json) =>
      _$MedicationLogFromJson(json);

  @override
  final int id;
  @override
  final int user;
  @override
  final int? cycle;
  @override
  final String date;
  @override
  final String? medication;

  /// Create a copy of MedicationLog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MedicationLogCopyWith<_MedicationLog> get copyWith =>
      __$MedicationLogCopyWithImpl<_MedicationLog>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MedicationLogToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MedicationLog &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.cycle, cycle) || other.cycle == cycle) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.medication, medication) ||
                other.medication == medication));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, user, cycle, date, medication);

  @override
  String toString() {
    return 'MedicationLog(id: $id, user: $user, cycle: $cycle, date: $date, medication: $medication)';
  }
}

/// @nodoc
abstract mixin class _$MedicationLogCopyWith<$Res>
    implements $MedicationLogCopyWith<$Res> {
  factory _$MedicationLogCopyWith(
          _MedicationLog value, $Res Function(_MedicationLog) _then) =
      __$MedicationLogCopyWithImpl;
  @override
  @useResult
  $Res call({int id, int user, int? cycle, String date, String? medication});
}

/// @nodoc
class __$MedicationLogCopyWithImpl<$Res>
    implements _$MedicationLogCopyWith<$Res> {
  __$MedicationLogCopyWithImpl(this._self, this._then);

  final _MedicationLog _self;
  final $Res Function(_MedicationLog) _then;

  /// Create a copy of MedicationLog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? user = null,
    Object? cycle = freezed,
    Object? date = null,
    Object? medication = freezed,
  }) {
    return _then(_MedicationLog(
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
      medication: freezed == medication
          ? _self.medication
          : medication // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
