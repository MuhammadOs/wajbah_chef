import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:iconify_flutter/icons/foundation.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/icon_park_twotone.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:iconify_flutter/icons/teenyicons.dart';
import 'package:wajbah_chef/core/constants/constants.dart';
import 'package:wajbah_chef/core/sizeConfig.dart';
import 'package:wajbah_chef/core/styles.dart';
import 'package:wajbah_chef/core/widgets/custom_appbar.dart';
import 'package:wajbah_chef/features/Dashboard/presentation/view/widgets/large_dashboard_container.dart';
import 'package:wajbah_chef/features/Dashboard/presentation/view/widgets/small_dashboard_container.dart';
import 'package:wajbah_chef/features/brand/presentation/view/brand_view.dart';
import 'package:wajbah_chef/features/market/presentation/view/market_view.dart';

class DashBoardBody extends StatelessWidget {
  const DashBoardBody({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;
    return SafeArea(
        child: Column(
      children: [
        CustomAppBar(title: 'Dashboard'),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (c) {
                          return Container();
                        },
                      ));
                    },
                    child: LargeDashboardContainer(
                      height: height,
                      width: width,
                      name: 'General Rec.',
                      color: 0xffFEB930,
                      icon: Bi.star_fill,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SmallDashboardContainer(
                        height: height,
                        width: width,
                        name: 'Partnerships',
                        color: 0xff0095FF,
                        icon: Mdi.handshake,
                      ),
                      SmallDashboardContainer(
                          height: height,
                          width: width,
                          color: 0xff329189,
                          name: 'Finance',
                          icon: Ic.round_account_balance_wallet)
                    ],
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (c) {
                              return const MarketView();
                            },
                          ));
                        },
                        child: SmallDashboardContainer(
                          height: height,
                          width: width,
                          name: 'Market',
                          color: 0xffB54EF7,
                          icon: IconParkTwotone.weixin_market,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (c) {
                              return const BrandView();
                            },
                          ));
                        },
                        child: SmallDashboardContainer(
                            height: height,
                            width: width,
                            color: 0xffFF926F,
                            name: 'Brand',
                            icon: Foundation.pricetag_multiple),
                      )
                    ],
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  LargeDashboardContainer(
                    height: height,
                    width: width,
                    name: 'Operations',
                    color: 0xffBF729B,
                    icon: Teenyicons.adjust_horizontal_solid,
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }
}
