import 'package:flutter/material.dart';

class ProfileItemsDivider extends StatelessWidget {
  const ProfileItemsDivider({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 0,
      indent: width * 0.05,
      endIndent: width * 0.05,
    );
  }
}