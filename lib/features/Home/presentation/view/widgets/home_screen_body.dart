import 'package:flutter/material.dart';
import 'package:iconify_flutter/icons/bxs.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:wajbah_chef/core/constants/constants.dart';
import 'package:wajbah_chef/core/sizeConfig.dart';
import 'package:wajbah_chef/features/Dashboard/presentation/view/dashboard_view.dart';
import 'package:wajbah_chef/features/Home/data/model/request_model.dart';
import 'package:wajbah_chef/features/Home/presentation/view/widgets/home_header.dart';
import 'package:wajbah_chef/features/Home/presentation/view/widgets/offline_request_container.dart';
import 'package:wajbah_chef/features/Home/presentation/view/widgets/requests_listitem.dart';
import 'package:wajbah_chef/features/Home/presentation/view/widgets/shortcut_item.dart';
import 'package:wajbah_chef/features/Orders/presentation/view/orders_view.dart';
import 'package:wajbah_chef/features/home/data/model/order_model.dart';
import 'package:wajbah_chef/features/menu/presentation/view/menu_items_view.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody(
      {super.key,
      required this.token,
      required this.online,
      required this.orders,
      required this.chef_id});

  final bool online;
  final RequestModel orders;
  final String token;
  final String chef_id;

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  final TimerService _timerService = TimerService();

  @override
  void dispose() {
    _timerService.cancelTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;

    List<Order> orders = widget.orders.result ?? [];

    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Visibility(
              visible: widget.online,
              child: HomeHeader(
                HeadText: 'New Requests',
                HeadHint: orders
                    .where((order) => order.status == "Pending")
                    .length
                    .toString(),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.3,
            child: widget.online
                ? ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: orders.length,
                    itemBuilder: (BuildContext context, int index) {
                      final order = orders[index];
                      if (order.status == "Pending") {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: RequestsListItem(
                              height: height,
                              width: width,
                              OrderId: order.orderId!.toString(),
                              PhoneNumber: order.deliveryNumber!.toString(),
                              Client_name: order.fname! + order.lname!,
                              Client_location: order.address!,
                              Order_Price: order.totalPrice!,
                              quantities: order.quanitities!,
                              Available_time: '03:00',
                              Condition: "Pending",
                              menuItems: order.menuItems),
                        );
                      } else {
                        return Container(); // Handle non-pending orders if necessary
                      }
                    },
                  )
                : OfflineRequest(height: height, width: width),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: HomeHeader(
              HeadText: 'Shortcuts',
              HeadHint: '',
            ),
          ),
          SizedBox(
            height: height * 0.55,
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: height * 0.02,
              children: [
                ShortcutItem(
                  width: width,
                  height: height,
                  inColor: 0xff0093C6,
                  ContainerColor: 0xffD4EBF3,
                  icon: Ic.twotone_fact_check,
                  name: 'Orders',
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (c) {
                        return const OrdersView();
                      },
                    ));
                  },
                ),
                ShortcutItem(
                  width: width,
                  height: height,
                  inColor: 0xffBE3C26,
                  ContainerColor: 0xffF8ECEA,
                  icon: MaterialSymbols.bar_chart,
                  name: 'Dashboard',
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (c) {
                        return const DashboardView();
                      },
                    ));
                  },
                ),
                ShortcutItem(
                  width: width,
                  height: height,
                  inColor: 0xff7FB427,
                  ContainerColor: 0xffF0F6E6,
                  icon: Bxs.food_menu,
                  name: 'Menu',
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (c) {
                        return MenuView(
                            chefId: widget.chef_id, token: widget.token);
                      },
                    ));
                  },
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
    );
  }
}
