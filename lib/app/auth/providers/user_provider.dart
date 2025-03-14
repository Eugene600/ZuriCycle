import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../auth.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  final service = UserService();
  return UserRepository(service);
});


final userNotifierProvider =
    StateNotifierProvider<UserNotifier, AsyncValue<User>>((ref) {
  final repository = ref.read(userRepositoryProvider);
  return UserNotifier(repository);
});

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AsyncValue<String>>((ref) {
  final repository = ref.read(userRepositoryProvider);
  return AuthNotifier(repository);
});
