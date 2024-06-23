import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/majesticons.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:wajbah_chef/core/constants/constants.dart';
import 'package:wajbah_chef/core/styles.dart';
import 'package:wajbah_chef/core/widgets/custom_appbar.dart';
import 'package:wajbah_chef/core/widgets/order_state.dart';
import 'package:wajbah_chef/features/Home/data/requests_item.dart';
import 'package:wajbah_chef/features/detailed_request/presentation/view/widgets/custom_info_listtile.dart';
import '../../view_model/accept_order_cubit.dart';
import '../../view_model/timer_bloc.dart';
import 'cutom_divider.dart';
import 'order_details_widget.dart';

class DetailedRequestBody extends StatefulWidget {
  const DetailedRequestBody({Key? key});

  @override
  State<DetailedRequestBody> createState() => _DetailedRequestBodyState();
}

class _DetailedRequestBodyState extends State<DetailedRequestBody> {
  late Duration _duration;
  late Timer _timer;
  Request? arg;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      arg = ModalRoute.of(context)!.settings.arguments as Request;
      _startCountdown();
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        _updateTime();
      });
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    arg ??= ModalRoute.of(context)!.settings.arguments as Request;
    _startCountdown();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _updateTime() {
    setState(() {
      if (_duration.inSeconds > 0) {
        _duration = _duration - Duration(seconds: 1);
      } else {
        _timer.cancel();
      }
    });
  }

  void _startCountdown() {
    var time = arg?.Available_time.split(':');
    int minutes = int.parse(time![0]);
    int seconds = int.parse(time[1]);

    _duration = Duration(minutes: minutes, seconds: seconds);

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_duration.inSeconds > 0) {
          _duration = _duration - Duration(seconds: 1);
        } else {
          _timer.cancel();
        }
      });
    });
  }

  void _acceptOrder() {
    final stateCubit = context.read<StateCubit>();
    if (arg != null) {
      stateCubit.initialize(
          orderId: int.parse(arg!.Request_ID), state: OrderState.currentState);
      stateCubit.updateOrderState();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, Duration>(
      builder: (context, duration) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: OrderDetails(
                order_id: arg!.Request_ID,
                quantities: arg!.num_of_items,
                price: arg!.Item_price,
                menuItems: arg!.menuItems,
              ),
            ),
            const CustomDivider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Customer Info',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  CustomInfoListtile(
                    title: 'Customer',
                    subtitle: arg!.Requester_name,
                    Icon: Ic.baseline_account_circle,
                  ),
                  CustomInfoListtile(
                    title: 'Location',
                    subtitle: arg!.Requester_location,
                    Icon: MaterialSymbols.location_on,
                  ),
                  CustomInfoListtile(
                    title: 'Phone Number',
                    subtitle: arg!.Phone_number,
                    Icon: MaterialSymbols.phone_in_talk_sharp,
                  ),
                ],
              ),
            ),
            const CustomDivider(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Payment Info',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  CustomInfoListtile(
                    title: 'Method',
                    subtitle: 'Cash on Delivery',
                    Icon: Majesticons.money_hand_line,
                  ),
                  CustomInfoListtile(
                    title: 'Tips',
                    subtitle: '5 EGP',
                    Icon: MaterialSymbols.payments,
                  ),
                  CustomInfoListtile(
                    title: 'Promo Code',
                    subtitle: 'No Codes Applied',
                    Icon: MaterialSymbols.barcode,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20), // Add some spacing at the bottom
          ],
        );
      },
    );
  }
}