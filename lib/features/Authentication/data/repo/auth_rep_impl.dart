import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wajbah_chef/core/errors/error_types.dart';
import 'package:wajbah_chef/features/Authentication/data/model/login/login_model.dart';
import 'package:wajbah_chef/features/Authentication/data/model/login/login_response_model.dart';
import 'package:wajbah_chef/features/Authentication/data/model/register/Chef.dart';
import 'package:wajbah_chef/features/Authentication/data/repo/auth_remote_source.dart';

class AuthRepoImpl {
  final AuthRemoteResource authRemoteResource;

  AuthRepoImpl({required this.authRemoteResource});

  Future<Either<Exception, void>> register(Chef registerModel) async {
    try {
      await authRemoteResource.register(registerModel);
      return Right(null);
    } catch (exception) {
      if (exception is DioException) {
        return Left(exception);
      } else {
        return Left(CashError());
      }
    }
  }

  Future<Either<Exception, LoginResponseModel>> login(
      LoginModel loginModel) async {
    try {
      final Response response = await authRemoteResource.login(loginModel);
      final loginResponse = LoginResponseModel.fromJson(response.data);

      if (loginResponse.isSuccess == true) {
        return Right(loginResponse);
      } else {
        return Left(ResponseError(
          statusCode: loginResponse.statusCode ?? 500,
          message: loginResponse.errorMessages?.join(', ') ?? 'Unknown error',
        ));
      }
    } catch (exception) {
      if (exception is DioException) {
        return Left(exception);
      } else {
        return Left(CashError());
      }
    }
  }

  Future<Either<Exception, void>> logOut() async {
    try {
      await authRemoteResource.logOut();
      return const Right(null);
    } catch (exception) {
      if (exception is DioException) {
        return Left(exception);
      } else {
        return Left(CashError());
      }
    }
  }
}
