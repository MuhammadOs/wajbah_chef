import 'package:dartz/dartz.dart';
import 'package:wajbah_chef/features/Authentication/data/model/login/login_model.dart';
import 'package:wajbah_chef/features/Authentication/data/model/register/Chef_register_request.dart';

abstract class AuthRepository {
  Future<Either<Exception,void>> register(ChefRegisterRequest registerModel);
  Future<Either<Exception,String>> login (LoginModel loginModel);
  Future<Either<Exception,void>> logOut ();
  String? getToken ();
}