import 'package:flutter/material.dart';
import '../../../../../../core/sizeConfig.dart';
import '../widgets/permissions_body.dart';
import '../widgets/permissions_button.dart';

class PasswordChanged extends StatefulWidget {
  const PasswordChanged({super.key});

  @override
  State<PasswordChanged> createState() => _PasswordChangedState();
}

class _PasswordChangedState extends State<PasswordChanged> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;
    debugPrint("$width");
    debugPrint("$height");
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PermissionsBody(
              width: width,
              height: height,
              mainText: 'Password Changed',
              subText:
                  'Your password was changed successfully\n\t\t\t\t\tkeep it safe and remeber it next time',
              image: 'assets/images/Password_changed.png'),
          PermissionsButton(
            width: width,
            text: "Login",
            onPressed: () {
              Navigator.pushNamed(context, 'login');
            },
          ),
        ],
      ),
    );
  }
}
