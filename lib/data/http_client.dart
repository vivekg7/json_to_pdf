import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

_parseAndDecode(String response) {
  return jsonDecode(response);
}

_parseJsonBackground(String text) {
  return compute(_parseAndDecode, text);
}

class HttpClient {
  static const int CONNECTION_TIMEOUT = 50000;
  static const int RECEIVE_TIMEOUT = 50000;

  static const String BASE_URL = "http://";

  HttpClient._() {
    initializeDio();
  }

  Dio _dio;

  void initializeDio() {
    _dio = Dio();
    (_dio.transformer as DefaultTransformer).jsonDecodeCallback = _parseJsonBackground;
    _dio.options.baseUrl = BASE_URL;
    _dio.options.connectTimeout = CONNECTION_TIMEOUT;
    _dio.options.receiveTimeout = RECEIVE_TIMEOUT;
  }

  static final HttpClient _singleton = HttpClient._();

  static HttpClient get instance => _singleton;

  Future<Response> getRequest(String path, Map<String, dynamic> header) async {
    var requestOption = Options(
      headers: header,
    );
    return await _dio.get(path, options: requestOption);
  }

}