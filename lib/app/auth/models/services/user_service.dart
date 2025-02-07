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
        debugPrint("Access Token: ${jsonData['access']}");
        debugPrint("Refresh Token: ${jsonData['refresh']}");

        // Save the tokens in local storage
        if (jsonData['access'] != null && jsonData['refresh'] != null) {
          // Storing the tokens as TokenPair
          TokenPair tokenPair = TokenPair(
            access: jsonData['access'],
            refresh: jsonData['refresh'],
          );
          await LocalStorage.saveToken(tokenPair);

          // Returning the User object
          if (jsonData.containsKey('user')) {
            User user = User.fromJson(jsonData['user']);
            return Right(user);
          } else {
            debugPrint('User object missing in the response');
            return const Left('User object missing in the response');
          }
        } else {
          debugPrint('Missing access or refresh token in the response');
          return const Left('Missing access or refresh token in the response');
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

        // Save the tokens in local storage
        if (jsonData['access'] != null && jsonData['refresh'] != null) {
          TokenPair tokenPair = TokenPair(
            access: jsonData['access'],
            refresh: jsonData['refresh'],
          );
          await LocalStorage.saveToken(tokenPair);

          return Right(tokenPair);
        } else {
          debugPrint('Missing access or refresh token in the response');
          return const Left('Missing access or refresh token in the response');
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
}