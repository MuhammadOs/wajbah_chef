import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:wajbah_chef/core/constants/constants.dart';
import '../model/profile_model.dart';

class ProfileRemoteSource {
  final Dio dio;

  ProfileRemoteSource({required this.dio});

  Future<void> updateProfile(ProfileUpdateRequest profileUpdateRequest, String token) async {
    try {
      final response = await dio.put(
        '${AppConstants.baseUrl}${AppConstants.updateProfile}/${profileUpdateRequest.chefId}', // Append chefId here
        data: profileUpdateRequest.toJson(),
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );
      return response.data;
    } catch (e) {
      if (e is DioError) {
        if (kDebugMode) {
          debugPrint('DioException: ${e.response?.data}');
        }
      }
      rethrow;
    }
  }
}
