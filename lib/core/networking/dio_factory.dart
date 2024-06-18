import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:wajbah_chef/core/constants/constants.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    Duration timeOut = const Duration(minutes: 2);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.baseUrl = AppConstants.baseUrl
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;

      // Disable caching for specific endpoints
      dio!.interceptors.add(
        InterceptorsWrapper(
          onRequest: (RequestOptions options, handler) {
            // Add cache-control headers to disable caching for login endpoint
            if (options.path == '/UserChefAuth/login') {
              options.headers['Cache-Control'] = 'no-cache';
              options.headers['Pragma'] = 'no-cache';
            }
            return handler.next(options);
          },
        ),
      );

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
    }

    return dio!;
  }
}
