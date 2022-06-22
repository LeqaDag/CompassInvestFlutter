// ignore_for_file: unused_element, import_of_legacy_library_into_null_safe, unused_field, prefer_typing_uninitialized_variables

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

const String serverUrl = "http://192.168.0.213:8000/api";

const String login = "$serverUrl/user/login";
const String allTrades = "$serverUrl/trade";
const String allTradingRules = "$serverUrl/rule";
const String allPhotos = "$serverUrl/photo";
const String settings = "$serverUrl/setting";
const String settingClose = "$serverUrl/setting/close";

const String contactUs = "$serverUrl/contact-us";
const String newRecommendations = "$serverUrl/recommendation/new";
const String oldRecommendations = "$serverUrl/recommendation/old";
const String freeRecommendations = "$serverUrl/recommendation/free";
const String recommendationById = "$serverUrl/recommendation/";
const String entryPointsById = "$serverUrl/recommendation/entry/";
const String targetPointsById = "$serverUrl/recommendation/target/";
const String allTradesProfit = "$serverUrl/user/trade/profit/";
const String allTradesProfitForUser = "$serverUrl/user/trade/all/profit/";
const String allRecommendationProfitById =
    "$serverUrl/user/recommendation/profit/";
const String allUsers = "$serverUrl/user/all/";
const String changePictureById = "$serverUrl/user/updateImage/";
const String updateUserById = "$serverUrl/user/updateProfile/";
const String shareProfitByUserId = "$serverUrl/user/trade/profit/";
const String shareRecommendationByUserId =
    "$serverUrl/user/recommendation/profit/";
const String lastTradingUserById = "$serverUrl/trade/last/";
const String lastTrading = "$serverUrl/trading/last";
const String allEbooks = "$serverUrl/ebook";
const String allCryptoCurrencies = "$serverUrl/currency";

const String allWeeklyProfitsUser = "$serverUrl/user/weekly/profit/";
const String allMonthlyProfitsUser = "$serverUrl/user/monthly/profit/";
const String editProfitById = "$serverUrl/user/trade/profit/share/edit/";
const String updateProfitById = "$serverUrl/user/trade/profit/share/edit/";

class BackendOperations {
  var token;

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = jsonDecode(localStorage.getString('token'))['token'];
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };

  postData(data, apiUrl) async {
    return await http.post(Uri.parse(apiUrl),
        body: jsonEncode(data), headers: _setHeaders());
  }
}
