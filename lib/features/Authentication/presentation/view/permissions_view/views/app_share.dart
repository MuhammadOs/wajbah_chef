import 'package:flutter/material.dart';
import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/sizeConfig.dart';
import '../../../../../../core/styles.dart';
import '../widgets/permissions_body.dart';
import '../widgets/permissions_button.dart';

class ShareApp extends StatelessWidget {
  const ShareApp({super.key});

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
              image: 'assets/images/Share_app.png',
              mainText: 'We aims to expand widely',
              subText:
                  '\t\tDon\'t forget to share our application\nwith your friends so we can reach them'),
          PermissionsButton(
            width: width,
            text: "Sure, Share",
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'busy?',
                style: Styles.titleSmall
                    .copyWith(color: wajbah_gray, fontSize: 14),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, 'signup');
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.transparent,
                ),
                child: Text('Remind me later',
                    style: Styles.titleSmall
                        .copyWith(color: wajbah_primary, fontSize: 14)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
