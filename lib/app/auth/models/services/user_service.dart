import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../../local_storage/local_storage.dart';
import '../../../../utils/utils.dart';
import '../../auth.dart';

class UserService {
  Future<Either<String, dynamic>> register(User user) async {
    try {
      var response = await http.post(
        Uri.parse("${Constants.BASE_URL}/signup/"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(user.toJson()),
      );

      if (response.statusCode == 201) {
        var jsonData = jsonDecode(response.body);
        debugPrint("Register Response JSON: $jsonData");

        if (jsonData.containsKey('user')) {
          var userData = jsonData['user'];

          String? userId = userData['user_id'];
          String? gender = userData['gender'];

          if (userId != null && gender != null) {
            await LocalStorage.saveUserData(userId, gender);
            debugPrint("Saved User ID: $userId");
            debugPrint("Saved Gender: $gender");
          } else {
            debugPrint("User ID or Gender missing in response");
            return Left("User Id or Gender Missing in response");
          }
        } else {
          debugPrint("User object missing in the response");
          return const Left("User object missing in the response");
        }

        // Extract tokens properly
        var tokens = jsonData['tokens'] as Map<String, dynamic>?;

        if (tokens != null &&
            tokens.containsKey('access') &&
            tokens.containsKey('refresh') &&
            tokens['access'] is String &&
            tokens['refresh'] is String) {
          TokenPair tokenPair = TokenPair(
            access: tokens['access'],
            refresh: tokens['refresh'],
          );
          await LocalStorage.saveToken(tokenPair);

          debugPrint("Access Token: ${tokenPair.access}");
          debugPrint("Refresh Token: ${tokenPair.refresh}");

          // Returning the User object
          if (jsonData.containsKey('user')) {
            User user = User.fromJson(jsonData['user']);
            return Right(user);
          } else {
            debugPrint('User object missing in the response');
            return const Left('User object missing in the response');
          }
        } else {
          debugPrint('Missing or invalid access/refresh token in the response');
          return const Left(
              'Missing or invalid access/refresh token in the response');
        }
      } else {
        debugPrint("Error: ${response.body}");
        return Left(
            'Failed to register user. Status code: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error registering user: $e');
      return Left('Error registering user: $e');
    }
  }

  Future<Either<String, TokenPair>> login(String email, String password) async {
    try {
      var response = await http.post(
        Uri.parse("${Constants.BASE_URL}/login/"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        debugPrint("Login Response JSON: $jsonData");

        // Check if the 'user' key exists in the response
        if (jsonData.containsKey('user')) {
          var userData = jsonData['user'];

          // Extract user_id and gender from the user object
          String? userId = userData['user_id'];
          String? gender = userData['gender'];

          if (userId != null && gender != null) {
            await LocalStorage.saveUserData(userId, gender);
            debugPrint("Saved User ID: $userId");
            debugPrint("Saved Gender: $gender");
          } else {
            debugPrint("User ID or Gender missing in response");
            return const Left("User ID or Gender missing in response");
          }
        } else {
          debugPrint("User object missing in the response");
          return const Left("User object missing in the response");
        }

        // Check if the 'tokens' key exists in the response
        if (jsonData.containsKey('tokens')) {
          var tokensData = jsonData['tokens'];

          // Extract access and refresh tokens from the tokens object
          if (tokensData['access'] != null && tokensData['refresh'] != null) {
            TokenPair tokenPair = TokenPair(
              access: tokensData['access'],
              refresh: tokensData['refresh'],
            );
            await LocalStorage.saveToken(tokenPair);

            return Right(tokenPair);
          } else {
            debugPrint('Missing access or refresh token in the response');
            return const Left(
                'Missing access or refresh token in the response');
          }
        } else {
          debugPrint('Tokens object missing in the response');
          return const Left('Tokens object missing in the response');
        }
      } else {
        debugPrint("Login Error: ${response.body}");
        return Left('Failed to log in. Status code: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error logging in: $e');
      return Left('Error logging in: $e');
    }
  }

  Future<Either<String, String>> logout() async {
    try {
      TokenPair? tokenPair = await LocalStorage.getToken();

      if (tokenPair != null) {
        String refreshToken = tokenPair.refresh;

        var headers = {
          'Authorization': 'Bearer ${tokenPair.access}',
          'Content-type': 'application/json',
        };

        var response = await http.post(
          Uri.parse("${Constants.BASE_URL}/logout/"),
          headers: headers,
          body: jsonEncode(refreshToken),
        );

        if (response.statusCode == 200) {
          var jsonData = jsonDecode(response.body);
          debugPrint("Logout: $jsonData");

          await LocalStorage.deleteToken();
          await LocalStorage.deleteUserData();

          return Right("Successfully Logged Out");
        } else {
          return Left("Failed to log out: staus code:${response.statusCode}");
        }
      } else {
        return Left("Missing refresh tokens");
      }
    } catch (e) {
      return Left("Error logging out: $e");
    }
  }

  Future<Either<String, User>> getUser() async {
    try {
      final tokenPair = await LocalStorage.getToken();
      final userData = await LocalStorage.getUserData();

      if (userData == null || !userData.containsKey('user_id')) {
        return const Left('User ID not found in local storage');
      }

      if (tokenPair == null) {
        return Left("Tokens not found");
      }

      String userId = userData['user_id'];

      var headers = {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${tokenPair.access}"
      };

      var response = await http.get(
          Uri.parse("${Constants.BASE_URL}/user/$userId/"),
          headers: headers);

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        debugPrint("Get User Response JSON: $jsonData");

        final user = User.fromJson(jsonData);
        return Right(user);
      } else {
        debugPrint("Get User Error: ${response.body}");
        return Left(
            "Failed to fetch user. Status code: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint('Error fetching user: $e');
      return Left("Error getting user $e");
    }
  }

  Future<Either<String, String>> deleteUser() async {
    try {
      final tokenPair = await LocalStorage.getToken();
      final userData = await LocalStorage.getUserData();

      if (userData == null || !userData.containsKey('user_id')) {
        return Left("User ID not found in local Storage");
      }

      if (tokenPair == null) {
        return Left("Tokens not found");
      }

      String userId = userData['user_id'];

      var headers = {
        "Content-type": "application/json",
        "Authorization": "Bearer ${tokenPair.access}",
      };

      var response = await http.delete(
        Uri.parse("${Constants.BASE_URL}/user/delete/$userId/"),
        headers: headers,
      );

      debugPrint("Delete response Status Code: ${response.statusCode}");

      if (response.statusCode == 200) {
        await LocalStorage.deleteUserData();
        await LocalStorage.deleteToken();

        debugPrint("User deleted successfully");
        return Right("User account deleted successfully");
      } else {
        debugPrint("Delete User Error: ${response.body}");
        return Left(
            "Failed to delete user. Status code: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint('Error deleting user: $e');
      return Left("Error deleting user: $e");
    }
  }
}
