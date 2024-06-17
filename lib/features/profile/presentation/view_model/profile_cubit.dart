import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wajbah_chef/features/profile/data/repo/profile_repo_impl.dart';
import 'package:wajbah_chef/features/profile/presentation/view_model/profile_state.dart';
import '../../data/model/profile_model.dart';

class ProfileCubit extends Cubit<ProfileManagementState> {
  final ProfileRepoImpl profileRepoImpl;
  final String token;

  ProfileCubit(this.token, {required this.profileRepoImpl})
      : super(InitialProfileManagementState());

  

  Future<void> updateProfile(ProfileUpdateRequest profileUpdateRequest) async {
    

    try {
      emit(UpdatingProfile());
      debugPrint('Updating Chef: ${profileUpdateRequest.chefId}');
      final response = await profileRepoImpl.updateProfile(profileUpdateRequest, token);
      emit(
        response.fold(
          (exception) => ProfileUpdateError(exception.toString()),
          (data) {
            final updatedProfile = ProfileUpdateRequest.fromJson(data);
            return ProfileUpdated(updatedProfile);
          },
        ),
      );
    } catch (e) {
      debugPrint('Error updating profile: $e');
      emit(ProfileUpdateError(e.toString()));
    }
  }

  String? get getToken => token;
}

ProfileCubit updateProfileCubit(BuildContext context, {bool listen = false}) =>
    BlocProvider.of<ProfileCubit>(context, listen: listen);
