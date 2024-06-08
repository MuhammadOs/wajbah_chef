import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wajbah_chef/core/errors/error_handler.dart';
import 'package:wajbah_chef/features/Authentication/data/model/login/login_model.dart';
import 'package:wajbah_chef/features/Authentication/data/model/login/login_response_model.dart';
import 'package:wajbah_chef/features/Authentication/data/model/register/Chef.dart';
import 'package:wajbah_chef/features/Authentication/data/repo/auth_rep_impl.dart';
import 'package:wajbah_chef/features/Authentication/presentation/view_model/auth_states.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepoImpl authRepoImpl;
  String? token;
  String? chefId;
  bool? active;

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
    final Either<Exception, LoginResponseModel> response =
        await authRepoImpl.login(loginModel);
    response.fold(
      (exception) {
        ErrorHandler.handle(exception);
        emit(AuthErrorState(errorModel: ErrorHandler.errorModel));
      },
      (loginResponse) {
        token = loginResponse.result?.token;
        chefId = loginResponse.result?.chef?.chefId;
        active = loginResponse.result?.chef?.active;
        emit(LoginSuccessfullyState(token: token!, chef_id: chefId!,active: active!));
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
          token = null;
          chefId = null;
          return LoggedOutState();
        },
      ),
    );
  }

  String? get getToken => token;
  String? get getChefId => chefId;
}

AuthCubit getAuthCubit(BuildContext context, {bool listen = false}) =>
    BlocProvider.of<AuthCubit>(context, listen: listen);
