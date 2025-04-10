// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cycle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Cycle {
  int? get id;
  String get period_start;
  String get period_end;
  String get fertile_start;
  String get fertile_end;
  String get ovulation;
  String get predicted_period_start;
  String get predicted_period_end;
  String? get created_at;
  String? get edited_at;

  /// Create a copy of Cycle
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CycleCopyWith<Cycle> get copyWith =>
      _$CycleCopyWithImpl<Cycle>(this as Cycle, _$identity);

  /// Serializes this Cycle to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Cycle &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.period_start, period_start) ||
                other.period_start == period_start) &&
            (identical(other.period_end, period_end) ||
                other.period_end == period_end) &&
            (identical(other.fertile_start, fertile_start) ||
                other.fertile_start == fertile_start) &&
            (identical(other.fertile_end, fertile_end) ||
                other.fertile_end == fertile_end) &&
            (identical(other.ovulation, ovulation) ||
                other.ovulation == ovulation) &&
            (identical(other.predicted_period_start, predicted_period_start) ||
                other.predicted_period_start == predicted_period_start) &&
            (identical(other.predicted_period_end, predicted_period_end) ||
                other.predicted_period_end == predicted_period_end) &&
            (identical(other.created_at, created_at) ||
                other.created_at == created_at) &&
            (identical(other.edited_at, edited_at) ||
                other.edited_at == edited_at));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      period_start,
      period_end,
      fertile_start,
      fertile_end,
      ovulation,
      predicted_period_start,
      predicted_period_end,
      created_at,
      edited_at);

  @override
  String toString() {
    return 'Cycle(id: $id, period_start: $period_start, period_end: $period_end, fertile_start: $fertile_start, fertile_end: $fertile_end, ovulation: $ovulation, predicted_period_start: $predicted_period_start, predicted_period_end: $predicted_period_end, created_at: $created_at, edited_at: $edited_at)';
  }
}

/// @nodoc
abstract mixin class $CycleCopyWith<$Res> {
  factory $CycleCopyWith(Cycle value, $Res Function(Cycle) _then) =
      _$CycleCopyWithImpl;
  @useResult
  $Res call(
      {int? id,
      String period_start,
      String period_end,
      String fertile_start,
      String fertile_end,
      String ovulation,
      String predicted_period_start,
      String predicted_period_end,
      String? created_at,
      String? edited_at});
}

/// @nodoc
class _$CycleCopyWithImpl<$Res> implements $CycleCopyWith<$Res> {
  _$CycleCopyWithImpl(this._self, this._then);

  final Cycle _self;
  final $Res Function(Cycle) _then;

  /// Create a copy of Cycle
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? period_start = null,
    Object? period_end = null,
    Object? fertile_start = null,
    Object? fertile_end = null,
    Object? ovulation = null,
    Object? predicted_period_start = null,
    Object? predicted_period_end = null,
    Object? created_at = freezed,
    Object? edited_at = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      period_start: null == period_start
          ? _self.period_start
          : period_start // ignore: cast_nullable_to_non_nullable
              as String,
      period_end: null == period_end
          ? _self.period_end
          : period_end // ignore: cast_nullable_to_non_nullable
              as String,
      fertile_start: null == fertile_start
          ? _self.fertile_start
          : fertile_start // ignore: cast_nullable_to_non_nullable
              as String,
      fertile_end: null == fertile_end
          ? _self.fertile_end
          : fertile_end // ignore: cast_nullable_to_non_nullable
              as String,
      ovulation: null == ovulation
          ? _self.ovulation
          : ovulation // ignore: cast_nullable_to_non_nullable
              as String,
      predicted_period_start: null == predicted_period_start
          ? _self.predicted_period_start
          : predicted_period_start // ignore: cast_nullable_to_non_nullable
              as String,
      predicted_period_end: null == predicted_period_end
          ? _self.predicted_period_end
          : predicted_period_end // ignore: cast_nullable_to_non_nullable
              as String,
      created_at: freezed == created_at
          ? _self.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String?,
      edited_at: freezed == edited_at
          ? _self.edited_at
          : edited_at // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Cycle implements Cycle {
  const _Cycle(
      {this.id,
      required this.period_start,
      required this.period_end,
      required this.fertile_start,
      required this.fertile_end,
      required this.ovulation,
      required this.predicted_period_start,
      required this.predicted_period_end,
      this.created_at,
      this.edited_at});
  factory _Cycle.fromJson(Map<String, dynamic> json) => _$CycleFromJson(json);

