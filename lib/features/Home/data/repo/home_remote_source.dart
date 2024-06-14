import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:wajbah_chef/core/constants/constants.dart';

class HomeRemoteSource {
  final Dio dio;

  HomeRemoteSource({required this.dio});

  Future<void> activeSwitch(String chefId, String token) async {
    try {
      final response = await dio.post(
        AppConstants.ActiveSwitch,
        queryParameters: {'id': chefId},
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
          print('DioException: ${e.response?.data}');
        }
      }
      rethrow;
    }
  }

  Future<Map<String, dynamic>> fetchOrdersByChefId(
      String chefId, String token) async {
    try {
      final response = await dio.get(
        AppConstants.chefRequests,
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
