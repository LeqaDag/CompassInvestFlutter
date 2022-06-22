// ignore_for_file: prefer_typing_uninitialized_variables, import_of_legacy_library_into_null_safe

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Network {
  final String _url = 'http://192.168.0.213:8000/api/';
  var token;

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = jsonDecode(localStorage.getString('token'))['token'];
  }

  authData(data, apiUrl) async {
    var fullUrl = _url + apiUrl;
    return await http.post(fullUrl as Uri,
        body: jsonEncode(data), headers: _setHeaders());
  }

  getData(apiUrl) async {
    var fullUrl = _url + apiUrl;
    print(fullUrl);
    return await http.get(Uri.parse(fullUrl), headers: _setHeaders());
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };

  postData(data, apiUrl) async {
    var fullUrl = _url + apiUrl;

    return await http.post(Uri.parse(fullUrl),
        body: jsonEncode(data), headers: _setHeaders());
  }

    updatetData(data, apiUrl) async {
    var fullUrl = _url + apiUrl;

    return await http.put(Uri.parse(fullUrl),
        body: jsonEncode(data), headers: _setHeaders());
  }
}
