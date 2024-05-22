import 'package:dartz/dartz.dart';
import 'package:wajbah_chef/features/Authentication/data/model/login/login_model.dart';

abstract class AuthRepository {
  //Future<Either<Exception,String>> register(RegisterModel registerModel);
  Future<Either<Exception,String>> login (LoginModel loginModel);
  Future<Either<Exception,void>> logOut ();
  String? getToken ();
}