import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'track_remote_source.dart';
import 'track_repo.dart';

class TrackRepoImpl implements TrackRepository {
  final TrackRemoteSource trackRemoteSource;

  TrackRepoImpl({required this.trackRemoteSource});

  @override
  Future<Either<Exception, Map<String, dynamic>>> trackOrdersByChefId(String chefId, String token) async {
    try {
      final result = await trackRemoteSource.trackOrdersByChefId(chefId, token);
      return Right(result);
    } catch (exception) {
      if (exception is DioError) {
        return Left(exception);
      } else {
        return Left(Exception('Unknown error occurred'));
      }
    }
  }

  @override
  String? getToken() {
    // Implement the method to retrieve token if needed
    return null;
  }
}
