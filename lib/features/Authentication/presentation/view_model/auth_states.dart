import 'package:wajbah_chef/core/errors/error_model.dart';

abstract class AuthState {}

class InitialAuthState extends AuthState {}

class RegisteringAuthState extends AuthState {}

class RegisterSuccessfullyState extends AuthState {
}

class LoginAuthState extends AuthState {}

class LoginSuccessfullyState extends AuthState {
  final String token;
  final String chef_id;
  final bool active;
  

  LoginSuccessfullyState( {required this.chef_id,required this.token,required this.active});
}

class LoggingOutState extends AuthState {}

class LoggedOutState extends AuthState {}

class AuthErrorState extends AuthState {
  ErrorModel errorModel;

  AuthErrorState({required this.errorModel});
}
