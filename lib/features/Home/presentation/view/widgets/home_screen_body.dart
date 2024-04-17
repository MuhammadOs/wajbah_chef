import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconify_flutter/icons/bxs.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:wajbah_chef/core/sizeConfig.dart';
import 'package:wajbah_chef/features/Home/data/requests_item.dart';
import 'package:wajbah_chef/features/Home/presentation/view/widgets/home_header.dart';
import 'package:wajbah_chef/features/Home/presentation/view/widgets/offline_request_container.dart';
import 'package:wajbah_chef/features/Home/presentation/view/widgets/requests_listitem.dart';
import 'package:wajbah_chef/features/Home/presentation/view/widgets/shortcut_item.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key, required this.online});
  final bool online;

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: HomeHeader(
              HeadText: 'New Requests',
              HeadHint: '2',
            ),
          ),
          SizedBox(
              height: height * 0.3,
              child: widget.online == true
                  ? ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: Requests_data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: RequestsListItem(
                              height: height,
                              width: width,
                              OrderId: Requests_data[index].Request_ID,
                              Client_name: Requests_data[index].Requester_name,
                              Client_location:
                                  Requests_data[index].Requester_location,
                              Order_Price: Requests_data[index].Item_price,
                              Order_name: Requests_data[index].Item_name,
                              Order_item_count:
                                  Requests_data[index].num_of_items,
                              Available_time:
                                  Requests_data[index].Available_time),
                        );
                      })
                  : OfflineRequest(height: height, width: width)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: HomeHeader(
              HeadText: 'Shortcuts',
              HeadHint: '',
            ),
          ),
          Row(
            children: [
              ShortcutItem(
                width: width,
                height: height,
                inColor: 0xff0093C6,
                ContainerColor: 0xffD4EBF3,
                icon: Ic.twotone_fact_check,
                name: 'Orders',
              ),
              ShortcutItem(
                width: width,
                height: height,
                inColor: 0xffBE3C26,
                ContainerColor: 0xffF8ECEA,
                icon: MaterialSymbols.bar_chart,
                name: 'Dashboard',
              ),
            ],
          ),
          SizedBox(
            height: height * 0.03,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Row(
              children: [
                ShortcutItem(
                  width: width,
                  height: height,
                  inColor: 0xff7FB427,
                  ContainerColor: 0xffF0F6E6,
                  icon: Bxs.food_menu,
                  name: 'Menu',
                ),
                ShortcutItem(
                  width: width,
                  height: height,
                  inColor: 0xff5A48D3,
                  ContainerColor: 0xffE7E5F5,
                  icon: Ph.chat_circle_dots_bold,
                  name: 'Inbox',
                ),
              ],
            ),
          ),
        ],
      ),
    ); //Column(
  }
}
