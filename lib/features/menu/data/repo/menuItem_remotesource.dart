import 'package:dio/dio.dart';
import 'package:wajbah_chef/core/constants/constants.dart';

class MenuRemoteSource {
  final Dio dio;

  MenuRemoteSource({required this.dio});

  Future<Map<String, dynamic>> fetchMenuItemsByID(String chefId, String token) async {
    try {
      final response = await dio.get(
        AppConstants.menuItems,
        queryParameters: {'id': chefId},
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
