import 'package:wajbah_chef/core/errors/error_model.dart';

abstract class AuthState {}

class InitialAuthState extends AuthState {}

class RegisteringAuthState extends AuthState {}

class RegisterSuccessfullyState extends AuthState {
}

class LoginAuthState extends AuthState {}

class LoginLoad extends AuthState {}

class LoginSuccessfullyState extends AuthState {
  final String token;
  final String chef_id;
  final bool active;
  final String resturant_name;
  final String chef_mail;
  final double wallet;
  final String password;
  final String chef_Fname;
  final String chef_Lname;
  final int  phone_number;
  final String description;
  final DateTime birthdata;
  final String governorate;
  final String city;
  final String street;
  final String buildingNumber;
  final String floor;
  final String flatNumber;
  

  LoginSuccessfullyState({required this.chef_id,required this.token,required this.active , required this.resturant_name , required this.chef_Fname, required this.chef_Lname,required this.description,required this.chef_mail,required this.password,required this.phone_number,required this.wallet ,required this.birthdata , required this.city , required this.governorate , required this.street , required this.floor , required this.flatNumber , required this.buildingNumber});
}

class LoggingOutState extends AuthState {}

class LoggedOutState extends AuthState {}

class AuthErrorState extends AuthState {
  ErrorModel errorModel;

  AuthErrorState({required this.errorModel});
}
