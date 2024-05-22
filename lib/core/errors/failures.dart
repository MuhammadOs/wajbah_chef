/*import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure.Failure(this.errMessage);
}

class ServerFaliure extends Failure {
  ServerFaliure(super.errMessage) : super.Failure();

  factory ServerFaliure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFaliure('Connection Timeout With The Server');
      case DioExceptionType.sendTimeout:
        return ServerFaliure('Send Timeout With The Server');
      case DioExceptionType.receiveTimeout:
        return ServerFaliure('Recieve Timeout With The Server');
      case DioExceptionType.badCertificate:
        return ServerFaliure('Bad Cerificate');
      case DioExceptionType.badResponse:
        return ServerFaliure('Bad Reponse From the Server');
      case DioExceptionType.cancel:
        return ServerFaliure('Canceled Request with the Server');
      case DioExceptionType.connectionError:
        return ServerFaliure('Connection Error !');
      case DioExceptionType.unknown:
        return ServerFaliure('Unknown Server Error !');
    }
  }
}
*/
