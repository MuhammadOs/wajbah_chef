import 'dart:async';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/gg.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:iconify_flutter/icons/pepicons.dart';
import 'package:wajbah_chef/core/constants/constants.dart';
import 'package:wajbah_chef/core/styles.dart';
import 'package:wajbah_chef/features/Home/presentation/view/widgets/TextRich.dart';

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
  }) : super(key: key);

  final double height;
  final double width;
  final String OrderId;
  final String Order_name;
  final int Order_item_count;
  final String Client_name;
  final String Client_location;
  final int Order_Price;
  final String Available_time;

  @override
  _ServingListItemState createState() => _ServingListItemState();
}

class _ServingListItemState extends State<ServingListItem> {
  late Duration _duration;
  late Timer _timer;
  late String _dropdownvalue = 'Preparing';

  @override
  void initState() {
    super.initState();
    _startCountdown();
    _dropdownvalue = 'Preparing';
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startCountdown() {
    var time = widget.Available_time.split(':');
    int minutes = int.parse(time[0]);
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

  @override
  Widget build(BuildContext context) {
    String formattedTime =
        '${_duration.inMinutes.remainder(60)}:${(_duration.inSeconds % 60).toString().padLeft(2, '0')}';

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
                      Pepicons.electricity_print,
                      color: Colors.yellow,
                    )
                  ],
                ),
                Container(
                  width: widget.width * 0.18,
                  height: widget.height * 0.04,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(23),
                    color: _duration.inMinutes > 5
                        ? wajbah_green_light
                        : _duration.inMinutes > 1 && _duration.inMinutes < 5
                            ? Color(0xffFFF59F)
                            : Color(0xffFFE2E2),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Iconify(
                        Mdi.clock_time_three,
                        color: _duration.inMinutes > 5
                            ? wajbah_green_light
                            : _duration.inMinutes > 1 && _duration.inMinutes < 5
                                ? Color(0xffC5B528)
                                : Color(0xffBE3C26),
                      ),
                      SizedBox(
                        width: widget.width * 0.01,
                      ),
                      Text(
                        formattedTime,
                        style: Styles.titleMedium.copyWith(
                          fontSize: 16,
                          color: _duration.inMinutes > 5
                              ? wajbah_green_light
                              : _duration.inMinutes > 1 &&
                                      _duration.inMinutes < 5
                                  ? Color(0xffC5B528)
                                  : Color(0xffBE3C26),
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                )
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
                  Gg.profile,
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
                      style: Styles.titleSmall
                          .copyWith(color: wajbah_gray, fontSize: 10),
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
                      style: Styles.titleSmall
                          .copyWith(color: wajbah_gray, fontSize: 10),
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
                Container(
                  decoration: BoxDecoration(
                      color: wajbah_primary,
                      borderRadius: BorderRadius.circular(12)),
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
                DropdownButton(
                    value: _dropdownvalue,
                    icon: const Iconify(
                      Ic.baseline_keyboard_arrow_down,
                      color: wajbah_black,
                    ),
                    items: [
                      DropdownMenuItem<String>(
                        value: 'Preparing',
                        child: Text(
                          'Preparing',
                          style: Styles.titleMedium.copyWith(fontSize: 14),
                        ),
                      ),
                      DropdownMenuItem<String>(
                        value: 'Cooking',
                        child: Text('Cooking',
                            style: Styles.titleMedium.copyWith(fontSize: 14)),
                      ),
                      DropdownMenuItem<String>(
                        value: 'Delivering',
                        child: Text('Delivering',
                            style: Styles.titleMedium.copyWith(fontSize: 14)),
                      ),
                    ],
                    onChanged: (String? newValue) {
                      setState(() {
                        _dropdownvalue = newValue ?? 'Preparing';
                      });
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
