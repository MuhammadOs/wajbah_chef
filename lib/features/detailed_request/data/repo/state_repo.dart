import 'package:dartz/dartz.dart';

abstract class StateRepository {
  Future<Either<Exception, Map<String, dynamic>>> updateOrderState(int orderId, String state, String token);
  String? getToken();
}
