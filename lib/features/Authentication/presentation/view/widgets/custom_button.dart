import 'package:flutter/material.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, this.onPressed, required this.text, required this.color});
  final void Function()? onPressed;
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0, backgroundColor: color,
          shadowColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          splashFactory: NoSplash.splashFactory,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: Styles.titleSmall.copyWith(color: Colors.white),
        ));
  }
}
