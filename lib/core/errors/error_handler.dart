import 'package:dio/dio.dart';
import 'package:wajbah_chef/core/errors/error_model.dart';
import 'package:wajbah_chef/core/errors/error_types.dart';
import 'package:wajbah_chef/core/networking/api_error.dart';

class ErrorHandler implements Exception {
  static late ErrorModel errorModel;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      errorModel = _handleError(error);
    } else if (error is CashError) {
      errorModel = DataSource.cacheError.getFailure();
    } else if (error is ResponseError) {
      errorModel = ErrorModel(message: error.message, code: error.statusCode);
    } else {
      errorModel = DataSource.defaultError.getFailure();
    }
  }

  ErrorModel _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return DataSource.connectTimeout.getFailure();
      case DioExceptionType.sendTimeout:
        return DataSource.sendTimeout.getFailure();
      case DioExceptionType.receiveTimeout:
        return DataSource.receiveTimeout.getFailure();
      case DioExceptionType.badResponse:
        if (error.response != null &&
            error.response?.statusCode != null &&
            error.response?.statusMessage != null) {
          return ErrorModel.fromJson({
            "message": error.response?.statusMessage,
            "code": int.parse(error.response!.statusCode.toString())
          });
        } else {
          return DataSource.defaultError.getFailure();
        }
      case DioExceptionType.unknown:
        if (error.response != null &&
            error.response?.statusCode != null &&
            error.response?.statusMessage != null) {
          return ErrorModel.fromJson(error.response!.data);
        } else {
          return DataSource.defaultError.getFailure();
        }
      case DioExceptionType.cancel:
        return DataSource.cancel.getFailure();
      case DioExceptionType.connectionError:
        return DataSource.defaultError.getFailure();
      case DioExceptionType.badCertificate:
        return DataSource.defaultError.getFailure();
    }
  }
}
