import 'package:dio/dio.dart';
import 'package:wajbah_chef/core/constants/constants.dart';
import 'package:wajbah_chef/features/menu/data/model/menu_item_model.dart';

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
      print('Response data: ${response.data}');
      return response.data;
    } catch (e) {
      if (e is DioException) {
        print('DioError: ${e.message}');
        print('DioError Response: ${e.response?.data}');
      }
      throw e;
    }
  }

  Future<Response> postMenuItem(MenuItem menuItem, String token) async {
    try {
      final response = await dio.post(
        AppConstants.postMenuItem,
        data: menuItem.toJson(),
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      print('Post response: ${response.data}');
      return response;
    } catch (e) {
      if (e is DioError) {
        print('DioError: ${e.message}');
        print('DioError Response: ${e.response?.data}');
      }
      throw e;
    }
  }
}
