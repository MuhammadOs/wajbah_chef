import 'package:dartz/dartz.dart';

abstract class MenuItemRepository {
  Future<Either<Exception, Map<String, dynamic>>> fetchMenuItemsByID(String chefId, String token);
  String? getToken();
}
