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
    required this.token,
    required this.kitchenName,
    required this.chef_mail,
    required this.chef_Fname,
    required this.chef_Lname,
    required this.description,
    required this.phone_number,
    required this.wallet,
    required this.password,
  });

  final double height;
  final String token;
  final String kitchenName;
  final String chef_mail;
  final String chef_Fname;
  final String chef_Lname;
  final String description;
  final int phone_number;
  final double wallet;
  final String password;
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
                kitchenName,
                style: Styles.titleMedium.copyWith(fontSize: 16),
              ),
              subtitle: Text(
                chef_mail,
                style: Styles.titleMedium
                    .copyWith(fontSize: 13, color: wajbah_gray),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, 'profile');
                
              },
              child: drawer_listtile(
                name: 'Profile',
                icon: LineMd.account,
              
              ),
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
