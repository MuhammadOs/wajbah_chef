import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/codicon.dart';
import 'package:wajbah_chef/core/styles.dart';

class OfflineRequest extends StatelessWidget {
  const OfflineRequest({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.3,
      width: width * 0.85,
      decoration: BoxDecoration(
        color: Color(0xffFFE2E2),
        borderRadius: BorderRadius.circular(23),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Iconify(
            Codicon.eye_closed,
            size: 50,
            color: Color(0xffC54E28),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Text(
            'Looks Like You are Closed',
            style: Styles.titleMedium
                .copyWith(color: Color(0xffC54E28), fontSize: 18),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          SizedBox(
            width: width * 0.52,
            child: Text(
              'Turn on Online Mode So you Will\n\t\t\t\t\t\t\t\t\tbe able to Recive Orders',
              style: Styles.titleMedium
                  .copyWith(color: Color(0xffC54E28), fontSize: 12),
            ),
          ),
        ]),
      ),
    );
  }
}
