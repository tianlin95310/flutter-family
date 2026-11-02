import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class HttpService {
  late Dio _dio;

  late http.Client _client;

  Dio get dio => _dio;

  set dio(Dio value) {
    _dio = value;
  }

  http.Client get client => _client;

  set client(http.Client value) {
    _client = value;
  }

  HttpService();

  Future<Stream<String>> makeStreamRequest(dynamic url, dynamic data, {Future? abortTrigger}) async {
    final request = http.AbortableRequest('POST', Uri.parse(url), abortTrigger: abortTrigger)
      ..headers['Accept'] = 'text/event-stream'
      ..headers['Content-Type'] = 'application/json'
      ..body = jsonEncode(data);

    final streamedResponse = await _client.send(request);
    if (streamedResponse.statusCode != 200) {
      throw Exception('SSE failed: ${streamedResponse.statusCode}');
    }
    return streamedResponse.stream.transform(utf8.decoder).transform(LineSplitter());
  }
}

class HttpHelper {
//  类似于构造函数私有化
  HttpHelper._();

  static HttpService? _service;

  static HttpService get service => _service ??= _setupHttpService();

  static Dio _createDio() {
    final dio = Dio();

    dio.options.connectTimeout = Duration(seconds: 60);

    if (kDebugMode) {
      dio.interceptors.add(LogInterceptor());
    }

    dio.interceptors.add(InterceptorsWrapper(onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
      handler.next(options);
    }, onResponse: (Response<dynamic> response, ResponseInterceptorHandler handler) {
      handler.next(response);
    }, onError: (DioException error, ErrorInterceptorHandler handler) {
      handler.next(error);
    }));

    return dio;
  }

  static http.Client _createHttpClient() {
    final client = http.Client();
    return client;
  }

  static HttpService _setupHttpService() {
    final request = HttpService();

    request.dio = _createDio();
    request.client = _createHttpClient();

    return request;
  }
}
