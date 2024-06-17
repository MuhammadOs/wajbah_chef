import 'package:flutter/material.dart';
import 'widgets/profile_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileData profileData = ModalRoute.of(context)!.settings.arguments as ProfileData;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ProfileBody(profileData: profileData),
    );
  }
}
