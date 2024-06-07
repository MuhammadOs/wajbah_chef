import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wajbah_chef/core/errors/error_types.dart';
import 'package:wajbah_chef/features/Home/data/repo/home_remote_source.dart';
import 'package:wajbah_chef/features/Home/data/repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteSource homeremotesource;

  HomeRepoImpl({required this.homeremotesource});

  @override
  Future<Either<Exception, void>> activeSwitch(String chefId , String token) async {
    try {
      await homeremotesource.activeSwitch(chefId , token);
      return const Right(null);
    } catch (exception) {
      if (exception is DioException) {
        return Left(exception);
      } else {
        return Left(CashError());
      }
    }
  }

  @override
  String? getToken() {
    return null;
  }
}
