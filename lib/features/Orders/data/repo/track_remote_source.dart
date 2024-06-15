import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:wajbah_chef/core/constants/constants.dart';

class TrackRemoteSource {
  final Dio dio;

  TrackRemoteSource({required this.dio});

  Future<Map<String, dynamic>> trackOrdersByChefId(String chefId, String token) async {
    try {
      final response = await dio.get(
        AppConstants.trackOrders,
        queryParameters: {'chefid': chefId},
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      return response.data;
    } catch (e) {
      if (e is DioError) {
        if (kDebugMode) {
          print('DioException: ${e.response?.data}');
        }
      }
      rethrow;
    }
  }
}
