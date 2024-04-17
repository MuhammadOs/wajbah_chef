import 'package:flutter/material.dart';

import '../../../../../core/styles.dart';

class HintText extends StatelessWidget {
  const HintText({super.key, required this.hintText});
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, bottom: 0),
      child: Text(
        hintText,
        style: Styles.hint,
      ),
    );
  }
}
