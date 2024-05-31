import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    Duration timeOut = const Duration(minutes: 2);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.baseUrl = 'https://wajbahapi.azurewebsites.net/api/'
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      if (kDebugMode) {
        dio?.interceptors.add(
          LogInterceptor(
            request: true,
            requestHeader: true,
            requestBody: true,
            responseHeader: true,
            responseBody: true,
            error: true,
          ),
        );
      }
      return dio!;
    } else {
      return dio!;
    }
  }
}
