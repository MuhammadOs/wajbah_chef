import 'package:flutter/material.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/styles.dart';
import 'hint_text.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField(
      {super.key,
      required this.passwordController,
      required this.isPassword,
      this.onPressed,
      this.hintText});

  final TextEditingController passwordController;
  final bool isPassword;
  final void Function()? onPressed;
  final String? hintText;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HintText(hintText: hintText ?? ""),
        TextFormField(
          controller: passwordController,
          decoration: InputDecoration(
            labelStyle: Styles.titleSmall.copyWith(color: wajbah_black),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 5.0,
              ),
            ),
            filled: true,
            fillColor: wajbah_buttons,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              borderSide: BorderSide(
                color: wajbah_gray,
                width: 1.0,
              ),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(14)),
              borderSide: BorderSide(
                color: wajbah_buttons,
                width: 1.0,
              ),
            ),
            suffixIcon: ElevatedButton(
                style: ButtonStyle(
                  splashFactory: NoSplash.splashFactory,
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                  elevation: MaterialStateProperty.all(0),
                ),
                onPressed: onPressed,
                child: isPassword
                    ? const Icon(
                        Icons.visibility,
                        color: wajbah_primary,
                      )
                    : const Icon(
                        Icons.visibility_off,
                        color: wajbah_primary,
                      )),
          ),
          keyboardType: TextInputType.number,
          obscureText: isPassword,
          onFieldSubmitted: (String value) {
            debugPrint(value);
          },
          onChanged: (String value) {
            debugPrint(value);
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'password must not be empty !';
            }
            return null;
          },
        ),
      ],
    );
  }
}
