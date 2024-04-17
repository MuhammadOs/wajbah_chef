import 'package:flutter/material.dart';
import 'package:wajbah_chef/core/constants/constants.dart';
import 'package:wajbah_chef/core/styles.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
    required this.width,
    required TabController tabController,
  }) : _tabController = tabController;

  final double width;
  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: width * 0.88,
      decoration: BoxDecoration(
          color: wajbah_buttons, borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: TabBar(
          indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(16), color: wajbah_primary),
          indicatorSize: TabBarIndicatorSize
              .tab, // Use TabBarIndicatorSize.tab to match the tab width
          labelColor: wajbah_white,
          dividerColor: wajbah_buttons,
          labelStyle: Styles.titleSmall.copyWith(fontSize: 18),
          unselectedLabelColor: wajbah_black,
          controller: _tabController,
          tabs: const [
            Tab(
              text: 'Serving Now',
            ),
            Tab(
              text: 'Served',
            ),
          ],
        ),
      ),
    );
  }
}
