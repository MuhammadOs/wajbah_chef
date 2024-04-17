import 'package:flutter/material.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/styles.dart';
import '../../../data/onboarding_data.dart';

class OnboardingDiscription extends StatefulWidget {
  const OnboardingDiscription({
    super.key,
    required this.index,
  });

  final int index;

  @override
  State<OnboardingDiscription> createState() => _OnboardingDiscriptionState();
}

class _OnboardingDiscriptionState extends State<OnboardingDiscription> {
  @override
  Widget build(BuildContext context) {
    return Text(content[widget.index].description,
        style: Styles.titleSmall.copyWith(color: wajbah_gray));
  }
}
