import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wajbah_chef/core/errors/error_types.dart';
import 'state_remote_source.dart';

class StateRepoImpl {
  final StateRemoteSource stateRemoteSource;

  StateRepoImpl({required this.stateRemoteSource});

  Future<Either<Exception, Map<String, dynamic>>> updateOrderState(int orderId, String state, String token) async {
    try {
      final result = await stateRemoteSource.updateOrderState(orderId, state, token);
      return Right(result);
    } catch (exception) {
      if (exception is DioError) {
        return Left(exception);
      } else {
        return Left(CashError());  // Replace with appropriate custom error type
      }
    }
  }
}
