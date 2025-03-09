import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../auth.dart';

class UserNotifier extends StateNotifier<AsyncValue<String?>> {
  final UserRepository _userRepository;

  UserNotifier(this._userRepository) : super(const AsyncValue<String?>.data(null));


  Future<String> login(String email, String password) async {
    state = const AsyncValue.loading();

    final result = await _userRepository.login(email, password);

    return result.fold(
      (error) {
        state = AsyncValue.error(error, StackTrace.current);
        return "Login failed: $error";
      },
      (tokenPair) {
        state = const AsyncValue.data("Login successful");
        return "Login successful";
      },
    );
  }

  Future<String> register(User user) async {
    state = const AsyncValue.loading();

    final result = await _userRepository.register(user);

    return result.fold(
      (error) {
        state = AsyncValue.error(error, StackTrace.current);
        return "Registration failed: $error";
      },
      (userData) { 
        state = const AsyncValue.data("Registration successful");
        return "Registration successful";
      },
    );
  }

  Future<String> logout() async{
    state = AsyncValue.loading();

    final result = await _userRepository.logout();

    return result.fold(
      (error) {
        state = AsyncValue.error(error, StackTrace.current);
        return "Logout failed";
      }, 
      (success) {
        state = AsyncValue.data("Login Successful");
        return success;
      }
    );
  }
}
