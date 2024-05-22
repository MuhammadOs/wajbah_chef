import 'package:flutter/material.dart';
import 'package:wajbah_chef/core/constants/constants.dart';
import 'package:wajbah_chef/core/styles.dart';

class RememberMeRow extends StatelessWidget {
  const RememberMeRow({super.key, required this.rememberMe, this.onChanged});

  final bool rememberMe;
  final void Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: rememberMe,
          activeColor: wajbah_primary,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: VisualDensity.compact,
          onChanged: onChanged,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        Text("Remember me", style: Styles.titleSmall.copyWith(fontSize: 14)),
      ],
    );
  }
}
