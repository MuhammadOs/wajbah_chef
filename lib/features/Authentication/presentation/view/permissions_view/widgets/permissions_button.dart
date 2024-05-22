import 'package:flutter/material.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/styles.dart';

// ignore: must_be_immutable
class PermissionsButton extends StatelessWidget {
  String text;
  PermissionsButton(
      {super.key, required this.width, required this.text, this.onPressed});

  final double width;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width * 0.43,
      height: 52,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0, backgroundColor: wajbah_primary,
            shadowColor: wajbah_primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            splashFactory: NoSplash.splashFactory,
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: Styles.button.copyWith(
              color: Colors.white,
            ),
          )),
    );
  }
}
