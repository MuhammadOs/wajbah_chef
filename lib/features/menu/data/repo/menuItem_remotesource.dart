import 'package:dio/dio.dart';
import 'package:wajbah_chef/core/constants/constants.dart';
import 'package:wajbah_chef/features/menu/data/model/get_menu_item_model/menu_item_model.dart';
import 'package:wajbah_chef/features/menu/data/model/menu_item.dart';
import 'package:wajbah_chef/features/menu/data/model/post_menu_item_model/Post_menu_item_request.dart';

class MenuRemoteSource {
  final Dio dio;

  MenuRemoteSource({required this.dio});

  Future<Response> fetchMenuItemsByID(String chefId, String token) async {
    final response = await dio.get(
      AppConstants.menuItems,
      queryParameters: {'id': chefId},
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );
    return response;
  }

  Future<Response> postMenuItem(PostMenuItemRequest postMenuItemRequest,
      String token, String chefId) async {
    final response = await dio.post(
      AppConstants.postMenuItem,
      data: postMenuItemRequest.toJson(),
      queryParameters: {'id': chefId},
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );
    return response;
  }
}
