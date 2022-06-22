import 'dart:convert';
import 'package:compassinvest/api/backend_api.dart';
import 'package:http/http.dart' as http;

class Recommendation {
  String baseNewUrl = newRecommendations;
  String baseOldUrl = oldRecommendations;
  String baseFreeUrl = freeRecommendations;
  String recommendationByIdUrl = recommendationById;
  String entryPointsIdUrl = entryPointsById;
  String targetPointsByIdUrl = targetPointsById;
  String recommendationProfitByIdUrl = allRecommendationProfitById;

  Future<List> getAllNewRecommendations() async {
    try {
      var response = await http.get(Uri.parse(baseNewUrl));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error("Server Error");
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<List> getAllOldRecommendations() async {
    try {
      var response = await http.get(Uri.parse(baseOldUrl));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error("Server Error");
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<List> getAllFreeRecommendations() async {
    try {
      var response = await http.get(Uri.parse(baseFreeUrl));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error("Server Error");
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<List> getRecommendationById(int recommendationId) async {
    try {
      var response = await http
          .get(Uri.parse(recommendationByIdUrl + recommendationId.toString()));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error("Server Error");
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<List> getEntryPointsById(int recommendationId) async {
    try {
      var response = await http
          .get(Uri.parse(entryPointsIdUrl + recommendationId.toString()));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error("Server Error");
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<List> getTargetPointsById(int recommendationId) async {
    try {
      var response = await http
          .get(Uri.parse(targetPointsByIdUrl + recommendationId.toString()));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error("Server Error");
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future getAllProfits(int userId) async {
    try {
      var response = await http
          .get(Uri.parse(recommendationProfitByIdUrl + userId.toString()));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error("Server Error");
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
