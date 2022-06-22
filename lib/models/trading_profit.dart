// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:convert';
import 'package:compassinvest/api/backend_api.dart';
import 'package:http/http.dart' as http;

class TradingProfit {
  String baseUrl = allTradesProfit;
  String allTradesProfits = allTradesProfitForUser;
  String allWeeklyProfits = allWeeklyProfitsUser;
  String allMonthlyProfits = allMonthlyProfitsUser;
  String editProfit = editProfitById;
  String updateProfit = updateProfitById;

  Future getAllTrading(int userId) async {
    try {
      var response = await http.get(Uri.parse(baseUrl + userId.toString()));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error("Server Error");
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<List> getAllTradingForUser(int userId, int tradeId) async {
    try {
      var response = await http.get(Uri.parse(
          allTradesProfits + userId.toString() + '/' + tradeId.toString()));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error("Server Error");
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<List> getAllWeeklyProfitsForUser(int userId) async {
    try {
      var response =
          await http.get(Uri.parse(allWeeklyProfits + userId.toString()));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error("Server Error");
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<List> getAllMontlyProfitsForUser(int userId) async {
    try {
      var response =
          await http.get(Uri.parse(allMonthlyProfits + userId.toString()));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error("Server Error");
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<List> getProfitById(int id) async {
    try {
      var response = await http.get(Uri.parse(editProfit + id.toString()));
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
