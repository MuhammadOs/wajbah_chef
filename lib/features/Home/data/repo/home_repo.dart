import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Exception, void>> activeSwitch(String chefId , String token);
  String? getToken();
}
