import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../auth.dart';

class UserNotifier extends StateNotifier<AsyncValue<User?>> {
  final UserRepository _userRepository;

  UserNotifier(this._userRepository) : super(const AsyncValue<User>.loading());

  Future<void> getUser() async {
    try {
      state = const AsyncValue.loading();

      final result = await _userRepository.getUser();

      result.fold(
        (failure) {
          state = AsyncValue.error(failure, StackTrace.current);
        },
        (user) {
          state = AsyncValue.data(user);
        },
      );
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  Future<void> deleteUser() async {
    try {
      final result = await _userRepository.deleteUser();

      result.fold((error) {
        state = AsyncValue.error(error, StackTrace.current);
      }, (success) {
        state = AsyncValue.data(null);
      });
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }
}
