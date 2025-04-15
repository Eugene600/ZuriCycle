import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:zuricycle/local_storage/local_storage.dart';
import 'package:http/http.dart' as http;

import '../../../../utils/utils.dart';
import '../models.dart';

class CycleService {
  Future<Either<String, Cycle>> postCycles(Cycle cycle) async {
    try {
      final tokenPair = await LocalStorage.getToken();
      final userDetails = await LocalStorage.getUserData();

      if (tokenPair == null) return Left("Tokens found not found");
      if (userDetails == null || !userDetails.containsKey('user_id')) {
        return Left("User Details not found");
      }

      var userId = userDetails['user_id'];

      var headers = {
        'Authorization': 'Bearer ${tokenPair.access}',
        'Content-Type': 'application/json',
      };

      var requestBody = {
        ...cycle.toJson(),
        'user_id': userId,
      };

      var response = await http.post(
          Uri.parse("${Constants.BASE_URL}/cycles/add-cycle/"),
          headers: headers,
          body: jsonEncode(requestBody));

      if (response.statusCode == 201) {
        var jsonData = jsonDecode(response.body);
        debugPrint("Response body of Cycles: $jsonData");

        if (jsonData.containsKey('cycle')) {
          print("Got it!!!");
          return Right(Cycle.fromJson(jsonData['cycle']));
        } else {
          return Left("Cycle object is empty");
        }
      } else {
        debugPrint("Error sending cycle. Status code ${response.statusCode}");
        return Left("Error sending cycle. Status code ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("Error sending cycle: $e");
      return Left("Error sending cycle: $e");
    }
  }

  Future<Either<String, Cycle>> getCycle(int id) async {
    try {
      final tokenPair = await LocalStorage.getToken();
      final userDetails = await LocalStorage.getUserData();

      if (tokenPair == null) return Left("Tokens found not found");
      if (userDetails == null || !userDetails.containsKey('user_id')) {
        return Left("User Details not found");
      }

      var userId = userDetails['user_id'];

      var headers = {
        'Authorization': 'Bearer ${tokenPair.access}',
        'Content-Type': 'application/json',
      };

      var response = await http.get(
        Uri.parse(
            "${Constants.BASE_URL}/cycles/get-cycle/$id/?user_id=$userId"),
        headers: headers,
      );

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);

        if (jsonData.containsKey('cycle')) {
          return Right(Cycle.fromJson(jsonData));
        } else {
          return Left("Cycle object is empty");
        }
      } else {
        return Left("Error getting cycle. Status code: ${response.statusCode}");
      }
    } catch (e) {
      return Left("Error getting cycle: $e");
    }
  }

  Future<Either<String, List<Cycle>>> getAllCycles() async {
    try {
      final tokenPair = await LocalStorage.getToken();
      final userDetails = await LocalStorage.getUserData();

      if (tokenPair == null) return Left("Tokens found not found");
      if (userDetails == null || !userDetails.containsKey('user_id')) {
        return Left("User Details not found");
      }

      var userId = userDetails['user_id'];

      var headers = {
        'Authorization': 'Bearer ${tokenPair.access}',
        'Content-Type': 'application/json',
      };

      var response = await http.get(
        Uri.parse("${Constants.BASE_URL}/cycles/all-cycles/?user_id=$userId"),
        headers: headers,
      );

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);

        if (jsonData.containsKey('cycles')) {
          List<Cycle> cycles = (jsonData['cycles'] as List)
              .map((cycle) => Cycle.fromJson(cycle))
              .toList();
          return Right(cycles);
        } else {
          return Left("Cycles object is empty");
        }
      } else {
        return Left(
            "Error fetching all cycles. Status code: ${response.statusCode}");
      }
    } catch (e) {
      return Left("Error fetching all cycles: $e");
    }
  }

  Future<Either<String, Cycle>> editCycle(Cycle cycle) async {
    try {
      final tokenPair = await LocalStorage.getToken();
      final userDetails = await LocalStorage.getUserData();

      if (tokenPair == null) return Left("Tokens found not found");
      if (userDetails == null || !userDetails.containsKey('user_id')) {
        return Left("User Details not found");
      }

      var userId = userDetails['user_id'];

      var headers = {
        'Authorization': 'Bearer ${tokenPair.access}',
        'Content-Type': 'application/json',
      };

      if (cycle.id == null) {
        return Left("Cycle ID is required to edit a cycle.");
      }
      Map<String, dynamic> body = cycle.toJson();
      body['user_id'] = userId;

      var response = await http.patch(
        Uri.parse("${Constants.BASE_URL}/cycles/edit-cycle/${cycle.id}/"),
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        if (jsonData.containsKey('cycle')) {
          return Right(Cycle.fromJson(jsonData));
        } else {
          return Left("Cycle object is empty");
        }
      } else {
        return Left("Error editing cycle. Status code: ${response.statusCode}");
      }
    } catch (e) {
      return Left("Error editing cycle: $e");
    }
  }

  Future<Either<String, String>> deleteCycle(int? id) async {
    try {
      final tokenPair = await LocalStorage.getToken();
      final userDetails = await LocalStorage.getUserData();

      if (tokenPair == null) return Left("Tokens found not found");
      if (userDetails == null || !userDetails.containsKey('user_id')) {
        return Left("User Details not found");
      }

      var userId = userDetails['user_id'];

      var headers = {
        'Authorization': 'Bearer ${tokenPair.access}',
        'Content-Type': 'application/json',
      };

      if (id == null) {
        return Left("Cycle ID is required to edit a cycle.");
      }

      var response = await http.delete(
          Uri.parse("${Constants.BASE_URL}/cycles/edit-cycle/$id/"),
          headers: headers,
          body: userId);

      if (response.statusCode == 200) {
        return Right("Cycle successfully deleted");
      } else {
        return Left("Error deleting cycle. Status code ${response.statusCode}");
      }
    } catch (e) {
      return Left("Error deleting cycle: $e");
    }
  }
}
