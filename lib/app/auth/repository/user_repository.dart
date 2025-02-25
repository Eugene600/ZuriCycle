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
}