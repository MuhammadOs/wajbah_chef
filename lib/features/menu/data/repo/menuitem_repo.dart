import 'package:dartz/dartz.dart';
import 'package:wajbah_chef/features/menu/data/model/get_menu_item_model/menu_item_model.dart';
import 'package:wajbah_chef/features/menu/data/model/menu_item.dart';
import 'package:wajbah_chef/features/menu/data/model/post_menu_item_model/Post_menu_item_request.dart';

abstract class MenuItemRepository {
  Future<Either<Exception, MenuItemModel>> fetchMenuItemsByID(
      String chefId, String token);

  Future<Either<Exception, Map<String, dynamic>>> postMenuItem(
      PostMenuItemRequest postMenuItemRequest, String token, String chefId);

  String? getToken();
}
