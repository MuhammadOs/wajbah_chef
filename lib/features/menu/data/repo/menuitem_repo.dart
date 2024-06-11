import 'package:dartz/dartz.dart';
import 'package:wajbah_chef/features/menu/data/model/menu_item_model.dart';

abstract class MenuItemRepository {
  Future<Either<Exception, Map<String, dynamic>>> fetchMenuItemsByID(String chefId, String token);
  Future<Either<Exception, void>> postMenuItem(MenuItem menuItem, String token);
  String? getToken();
}
