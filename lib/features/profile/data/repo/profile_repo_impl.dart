import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wajbah_chef/core/errors/error_types.dart';
import '../model/profile_model.dart';
import 'profile_remote_source.dart';

class ProfileRepoImpl {
  final ProfileRemoteSource profileRemoteSource;

  ProfileRepoImpl({required this.profileRemoteSource});

  Future<Either<Exception, void>> updateProfile(ProfileUpdateRequest profileUpdateRequest, String token) async {
    try {
      final result = await profileRemoteSource.updateProfile(profileUpdateRequest, token);
      return const Right(null);
    } catch (exception) {
      if (exception is DioError) {
        return Left(exception);
      } else {
        return Left(CashError());  // Replace with appropriate custom error type
      }
    }
  }
}
