import 'package:flutter/material.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/styles.dart';
import 'hint_text.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, required this.usernameController, this.hintText});

  final TextEditingController usernameController;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HintText(hintText: hintText ?? ""),
        TextFormField(
          controller: usernameController,
          style: Styles.titleSmall,
          decoration: InputDecoration(
            labelStyle: Styles.titleSmall.copyWith(
              color: wajbah_black,
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            filled: true,
            fillColor: wajbah_buttons,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(
                color: wajbah_gray,
                width: 1.0,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              borderSide: BorderSide(
                color: wajbah_gray,
                width: 1.0,
              ),
            ),
            disabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(
                color: wajbah_gray,
                width: 1.0,
              ),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(
                color: wajbah_buttons,
                width: 1.0,
              ),
            ),
          ),
          keyboardType: TextInputType.name,
          onFieldSubmitted: (String value) {
            debugPrint(value);
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'username must not be empty !';
            }
            return null;
          },
        ),
      ],
    );
  }
}
