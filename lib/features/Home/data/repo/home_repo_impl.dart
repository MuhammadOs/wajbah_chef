import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wajbah_chef/core/errors/error_types.dart';
import 'package:wajbah_chef/features/Home/data/repo/home_remote_source.dart';

class HomeRepoImpl {
  final HomeRemoteSource homeRemoteSource;

  HomeRepoImpl({required this.homeRemoteSource});

  Future<Either<Exception, void>> activeSwitch(String chefId, String token) async {
    try {
      await homeRemoteSource.activeSwitch(chefId, token);
      return const Right(null);
    } catch (exception) {
      if (exception is DioError) {
        return Left(exception);
      } else {
        return Left(CashError()); // Replace with appropriate custom error type
      }
    }
  }

  Future<Either<Exception, Map<String, dynamic>>> fetchOrdersByChefId(String chefId, String token) async {
    try {
      final result = await homeRemoteSource.fetchOrdersByChefId(chefId, token);
      return Right(result);
    } catch (exception) {
      if (exception is DioError) {
        return Left(exception);
      } else {
        return Left(CashError()); // Replace with appropriate custom error type
      }
    }
  }
}
