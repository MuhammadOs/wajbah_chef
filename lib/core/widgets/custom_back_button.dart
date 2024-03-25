import 'package:flutter/material.dart';

import '../constants/constants.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
              color: wajbah_buttons, borderRadius: BorderRadius.circular(10)),
          child: const Icon(
            Icons.keyboard_arrow_left,
            size: 28,
          )),
    );
  }
}
