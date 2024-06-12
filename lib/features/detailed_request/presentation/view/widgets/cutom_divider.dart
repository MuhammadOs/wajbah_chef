import 'package:flutter/material.dart';
import 'package:wajbah_chef/core/constants/constants.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Divider(
        color: wajbah_gray.withOpacity(0.2),
        thickness: 10,
      ),
    );
  }
}
