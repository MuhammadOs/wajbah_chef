import 'package:flutter/material.dart';
import 'package:wajbah_chef/core/constants/constants.dart';
import 'package:wajbah_chef/core/styles.dart';

import 'hint_text.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.usernameController,
      this.hintText,
      this.onSaved});

  final TextEditingController usernameController;
  final String? hintText;
  final void Function(String? value)? onSaved;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HintText(hintText: hintText ?? ""),
        const SizedBox(
          height: 5,
        ),
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
              borderRadius: BorderRadius.all(Radius.circular(15)),
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
              return '$hintText must not be empty !';
            }
            return null;
          },
          onSaved: onSaved,
        ),
      ],
    );
  }
}
