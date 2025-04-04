import 'dart:convert';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../../local_storage/local_storage.dart';
import '../../../../utils/utils.dart';

class LogsService {
  Future<Either<String, T>> addLog<T>(
      {required String date,
      String? protectionUsed,
      int? cycle,
      required String
          title, // this is to go to the url depending on type of log eg mood, symptom etc
      required String
          categoryRequest, // each category has an entry which one has to add through the request body eg for mood its mood, for sexual intercourse its protection_used etc
      required String value,
      required T Function(Map<String, dynamic>) model}) async {
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
        "Content-Type": "application/json",
        "Authorization": "Bearer ${tokenPair.access}",
      };

      Map<String, dynamic> requestBody = {
        "user_id": userId,
        "date": date,
        categoryRequest: value,
      };

      // Only add "cycle" if it's not null
      if (cycle != null) {
        requestBody["cycle"] = cycle;
      }

      var response = await http.post(
        Uri.parse("${Constants.BASE_URL}/logs/$title/"),
        headers: headers,
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 201) {
        var jsonData = jsonDecode(response.body);
        return Right(model(jsonData['log']));
      } else {
        return Left(
            "Failed to log $title, Status code: ${response.statusCode}");
      }
    } catch (e) {
      return Left("Error logging $title : $e");
    }
  }

  Future<Either<String, List<T>>> fetchLogs<T>(
      String title, T Function(Map<String, dynamic>) model, String date) async {
    try {
      TokenPair? tokenPair = await LocalStorage.getToken();
      if (tokenPair == null) return const Left("Tokens not found");

      var headers = {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${tokenPair.access}",
      };

      var response = await http.get(
        Uri.parse("${Constants.BASE_URL}/logs/$title/date/?date=$date"),
        headers: headers,
      );

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        debugPrint("Response body from fetchLogs: $jsonData");

        List<T> logs =
            (jsonData['logs'] as List).map((log) => model(log)).toList();
        return Right(logs);
      } else {
        return Left(
            "Failed to fetch $title logs: Status code: ${response.statusCode}");
      }
    } catch (e) {
      return Left("Error fetching all $title logs: $e");
    }
  }

  Future<Either<String, T>> updateLog<T>({
    required int logId,
    String? date,
    String? value,
    int? cycle,
    required String title,
    required String categoryRequest,
    required T Function(Map<String, dynamic>) model,
  }) async {
    try {
      TokenPair? tokenPair = await LocalStorage.getToken();
      if (tokenPair == null) return const Left("Tokens not found");

      Map<String, dynamic> requestBody = {};

      if (date != null) requestBody["date"] = date;
      if (value != null) requestBody[categoryRequest] = value;
      if (cycle != null) requestBody["cycle"] = cycle;

      var response = await http.patch(
        Uri.parse("${Constants.BASE_URL}/logs/$title/$logId/"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${tokenPair.access}",
        },
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        return Right(model(jsonData["log"]));
      } else {
        return Left(
            "Failed to update $title log. Status code: ${response.statusCode}");
      }
    } catch (e) {
      return Left("Error updating $title log: $e");
    }
  }

  Future<Either<String, String>> deleteLog(int logId, String title) async {
    try {
      TokenPair? tokenPair = await LocalStorage.getToken();
      if (tokenPair == null) return const Left("Tokens not found");

      var response = await http.delete(
        Uri.parse("${Constants.BASE_URL}/logs/$title/$logId/"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${tokenPair.access}",
        },
      );

      if (response.statusCode == 200) {
        return Right("$title Log deleted successfully");
      } else {
        return Left(
            "Failed to delete $title log. Status code: ${response.statusCode}");
      }
    } catch (e) {
      return Left("Error deleting $title log: $e");
    }
  }
}
