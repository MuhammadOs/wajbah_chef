import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:wajbah_chef/core/constants/constants.dart';
import 'package:wajbah_chef/core/styles.dart';

class CustomInfoListtile extends StatelessWidget {
  String title;
  String subtitle;
  String Icon;

  CustomInfoListtile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.Icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Iconify(
            Icon,
            color: wajbah_green,
            size: 40,
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Styles.hint.copyWith(fontSize: 12),
              ),
              Text(
                subtitle,
                style: Styles.titleMedium.copyWith(fontSize: 16),
              ),
            ],
          )
        ],
      ),
    );
  }
}
