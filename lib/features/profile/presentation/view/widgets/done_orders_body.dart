import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wajbah_chef/features/home/data/model/order_model.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../../../Orders/presentation/view/widgets/serving_now_item.dart';
import '../../../../Orders/presentation/view_model/track_orders_cubit.dart';
import '../../../../Orders/presentation/view_model/track_orders_state.dart';

class DoneOrdersBody extends StatefulWidget {
  final String chefId;
  final String token;

  const DoneOrdersBody({
    Key? key,
    required this.chefId,
    required this.token,
  }) : super(key: key);

  @override
  _DoneOrdersBodyState createState() => _DoneOrdersBodyState();
}

class _DoneOrdersBodyState extends State<DoneOrdersBody> {
  List<Order> doneOrders = [];

  @override
  void initState() {
    super.initState();
    context.read<TrackOrdersCubit>().initialize(chefId: widget.chefId, active: true);
    context.read<TrackOrdersCubit>().trackOrders();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          CustomAppBar(title: 'Previous Orders'),
          Expanded(
            child: BlocBuilder<TrackOrdersCubit, TrackState>(
              builder: (context, state) {
                if (state is TrackStateLoading) {
                  return const Center(child: CircularProgressIndicator.adaptive());
                } else if (state is TrackStateLoaded) {
                  final orders = state.orders.result ?? [];
                  doneOrders = orders.where((order) => order.status == 'Done').toList();

                  print('Done Orders Count: ${doneOrders.length}');

                  return buildDoneOrderList();
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

  Widget buildDoneOrderList() {
    return ListView.builder(
      itemCount: doneOrders.length,
      itemBuilder: (context, index) {
        final order = doneOrders[index];
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
