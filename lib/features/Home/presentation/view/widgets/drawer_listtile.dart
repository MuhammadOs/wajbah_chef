import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:wajbah_chef/core/constants/constants.dart';
import 'package:wajbah_chef/core/styles.dart';

class drawer_listtile extends StatelessWidget {
  drawer_listtile({
    super.key,
    required this.name,
    required this.icon,
    this.destination
  });
  String name;
  String icon;
  String? destination;

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
        Navigator.pushNamed(context, destination!);
      },
    );
  }
}
