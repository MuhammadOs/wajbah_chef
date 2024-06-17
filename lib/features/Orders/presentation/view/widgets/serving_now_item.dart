import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:wajbah_chef/core/constants/constants.dart';
import 'package:wajbah_chef/core/styles.dart';
import 'package:wajbah_chef/core/widgets/order_state.dart';
import 'package:wajbah_chef/features/Home/presentation/view/widgets/TextRich.dart';
import 'package:wajbah_chef/features/Orders/presentation/view_model/track_orders_cubit.dart';
import 'package:wajbah_chef/features/detailed_request/presentation/view_model/accept_order_cubit.dart';

class ServingListItem extends StatefulWidget {
  const ServingListItem({
    Key? key,
    required this.height,
    required this.width,
    required this.OrderId,
    required this.Client_name,
    required this.Client_location,
    required this.Order_Price,
    required this.Order_name,
    required this.Order_item_count,
    required this.Available_time,
    required this.state,
  }) : super(key: key);

  final double height;
  final String state;
  final double width;
  final int OrderId;
  final String Order_name;
  final int Order_item_count;
  final String Client_name;
  final String Client_location;
  final double Order_Price;
  final String Available_time;

  @override
  _ServingListItemState createState() => _ServingListItemState();
}

class _ServingListItemState extends State<ServingListItem> {
  late String _dropdownvalue;

  @override
  void initState() {
    super.initState();
    _dropdownvalue = widget.state;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height * 0.32,
      width: widget.width * 0.8,
      decoration: BoxDecoration(
        color: wajbah_white,
        border: Border.all(color: wajbah_gray),
        borderRadius: BorderRadius.circular(23),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      '#${widget.OrderId}',
                      style: Styles.titleSmall.copyWith(fontSize: 16),
                    ),
                    SizedBox(
                      width: widget.width * 0.03,
                    ),
                    const Iconify(
                      Ic.baseline_print,
                      color: Colors.yellow,
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: widget.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextRich(
                  FirstColor: wajbah_green,
                  SecondColor: wajbah_black,
                  firstText: '${widget.Order_item_count} x ',
                  SecondText: widget.Order_name,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${widget.Order_Price} EGP',
                        style: Styles.titleMedium.copyWith(fontSize: 18),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: widget.height * 0.02,
            ),
            Row(
              children: [
                const Iconify(
                  Ic.baseline_account_circle,
                  color: wajbah_green,
                ),
                SizedBox(
                  width: widget.width * 0.01,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Customer',
                      style: Styles.titleSmall.copyWith(
                          color: wajbah_gray, fontSize: 10),
                    ),
                    SizedBox(
                      height: widget.height * 0.005,
                    ),
                    Text(
                      widget.Client_name,
                      style: Styles.titleSmall.copyWith(fontSize: 13),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: widget.height * 0.01,
            ),
            Row(
              children: [
                const Iconify(
                  Ic.baseline_location_on,
                  color: wajbah_green,
                ),
                SizedBox(
                  width: widget.width * 0.01,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Location',
                      style: Styles.titleSmall.copyWith(
                          color: wajbah_gray, fontSize: 10),
                    ),
                    SizedBox(
                      height: widget.height * 0.005,
                    ),
                    Text(
                      widget.Client_location,
                      style: Styles.titleSmall.copyWith(fontSize: 13),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (widget.state == 'Delivering') ...[
              InkWell(
                onTap: () {
                  _acceptOrder('Done');
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: wajbah_primary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Center(
                      child: Text(
                        'Ready To Deliver',
                        style: Styles.titleMedium
                            .copyWith(fontSize: 14, color: wajbah_white),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8),
            ],
                DropdownButton(
                  value: _dropdownvalue,
                  icon: const Iconify(
                    Ic.baseline_keyboard_arrow_down,
                    color: wajbah_black,
                  ),
                  items: _buildDropdownItems(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _dropdownvalue = newValue!;
                      _acceptOrder(newValue);
                      OrderState.updateState(newValue);
                      context.read<TrackOrdersCubit>().trackOrders();
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> _buildDropdownItems() {
    final items = <DropdownMenuItem<String>>[];

    if (_dropdownvalue == 'Preparing') {
      items.add(DropdownMenuItem<String>(
        value: 'Preparing',
        child: Text(
          'Preparing',
          style: Styles.titleMedium.copyWith(fontSize: 14),
        ),
      ));
      items.add(DropdownMenuItem<String>(
        value: 'Cooking',
        child: Text(
          'Cooking',
          style: Styles.titleMedium.copyWith(fontSize: 14),
        ),
      ));
      items.add(DropdownMenuItem<String>(
        value: 'Delivering',
        child: Text(
          'Delivering',
          style: Styles.titleMedium.copyWith(fontSize: 14),
        ),
      ));
    } else if (_dropdownvalue == 'Cooking') {
      items.add(DropdownMenuItem<String>(
        value: 'Cooking',
        child: Text(
          'Cooking',
          style: Styles.titleMedium.copyWith(fontSize: 14),
        ),
      ));
      items.add(DropdownMenuItem<String>(
        value: 'Delivering',
        child: Text(
          'Delivering',
          style: Styles.titleMedium.copyWith(fontSize: 14),
        ),
      ));
    } else if (_dropdownvalue == 'Delivering') {
      items.add(DropdownMenuItem<String>(
        value: 'Delivering',
        child: Text(
          'Delivering',
          style: Styles.titleMedium.copyWith(fontSize: 14),
        ),
      ));
      items.add(DropdownMenuItem<String>(
        value: 'Done',
        child: Text(
          'Received',
          style: Styles.titleMedium.copyWith(fontSize: 14),
        ),
      ));
    }

    return items;
  }

  void _acceptOrder(String newState) {
    final stateCubit = context.read<StateCubit>();
    stateCubit.initialize(
      orderId: widget.OrderId,
      state: newState,
    );
    stateCubit.updateOrderState();

    if (newState == 'Done') {
      context.read<TrackOrdersCubit>().trackOrders();
    }
  }
}
