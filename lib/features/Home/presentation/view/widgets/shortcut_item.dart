import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:wajbah_chef/core/styles.dart';

class ShortcutItem extends StatelessWidget {
  const ShortcutItem({
    super.key,
    required this.width,
    required this.height,
    required this.name,
    required this.icon,
    required this.ContainerColor,
    required this.inColor,
  });

  final double width;
  final double height;
  final String name;
  final String icon;
  final int ContainerColor;
  final int inColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: width * 0.38,
        height: height * 0.24,
        decoration: BoxDecoration(
            color: Color(ContainerColor),
            borderRadius: BorderRadius.circular(23)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Iconify(
              icon,
              color: Color(inColor),
              size: 70,
            ),
            Text(
              name,
              style: Styles.titleMedium
                  .copyWith(fontSize: 16, color: Color(inColor)),
            )
          ],
        ),
      ),
    );
  }
}
