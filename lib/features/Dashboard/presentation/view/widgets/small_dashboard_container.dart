import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:wajbah_chef/core/constants/constants.dart';
import 'package:wajbah_chef/core/styles.dart';

class SmallDashboardContainer extends StatelessWidget {
  const SmallDashboardContainer({
    super.key,
    required this.height,
    required this.width,
    required this.color,
    required this.name,
    required this.icon,
  });

  final double height;
  final double width;
  final int color;
  final String name;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.24,
      width: width * 0.45,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(23),
          color: Color(color).withOpacity(0.3)),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(23),
                color: Color(color),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Iconify(
                  icon,
                  color: wajbah_white,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              name,
              style: Styles.titleMedium.copyWith(fontSize: 18),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Total Sales',
              style: Styles.titleSmall.copyWith(fontSize: 14),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '+ 8% from yesterday',
              style:
                  Styles.titleSmall.copyWith(fontSize: 14, color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
