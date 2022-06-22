import 'dart:convert';
import 'package:compassinvest/api/backend_api.dart';
import 'package:http/http.dart' as http;

class User {
  String baseUrl = allUsers;
  Future<List> getAllUsers() async {
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
}