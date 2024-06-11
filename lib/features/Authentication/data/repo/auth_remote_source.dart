import 'package:dio/dio.dart';
import 'package:wajbah_chef/core/constants/constants.dart';
import 'package:wajbah_chef/features/Authentication/data/model/login/login_model.dart';
import 'package:wajbah_chef/features/Authentication/data/model/register/Chef.dart';


class AuthRemoteResource {
  final Dio dio;

  AuthRemoteResource({required this.dio});

  Future<Response> register(Chef registerModel) async {
    return await dio.post(
      AppConstants.registerUrl,
      data: registerModel.toJson(),
    );
  }

  Future<Response> login(LoginModel loginModel) async {
    final Response response = await dio.post(
      AppConstants.loginUrl,
      data: loginModel.toJson(),
    );
    return response;
  }

  Future<void> logOut() async {
    await dio.post(AppConstants.logOutUrl);
  }
}
