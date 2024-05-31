import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wajbah_chef/core/errors/error_handler.dart';
import 'package:wajbah_chef/features/Authentication/data/model/login/login_model.dart';
import 'package:wajbah_chef/features/Authentication/data/model/register/Chef.dart';
import 'package:wajbah_chef/features/Authentication/data/model/register/Chef_register_request.dart';
import 'package:wajbah_chef/features/Authentication/data/repo/auth_rep_impl.dart';
import 'package:wajbah_chef/features/Authentication/presentation/view_model/auth_states.dart';


class AuthCubit extends Cubit<AuthState> {
  final AuthRepoImpl authRepoImpl;
  String? _token; // Store the token

  AuthCubit({required this.authRepoImpl}) : super(InitialAuthState());

  Future<void> register(Chef chefRegisterRequest) async {
    emit(RegisteringAuthState());
    final Either<Exception, void> response =
    await authRepoImpl.register(chefRegisterRequest);
    emit(
      response.fold(
            (exception) {
          ErrorHandler.handle(exception);
          return AuthErrorState(errorModel: ErrorHandler.errorModel);
        },
            (token) => RegisterSuccessfullyState(),
      ),
    );
  }

  Future<void> login(LoginModel loginModel) async {
    emit(LoginAuthState());
    final Either<Exception, String> response =
    await authRepoImpl.login(loginModel);
    response.fold(
          (exception) {
        ErrorHandler.handle(exception);
        emit(AuthErrorState(errorModel: ErrorHandler.errorModel));
      },
          (token) {
        _token = token; // Store the token upon successful login
        emit(LoginSuccessfullyState(token: token));
      },
    );
  }

  Future<void> logOut() async {
    emit(LoggingOutState());
    final Either<Exception, void> response = await authRepoImpl.logOut();
    emit(
      response.fold(
            (exception) {
          ErrorHandler.handle(exception);
          return AuthErrorState(errorModel: ErrorHandler.errorModel);
        },
            (_) {
          _token = null;
          return LoggedOutState();
        },
      ),
    );
  }

  String? get token => _token;
}

AuthCubit getAuthCubit(BuildContext context, {bool listen = false}) =>
    BlocProvider.of<AuthCubit>(context, listen: listen);
