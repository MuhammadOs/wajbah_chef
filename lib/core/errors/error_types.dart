class CashError implements Exception {}

class DefaultError implements Exception {}

class ResponseError implements Exception {
  final int statusCode;
  final String message;

  ResponseError({required this.statusCode, required this.message});
}
