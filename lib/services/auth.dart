// ignore_for_file: unused_element

import 'dart:convert';

import 'package:compassinvest/services/dio.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth extends ChangeNotifier {
  bool _isLoggedIn = false;

  bool get authenticated => _isLoggedIn;

  Future<void> login({required Map creds}) async {
    Dio.Response response =
        await dio().post("/sanctum/token", data: jsonEncode(creds));
    print(response.data.toString());
    _isLoggedIn = true;
    notifyListeners();
  }

  void logout() {
    _isLoggedIn = false;
    notifyListeners();
  }


}
