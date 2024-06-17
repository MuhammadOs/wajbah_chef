import 'package:wajbah_chef/features/profile/data/model/profile_model.dart';

abstract class ProfileManagementState {}

class InitialProfileManagementState extends ProfileManagementState {}

class UpdatingProfile extends ProfileManagementState {}

class ProfileUpdated extends ProfileManagementState {
  final ProfileUpdateRequest requestModel;

  ProfileUpdated(this.requestModel);
}

class ProfileUpdateError extends ProfileManagementState {
  final String message;

  ProfileUpdateError(this.message);
}
