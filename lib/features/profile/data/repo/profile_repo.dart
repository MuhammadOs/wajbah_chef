import 'package:dartz/dartz.dart';

abstract class ProfileRepository {
  Future<Either<Exception, Map<String, dynamic>>> updateProfile(String token);
  String? getToken();
}
