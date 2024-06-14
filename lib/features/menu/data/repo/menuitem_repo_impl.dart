import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wajbah_chef/features/menu/data/model/get_menu_item_model/menu_item_model.dart';
import 'package:wajbah_chef/features/menu/data/model/post_menu_item_model/Post_menu_item_request.dart';
import 'package:wajbah_chef/features/menu/data/repo/menuItem_remotesource.dart';

class MenuItemRepoImpl {
  final MenuRemoteSource menuRemoteSource;

  MenuItemRepoImpl({required this.menuRemoteSource});

  Future<Either<Exception, MenuItemModel>> fetchMenuItemsByID(
      String chefId, String token) async {
    try {
      final Response response =
          await menuRemoteSource.fetchMenuItemsByID(chefId, token);
      final responseData = response.data;
      return Right(MenuItemModel.fromJson(responseData));
    } catch (exception) {
      return Left(Exception(exception.toString()));
    }
  }

  Future<Either<Exception, Map<String, dynamic>>> postMenuItem(
      PostMenuItemRequest postMenuItemRequest,
      String token,
      String chefId) async {
    try {
      final Response response = await menuRemoteSource.postMenuItem(
          postMenuItemRequest, token, chefId);
      final responseData = response.data;
      return Right(responseData);
    } catch (exception) {
      return Left(Exception(exception.toString()));
    }
  }
}
