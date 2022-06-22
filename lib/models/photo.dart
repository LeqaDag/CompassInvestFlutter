// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:convert';
import 'package:compassinvest/api/backend_api.dart';
import 'package:http/http.dart' as http;

class PhotoHome {
  String baseUrl = allPhotos;
  Future<List> getAllPhotos() async {
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
