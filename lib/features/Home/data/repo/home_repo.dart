import 'package:dartz/dartz.dart';

abstract class HomeRepository {
  Future<Either<Exception,void>> activeSwitch ();
  String? getToken ();
}