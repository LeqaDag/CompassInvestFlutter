// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:io';

import 'package:dio/dio.dart';

Dio dio() {
  var dio = Dio();

  // Set default configs
  dio.options.baseUrl = 'http://192.168.1.5:8000/api';
  dio.options.connectTimeout = 5000; //5s
  dio.options.receiveTimeout = 3000;
  dio.options.headers = {
    HttpHeaders.acceptHeader: "accept: application/json",
  };

  return dio;
}
