import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:wajbah_chef/core/constants/constants.dart';

class StateRemoteSource {
  final Dio dio;

  StateRemoteSource({required this.dio});

  Future<Map<String, dynamic>> updateOrderState(int orderId, String state, String token) async {
    try {
      final response = await dio.put(
        AppConstants.updateState,
        queryParameters: {
          'orderId': orderId,
          'status': state,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );
      return response.data;
    } catch (e) {
      if (e is DioError) {
        if (kDebugMode) {
          debugPrint('DioException: ${e.response?.data}');
        }
      }
      rethrow;
    }
  }
}
