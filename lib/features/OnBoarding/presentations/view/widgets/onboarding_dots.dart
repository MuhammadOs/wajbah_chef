import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../../core/constants/constants.dart';
import '../../../data/onboarding_data.dart';

class OnboardingDots extends StatelessWidget {
  const OnboardingDots({
    super.key,
    required this.controller,
  });

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: content.length,
      effect: ExpandingDotsEffect(
        dotHeight: 9,
        dotWidth: 9,
        activeDotColor: wajbah_primary,
        dotColor: wajbah_primary.withOpacity(.5),
      ),
    );
  }
}
