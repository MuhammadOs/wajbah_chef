import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:wajbah_chef/core/constants/constants.dart';
import 'package:wajbah_chef/core/sizeConfig.dart';
import 'package:wajbah_chef/core/styles.dart';
import 'package:wajbah_chef/core/widgets/custom_appbar.dart';
import 'package:wajbah_chef/features/brand/data/brand_data.dart';
import 'package:wajbah_chef/features/brand/presentation/view/widgets/bar_chart_widget.dart';
import 'package:wajbah_chef/features/brand/presentation/view/widgets/brand_tabbar.dart';
import 'package:wajbah_chef/features/market/presentation/view/widgets/line_chart_widget.dart';

class MarketBody extends StatefulWidget {
  const MarketBody({super.key});

  @override
  State<MarketBody> createState() => _MarketBodyState();
}

class _MarketBodyState extends State<MarketBody>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late String _dropdownvalue = 'Reviews Report';
  late int _selectedTabIndex = 2;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _dropdownvalue = 'Reviews Report';
    _tabController.addListener(() {
      setState(() {
        _selectedTabIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;
    return SafeArea(
      child: Column(
        children: [
          CustomAppBar(title: 'Brand'),
          BrandTabbar(width: width, tabController: _tabController),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Graphs',
                        style: Styles.titleMedium.copyWith(fontSize: 18),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Container(
                      height: height * 0.5,
                      width: width * 0.9,
                      decoration: BoxDecoration(
                        color: wajbah_white,
                        border: Border.all(color: wajbah_gray),
                        borderRadius: BorderRadius.circular(23),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                        value: _dropdownvalue,
                                        icon: const Iconify(
                                          Ic.baseline_keyboard_arrow_down,
                                          color: wajbah_black,
                                        ),
                                        items: [
                                          DropdownMenuItem<String>(
                                            value: 'Reviews Report',
                                            child: Text(
                                              'Reviews Report',
                                              style: Styles.titleMedium
                                                  .copyWith(fontSize: 14),
                                            ),
                                          ),
                                          DropdownMenuItem<String>(
                                            value: 'Sales Figures',
                                            child: Text('Sales Figures',
                                                style: Styles.titleMedium
                                                    .copyWith(fontSize: 14)),
                                          ),
                                        ],
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            _dropdownvalue =
                                                newValue ?? 'Preparing';
                                          });
                                        }),
                                  ),
                                  Text(
                                    '2017 - 2018',
                                    style: Styles.titleMedium.copyWith(
                                        fontSize: 14, color: wajbah_gray),
                                  )
                                ],
                              ),
                            ),
                            LineChartWidget()
                          ],
                        ),
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
