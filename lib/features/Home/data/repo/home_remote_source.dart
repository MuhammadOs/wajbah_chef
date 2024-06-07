import 'package:dio/dio.dart';
import 'package:wajbah_chef/core/constants/constants.dart';

class HomeRemoteSource {
  final Dio dio;

  HomeRemoteSource({required this.dio});

  Future<void> activeSwitch(String chefId , String token) async {
    await dio.post(
      AppConstants.activeSwitch,
      data: {'id': chefId},
    );
  }
}
