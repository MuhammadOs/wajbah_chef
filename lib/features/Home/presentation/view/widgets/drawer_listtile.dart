import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:wajbah_chef/core/constants/constants.dart';
import 'package:wajbah_chef/core/styles.dart';

import '../../../../profile/presentation/view/widgets/profile_body.dart';

class drawer_listtile extends StatelessWidget {
  drawer_listtile({
    super.key,
    required this.name,
    required this.icon,
    this.destination,
    this.profileData,
  });

  String name;
  String icon;
  String? destination;
  ProfileData? profileData;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Iconify(
        icon,
        color: wajbah_black,
      ),
      title: Text(
        name,
        style: Styles.titleMedium.copyWith(fontSize: 16),
      ),
      onTap: () {
        if (destination != null) {
          if (destination == 'chef_profile' && profileData != null) {
            Navigator.pushNamed(
              context,
              destination!,
              arguments: profileData,
            );
          } else {
            Navigator.pushNamed(context, destination!);
          }
        }
      },
    );
  }
}
