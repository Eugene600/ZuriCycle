import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../auth.dart';

class UserNotifier extends StateNotifier<AsyncValue<String?>> {
  final UserRepository _userRepository;

  UserNotifier(this._userRepository) : super(const AsyncValue.data(null));

  Future<void> login(String email, String password) async {
    state = const AsyncValue.loading(); // Show loading state

    final result = await _userRepository.login(email, password);

    result.fold(
      (error) => state = AsyncValue.error(error, StackTrace.current),
      (tokenPair) {
        // LocalStorage.saveToken(tokenPair);
        state = const AsyncValue.data("Login successful");
      },
    );
  }

  Future<void> register(User user) async {
    state = const AsyncValue.loading();

    final result = await _userRepository.register(user);

    result.fold(
      (error) => state = AsyncValue.error(error, StackTrace.current),
      (userData) => state = const AsyncValue.data("Registration successful"),
    );
  }
}
