import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class User with _$User {
  const factory User({
    required String first_name,
    required String last_name,
    required String email,
    String? user_id,
    required String phone_number,
    required String gender,
    String? birth_date,
    String? password,
    String? date_joined,
  }) = _User;

  factory User.fromJson(Map<String, Object?> json)
      => _$UserFromJson(json);
}