  @override
  final int? id;
  @override
  final String period_start;
  @override
  final String period_end;
  @override
  final String fertile_start;
  @override
  final String fertile_end;
  @override
  final String ovulation;
  @override
  final String predicted_period_start;
  @override
  final String predicted_period_end;
  @override
  final String? created_at;
  @override
  final String? edited_at;

  /// Create a copy of Cycle
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CycleCopyWith<_Cycle> get copyWith =>
      __$CycleCopyWithImpl<_Cycle>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CycleToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Cycle &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.period_start, period_start) ||
                other.period_start == period_start) &&
            (identical(other.period_end, period_end) ||
                other.period_end == period_end) &&
            (identical(other.fertile_start, fertile_start) ||
                other.fertile_start == fertile_start) &&
            (identical(other.fertile_end, fertile_end) ||
                other.fertile_end == fertile_end) &&
            (identical(other.ovulation, ovulation) ||
                other.ovulation == ovulation) &&
            (identical(other.predicted_period_start, predicted_period_start) ||
                other.predicted_period_start == predicted_period_start) &&
            (identical(other.predicted_period_end, predicted_period_end) ||
                other.predicted_period_end == predicted_period_end) &&
            (identical(other.created_at, created_at) ||
                other.created_at == created_at) &&
            (identical(other.edited_at, edited_at) ||
                other.edited_at == edited_at));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      period_start,
      period_end,
      fertile_start,
      fertile_end,
      ovulation,
      predicted_period_start,
      predicted_period_end,
      created_at,
      edited_at);

  @override
  String toString() {
    return 'Cycle(id: $id, period_start: $period_start, period_end: $period_end, fertile_start: $fertile_start, fertile_end: $fertile_end, ovulation: $ovulation, predicted_period_start: $predicted_period_start, predicted_period_end: $predicted_period_end, created_at: $created_at, edited_at: $edited_at)';
  }
}

/// @nodoc
abstract mixin class _$CycleCopyWith<$Res> implements $CycleCopyWith<$Res> {
  factory _$CycleCopyWith(_Cycle value, $Res Function(_Cycle) _then) =
      __$CycleCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? id,
      String period_start,
      String period_end,
      String fertile_start,
      String fertile_end,
      String ovulation,
      String predicted_period_start,
      String predicted_period_end,
      String? created_at,
      String? edited_at});
}

/// @nodoc
class __$CycleCopyWithImpl<$Res> implements _$CycleCopyWith<$Res> {
  __$CycleCopyWithImpl(this._self, this._then);

  final _Cycle _self;
  final $Res Function(_Cycle) _then;

  /// Create a copy of Cycle
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? period_start = null,
    Object? period_end = null,
    Object? fertile_start = null,
    Object? fertile_end = null,
    Object? ovulation = null,
    Object? predicted_period_start = null,
    Object? predicted_period_end = null,
    Object? created_at = freezed,
    Object? edited_at = freezed,
  }) {
    return _then(_Cycle(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      period_start: null == period_start
          ? _self.period_start
          : period_start // ignore: cast_nullable_to_non_nullable
              as String,
      period_end: null == period_end
          ? _self.period_end
          : period_end // ignore: cast_nullable_to_non_nullable
              as String,
      fertile_start: null == fertile_start
          ? _self.fertile_start
          : fertile_start // ignore: cast_nullable_to_non_nullable
              as String,
      fertile_end: null == fertile_end
          ? _self.fertile_end
          : fertile_end // ignore: cast_nullable_to_non_nullable
              as String,
      ovulation: null == ovulation
          ? _self.ovulation
          : ovulation // ignore: cast_nullable_to_non_nullable
              as String,
      predicted_period_start: null == predicted_period_start
          ? _self.predicted_period_start
          : predicted_period_start // ignore: cast_nullable_to_non_nullable
              as String,
      predicted_period_end: null == predicted_period_end
          ? _self.predicted_period_end
          : predicted_period_end // ignore: cast_nullable_to_non_nullable
              as String,
      created_at: freezed == created_at
          ? _self.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String?,
      edited_at: freezed == edited_at
          ? _self.edited_at
          : edited_at // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
