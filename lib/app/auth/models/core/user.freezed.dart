// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$User {
  String get first_name;
  String get last_name;
  String get email;
  String? get user_id;
  String get phone_number;
  String get gender;
  String? get birth_date;
  String? get password;
  String? get date_joined;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserCopyWith<User> get copyWith =>
      _$UserCopyWithImpl<User>(this as User, _$identity);

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is User &&
            (identical(other.first_name, first_name) ||
                other.first_name == first_name) &&
            (identical(other.last_name, last_name) ||
                other.last_name == last_name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.user_id, user_id) || other.user_id == user_id) &&
            (identical(other.phone_number, phone_number) ||
                other.phone_number == phone_number) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.birth_date, birth_date) ||
                other.birth_date == birth_date) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.date_joined, date_joined) ||
                other.date_joined == date_joined));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, first_name, last_name, email,
      user_id, phone_number, gender, birth_date, password, date_joined);

  @override
  String toString() {
    return 'User(first_name: $first_name, last_name: $last_name, email: $email, user_id: $user_id, phone_number: $phone_number, gender: $gender, birth_date: $birth_date, password: $password, date_joined: $date_joined)';
  }
}

/// @nodoc
abstract mixin class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) _then) =
      _$UserCopyWithImpl;
  @useResult
  $Res call(
      {String first_name,
      String last_name,
      String email,
      String? user_id,
      String phone_number,
      String gender,
      String? birth_date,
      String? password,
      String? date_joined});
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._self, this._then);

  final User _self;
  final $Res Function(User) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? first_name = null,
    Object? last_name = null,
    Object? email = null,
    Object? user_id = freezed,
    Object? phone_number = null,
    Object? gender = null,
    Object? birth_date = freezed,
    Object? password = freezed,
    Object? date_joined = freezed,
  }) {
    return _then(_self.copyWith(
      first_name: null == first_name
          ? _self.first_name
          : first_name // ignore: cast_nullable_to_non_nullable
              as String,
      last_name: null == last_name
          ? _self.last_name
          : last_name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      user_id: freezed == user_id
          ? _self.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as String?,
      phone_number: null == phone_number
          ? _self.phone_number
          : phone_number // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      birth_date: freezed == birth_date
          ? _self.birth_date
          : birth_date // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      date_joined: freezed == date_joined
          ? _self.date_joined
          : date_joined // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _User implements User {
  const _User(
      {required this.first_name,
      required this.last_name,
      required this.email,
      this.user_id,
      required this.phone_number,
      required this.gender,
      this.birth_date,
      this.password,
      this.date_joined});
  factory _User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @override
  final String first_name;
  @override
  final String last_name;
  @override
  final String email;
  @override
  final String? user_id;
  @override
  final String phone_number;
  @override
  final String gender;
  @override
  final String? birth_date;
  @override
  final String? password;
  @override
  final String? date_joined;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _User &&
            (identical(other.first_name, first_name) ||
                other.first_name == first_name) &&
            (identical(other.last_name, last_name) ||
                other.last_name == last_name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.user_id, user_id) || other.user_id == user_id) &&
            (identical(other.phone_number, phone_number) ||
                other.phone_number == phone_number) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.birth_date, birth_date) ||
                other.birth_date == birth_date) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.date_joined, date_joined) ||
                other.date_joined == date_joined));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, first_name, last_name, email,
      user_id, phone_number, gender, birth_date, password, date_joined);

  @override
  String toString() {
    return 'User(first_name: $first_name, last_name: $last_name, email: $email, user_id: $user_id, phone_number: $phone_number, gender: $gender, birth_date: $birth_date, password: $password, date_joined: $date_joined)';
  }
}

/// @nodoc
abstract mixin class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) _then) =
      __$UserCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String first_name,
      String last_name,
      String email,
      String? user_id,
      String phone_number,
      String gender,
      String? birth_date,
      String? password,
      String? date_joined});
}

/// @nodoc
class __$UserCopyWithImpl<$Res> implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(this._self, this._then);

  final _User _self;
  final $Res Function(_User) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? first_name = null,
    Object? last_name = null,
    Object? email = null,
    Object? user_id = freezed,
    Object? phone_number = null,
    Object? gender = null,
    Object? birth_date = freezed,
    Object? password = freezed,
    Object? date_joined = freezed,
  }) {
    return _then(_User(
      first_name: null == first_name
          ? _self.first_name
          : first_name // ignore: cast_nullable_to_non_nullable
              as String,
      last_name: null == last_name
          ? _self.last_name
          : last_name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      user_id: freezed == user_id
          ? _self.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as String?,
      phone_number: null == phone_number
          ? _self.phone_number
          : phone_number // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      birth_date: freezed == birth_date
          ? _self.birth_date
          : birth_date // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      date_joined: freezed == date_joined
          ? _self.date_joined
          : date_joined // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
