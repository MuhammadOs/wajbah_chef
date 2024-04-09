import 'package:flutter/material.dart';

import '../../../../../core/constants/constants.dart';

class CustomNextButton extends StatelessWidget {
  const CustomNextButton({
    super.key,
    required this.controller,
  });

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: wajbah_buttons, borderRadius: BorderRadius.circular(10)),
      width: 40,
      height: 40,
      child: IconButton(
        icon: const Icon(Icons.arrow_forward_ios),
        onPressed: () {
          controller.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut);
        },
      ),
    );
  }
}
