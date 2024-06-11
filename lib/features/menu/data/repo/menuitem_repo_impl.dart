import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wajbah_chef/core/errors/error_types.dart';
import 'package:wajbah_chef/features/menu/data/model/menu_item_model.dart';
import 'package:wajbah_chef/features/menu/data/repo/menuItem_remotesource.dart';

class MenuItemRepoImpl {
  final MenuRemoteSource menuRemoteSource;

  MenuItemRepoImpl({required this.menuRemoteSource});

  Future<Either<Exception, Map<String, dynamic>>> fetchMenuItemsByID(String chefId, String token) async {
    try {
      final result = await menuRemoteSource.fetchMenuItemsByID(chefId, token);
      return Right(result);
    } catch (exception) {
      if (exception is DioException) {
        print('DioError: ${exception.message}');
        print('DioError Response: ${exception.response?.data}');
        return Left(exception);
      } else {
        print('Exception: ${exception.toString()}');
        return Left(CashError());
      }
    }
  }

  Future<Either<Exception, void>> postMenuItem(MenuItem postMenuItemModel, String token) async {
    try {
      await menuRemoteSource.postMenuItem(postMenuItemModel, token);
      return Right(null);
    } catch (exception) {
      if (exception is DioError) {
        print('DioError: ${exception.message}');
        print('DioError Response: ${exception.response?.data}');
        return Left(exception);
      } else {
        print('Exception: ${exception.toString()}');
        return Left(CashError());
      }
    }
  }
}
