import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenPair {
  final String access;
  final String refresh;

  TokenPair({required this.access, required this.refresh});

  factory TokenPair.fromJson(Map<String, dynamic> json) {
    return TokenPair(
      access: json['access'] as String,
      refresh: json['refresh'] as String,
    );
  }
}

class LocalStorage{
  static Future<void> saveToken(TokenPair token) async {
    if(token.refresh.isEmpty || token.access.isEmpty) debugPrint("Cannot save tokens because they are empty");

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('access_token', token.access);
    await prefs.setString('refresh_token', token.refresh);
  } 

  static Future<TokenPair?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('access_token');
    final refreshToken = prefs.getString('refresh_token');

    if (accessToken == null || accessToken.isEmpty || refreshToken == null || refreshToken.isEmpty) {
      await deleteToken();
      return null;
    }

    return TokenPair(access: accessToken, refresh: refreshToken);
  }

  static Future<void> deleteToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('access_token');
    await prefs.remove('refresh_token');
  }

  static Future<void> saveUserData(String userId, String gender) async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_id', userId);
    await prefs.setString('gender', gender); 
  }

  static Future<Map<String, dynamic>?> getUserData() async {
    final prefs = await SharedPreferences.getInstance();

    final String? userId = prefs.getString('user_id') ;
    final String? gender = prefs.getString('gender');

    if (userId == null || gender == null) return null;

    return {'user_id': userId, 'gender': gender};
  }

  static Future<void> deleteUserData() async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('user_id');
    await prefs.remove('gender');
  }
}