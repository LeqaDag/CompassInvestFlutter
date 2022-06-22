// ignore_for_file: prefer_initializing_formals, non_constant_identifier_names

import 'dart:convert';
import 'package:compassinvest/api/backend_api.dart';
import 'package:http/http.dart' as http;

class Trading {
  String baseUrl = allTrades;
  String lastTradeUrl = lastTradingUserById;
  String lastTrade = lastTrading;

  Future<List> getAllTrading() async {
    try {
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error("Server Error");
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<List> getLastTradingUser(int id, int trade_id) async {
    try {
      var response = await http.get(
          Uri.parse(lastTradeUrl + id.toString() + "/" + trade_id.toString()));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error("Server Error");
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<List> getLastTrading() async {
    print(lastTrade);
    try {
      var response = await http.get(Uri.parse(lastTrade));
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
