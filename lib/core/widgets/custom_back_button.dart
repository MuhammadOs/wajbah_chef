import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ri.dart';
import 'package:iconify_flutter/icons/tabler.dart';

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
              color: wajbah_primary, borderRadius: BorderRadius.circular(23)),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Iconify(
              Ri.arrow_go_back_fill,
              size: 15,
              color: wajbah_white,
            ),
          )),
    );
  }
}
