// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      first_name: json['first_name'] as String,
      last_name: json['last_name'] as String,
      email: json['email'] as String,
      phone_number: json['phone_number'] as String,
      gender: json['gender'] as String,
      birth_date: json['birth_date'] as String?,
      password: json['password'] as String?,
      date_joined: json['date_joined'] as String?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'email': instance.email,
      'phone_number': instance.phone_number,
      'gender': instance.gender,
      'birth_date': instance.birth_date,
      'password': instance.password,
      'date_joined': instance.date_joined,
    };
