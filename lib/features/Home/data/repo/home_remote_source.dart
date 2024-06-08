import 'package:dio/dio.dart';
import 'package:wajbah_chef/core/constants/constants.dart';

class HomeRemoteSource {
  final Dio dio;

  HomeRemoteSource({required this.dio});

  Future<void> activeSwitch(String chefId, String token) async {
    try {
      final response = await dio.post(
        AppConstants.ActiveSwitch,
        queryParameters: {'id': chefId},  // Use queryParameters instead of data
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json', // Explicitly set content type
          },
        ),
      );
      print('Response status: ${response.statusCode}');
      print('Response data: ${response.data}');
    } catch (e) {
      if (e is DioException) {
        print('DioException: ${e.response?.data}');
      }
      throw e;
    }
  }

  Future<Map<String, dynamic>> fetchOrdersByChefId(String chefId, String token) async {
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
      if (e is DioException) {
        print('DioException: ${e.response?.data}');
      }
      throw e;
    }
  }
}
