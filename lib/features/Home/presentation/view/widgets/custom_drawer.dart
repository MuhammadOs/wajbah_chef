import 'package:flutter/material.dart';
import 'package:iconify_flutter/icons/ant_design.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/ion.dart';
import 'package:iconify_flutter/icons/line_md.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:iconify_flutter/icons/uis.dart';
import 'package:wajbah_chef/core/constants/constants.dart';
import 'package:wajbah_chef/core/styles.dart';
import 'package:wajbah_chef/features/Home/presentation/view/widgets/drawer_listtile.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      surfaceTintColor: wajbah_primary,
      shadowColor: wajbah_primary,
      child: Padding(
        padding: EdgeInsets.only(
          top: height * 0.04,
        ),
        child: ListView(
          children: [
            ListTile(
              leading: ClipRRect(
                  borderRadius: BorderRadius.circular(32),
                  child: Image.asset('assets/images/Wajbah_Finale.png')),
              title: Text(
                'Willy\'s Kitchen',
                style: Styles.titleMedium.copyWith(fontSize: 16),
              ),
              subtitle: Text(
                'Willy@gmail.com',
                style: Styles.titleMedium
                    .copyWith(fontSize: 13, color: wajbah_gray),
              ),
            ),
            drawer_listtile(
              name: 'Profile',
              icon: LineMd.account,
            ),
            drawer_listtile(
              name: 'Scheduled Orders',
              icon: Uis.schedule,
            ),
            drawer_listtile(
              name: 'Customized Orders',
              icon: AntDesign.profile_filled,
            ),
            drawer_listtile(
              name: 'Marketing',
              icon: Ion.share_social_sharp,
            ),
            const Divider(
              color: wajbah_gray,
              endIndent: 60,
              indent: 20,
            ),
            drawer_listtile(
              name: 'Rate App',
              icon: MaterialSymbols.star,
            ),
            drawer_listtile(
              name: 'Need a Help ?',
              icon: Ic.sharp_question_answer,
            ),
            drawer_listtile(
              name: 'Refer and Earn',
              icon: AntDesign.gift_filled,
            ),
            drawer_listtile(
              name: 'About Us ?',
              icon: Bi.exclamation_circle_fill,
            ),
          ],
        ),
      ),
    );
  }
}
