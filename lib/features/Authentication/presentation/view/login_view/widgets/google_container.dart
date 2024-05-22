import 'package:flutter/material.dart';

class GoogleIconContainer extends StatelessWidget {
  const GoogleIconContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 70,
        height: 50,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Image.asset(
          'assets/images/authentication/google_logo.png',
        ),
      ),
    );
  }
}