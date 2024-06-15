import 'package:dartz/dartz.dart';

abstract class TrackRepository {
  Future<Either<Exception, Map<String, dynamic>>> trackOrdersByChefId(String chefId, String token);
  String? getToken();
}
