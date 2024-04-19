import 'package:flutter/material.dart';
import 'package:wajbah_chef/core/constants/constants.dart';
import 'package:wajbah_chef/core/sizeConfig.dart';
import 'package:wajbah_chef/core/styles.dart';
import 'package:wajbah_chef/core/widgets/custom_appbar.dart';
import 'package:wajbah_chef/features/Home/data/requests_item.dart';
import 'package:wajbah_chef/features/Home/presentation/view/widgets/requests_listitem.dart';
import 'package:wajbah_chef/features/Orders/data/served.dart';
import 'package:wajbah_chef/features/Orders/data/serving_now.dart';
import 'package:wajbah_chef/features/Orders/presentation/view/widgets/custom_tabbar.dart';
import 'package:wajbah_chef/features/Orders/presentation/view/widgets/serving_now_item.dart';

class OrdersBody extends StatefulWidget {
  const OrdersBody({Key? key}) : super(key: key);

  @override
  _OrdersBodyState createState() => _OrdersBodyState();
}

class _OrdersBodyState extends State<OrdersBody>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
          CustomAppBar(title: 'My Orders'),
          CustomTabBar(width: width, tabController: _tabController),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: Serving_data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: ServingListItem(
                            height: height,
                            width: width,
                            OrderId: Serving_data[index].Request_ID,
                            Client_name: Serving_data[index].Requester_name,
                            Client_location:
                                Serving_data[index].Requester_location,
                            Order_Price: Serving_data[index].Item_price,
                            Order_name: Serving_data[index].Item_name,
                            Order_item_count: Serving_data[index].num_of_items,
                            Available_time: Serving_data[index].Available_time),
                      );
                    }),
                ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: Served_data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: ServingListItem(
                            height: height,
                            width: width,
                            OrderId: Served_data[index].Request_ID,
                            Client_name: Served_data[index].Requester_name,
                            Client_location:
                                Served_data[index].Requester_location,
                            Order_Price: Served_data[index].Item_price,
                            Order_name: Served_data[index].Item_name,
                            Order_item_count: Served_data[index].num_of_items,
                            Available_time: Served_data[index].Available_time),
                      );
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
