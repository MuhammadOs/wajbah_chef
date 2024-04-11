import 'package:flutter/material.dart';
import 'package:wajbah_chef/core/styles.dart';

class CustomTextRich extends StatelessWidget {
  CustomTextRich({
    super.key,
    required this.FirstColor,
    required this.SecondColor,
    required this.firstText,
    required this.SecondText,
  });
  String firstText;
  String SecondText;
  Color FirstColor;
  Color SecondColor;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: firstText,
            style: Styles.titleMedium.copyWith(fontSize: 20, color: FirstColor),
          ),
          TextSpan(
            text: SecondText, // Set the text for this part
            style:
                Styles.titleMedium.copyWith(fontSize: 20, color: SecondColor),
          ),
        ],
      ),
    );
  }
}
