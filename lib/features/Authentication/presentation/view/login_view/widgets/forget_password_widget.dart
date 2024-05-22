import 'package:flutter/material.dart';
import 'package:wajbah_chef/core/styles.dart';
import 'package:wajbah_chef/features/Authentication/presentation/view/ResetPassword/password_reset_verification_view.dart';

class ForgetPasswordWidget extends StatelessWidget {
  const ForgetPasswordWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text('Forget password?',
          style: Styles.titleSmall.copyWith(fontSize: 14)),
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (c) {
            return const ResetPasswordVerification();
          },
        ));
      },
    );
  }
}