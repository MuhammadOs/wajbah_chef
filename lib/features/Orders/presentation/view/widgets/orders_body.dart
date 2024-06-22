import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wajbah_chef/features/home/data/model/order_model.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../view_model/track_orders_cubit.dart';
import '../../view_model/track_orders_state.dart';
import 'custom_tabbar.dart';
import 'serving_now_item.dart';

class OrdersBody extends StatefulWidget {
  final String chefId;

  const OrdersBody({
    Key? key,
    required this.chefId,
  }) : super(key: key);

  @override
  _OrdersBodyState createState() => _OrdersBodyState();
}

class _OrdersBodyState extends State<OrdersBody> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Order> preparingOrders = [];
  List<Order> cookingOrders = [];
  List<Order> deliveringOrders = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    context.read<TrackOrdersCubit>().initialize(chefId: widget.chefId, active: true);
    context.read<TrackOrdersCubit>().trackOrders();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          CustomAppBar(title: 'My Orders'),
          CustomTabBar(
            width: MediaQuery.of(context).size.width,
            tabController: _tabController,
          ),
          Expanded(
            child: BlocBuilder<TrackOrdersCubit, TrackState>(
              builder: (context, state) {
                if (state is TrackStateLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is TrackStateLoaded) {
                  final orders = state.orders.result ?? [];
                  preparingOrders = orders.where((order) => order.status == 'Preparing').toList();
                  cookingOrders = orders.where((order) => order.status == 'Cooking').toList();
                  deliveringOrders = orders.where((order) => order.status == 'Delivering').toList();

                  print('Preparing Orders Count: ${preparingOrders.length}');
                  print('Cooking Orders Count: ${cookingOrders.length}');
                  print('Delivering Orders Count: ${deliveringOrders.length}');

                  return TabBarView(
                    controller: _tabController,
                    children: [
                      buildPreparingOrderList(),
                      buildCookingOrderList(),
                      buildDeliveringOrderList(),
                    ],
                  );
                } else if (state is TrackErrorState) {
                  return Center(child: Text('Error: ${state.errMessage}'));
                } else {
                  return Center(child: Text('No Orders Available'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPreparingOrderList() {
    return ListView.builder(
      itemCount: preparingOrders.length,
      itemBuilder: (context, index) {
        final order = preparingOrders[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: ServingListItem(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            state: order.status!,
            OrderId: order.orderId ?? 0,
            Client_name: '${order.fname ?? ''} ${order.lname ?? ''}',
            Client_location: order.address ?? 'Unknown location',
            Order_Price: order.totalPrice ?? 0,
            Order_name: order.menuItems?.map((item) => item.name).join(', ') ?? 'No items',
            Order_item_count: order.menuItems?.length ?? 0,
            Available_time: order.estimatedTime ?? 'Unknown time',
          ),
        );
      },
    );
  }

  Widget buildCookingOrderList() {
    return ListView.builder(
      itemCount: cookingOrders.length,
      itemBuilder: (context, index) {
        final order = cookingOrders[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: ServingListItem(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            OrderId: order.orderId ?? 0,
            state: order.status!,
            Client_name: '${order.fname ?? ''} ${order.lname ?? ''}',
            Client_location: order.address ?? 'Unknown location',
            Order_Price: order.totalPrice ?? 0,
            Order_name: order.menuItems?.map((item) => item.name).join(', ') ?? 'No items',
            Order_item_count: order.menuItems?.length ?? 0,
            Available_time: order.estimatedTime ?? 'Unknown time',
          ),
        );
      },
    );
  }

  Widget buildDeliveringOrderList() {
    return ListView.builder(
      itemCount: deliveringOrders.length,
      itemBuilder: (context, index) {
        final order = deliveringOrders[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: ServingListItem(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            OrderId: order.orderId ?? 0,
            state: order.status!,
            Client_name: '${order.fname ?? ''} ${order.lname ?? ''}',
            Client_location: order.address ?? 'Unknown location',
            Order_Price: order.totalPrice ?? 0,
            Order_name: order.menuItems?.map((item) => item.name).join(', ') ?? 'No items',
            Order_item_count: order.menuItems?.length ?? 0,
            Available_time: order.estimatedTime ?? 'Unknown time',
          ),
        );
      },
    );
  }
}
