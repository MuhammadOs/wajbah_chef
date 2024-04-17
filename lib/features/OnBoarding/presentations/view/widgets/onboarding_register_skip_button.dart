import 'package:flutter/material.dart';

import '../../../../../core/constants/constants.dart';
import '../../../data/onboarding_data.dart';

class OnboardingRegisterSkipButton extends StatelessWidget {
  const OnboardingRegisterSkipButton({
    super.key,
    required this.isLastPage,
    required this.controller,
  });

  final bool isLastPage;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        isLastPage ? 'Register ?' : 'Skip',
        style: const TextStyle(
            fontSize: 16, color: wajbah_gray, fontWeight: FontWeight.w700),
      ),
      onPressed: () {
        if (isLastPage) {
          //navigate to register view
          Navigator.pushNamed(context, 'register');
        } else {
          controller.jumpToPage(content.length - 1);
        }
      },
    );
  }
}
