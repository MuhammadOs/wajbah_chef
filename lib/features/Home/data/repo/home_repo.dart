import 'package:dartz/dartz.dart';

abstract class HomeRepository {
  Future<Either<Exception, void>> activeSwitch(String chefId, String token);
  Future<Either<Exception, Map<String, dynamic>>> fetchOrdersByChefId(String chefId, String token);
  String? getToken();
}
