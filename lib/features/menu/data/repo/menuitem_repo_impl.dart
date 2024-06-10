import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wajbah_chef/core/errors/error_types.dart';
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
        return Left(exception); // Return DioError as Left
      } else {
        return Left(CashError()); // Return CashError for other exceptions
      }
    }
  }
}
