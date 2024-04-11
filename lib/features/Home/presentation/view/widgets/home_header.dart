import 'package:flutter/material.dart';
import 'package:wajbah_chef/core/styles.dart';

class HomeHeader extends StatelessWidget {
  HomeHeader({super.key, required this.HeadText, required this.HeadHint});
  String HeadText;
  String HeadHint;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          HeadText,
          style: Styles.titleSmall.copyWith(fontSize: 20),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          HeadHint,
          style: Styles.hint.copyWith(fontSize: 20),
        ),
      ],
    );
  }
}
