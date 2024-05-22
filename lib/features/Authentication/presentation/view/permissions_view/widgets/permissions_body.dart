import 'package:flutter/material.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/styles.dart';
// ignore: must_be_immutable
class PermissionsBody extends StatelessWidget {
  String mainText;
  String subText;
  String image;
  PermissionsBody(
      {super.key,
      required this.width,
      required this.height,
      required this.mainText,
      required this.subText,
      required this.image});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          image,
          width: width,
          height: height / 3,
        ),
        const SizedBox(
          height: 25,
        ),
        Text(
          mainText,
          style: Styles.titleMedium.copyWith(fontSize: 24),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          subText,
          style: Styles.titleSmall.copyWith(color: wajbah_gray),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
