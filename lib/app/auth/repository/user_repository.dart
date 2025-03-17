import 'package:either_dart/either.dart';

import '../../../local_storage/local_storage.dart';
import '../models/models.dart';

class UserRepository {
  final UserService _userService;

  UserRepository(this._userService);

  Future<Either<String, dynamic>> register(User user) async{
    final userData = await _userService.register(user);
    return userData;
  }

  Future<Either<String, TokenPair>> login(String email, String password) async {
    return await _userService.login(email, password);
  }

  Future<Either<String, String>> logout() async {
    return await _userService.logout();
  }

  Future<Either<String, User>> getUser() async {
    return await _userService.getUser();
  }

  Future<Either<String, String>> deleteUser() async {
    return await _userService.deleteUser();
  }
}