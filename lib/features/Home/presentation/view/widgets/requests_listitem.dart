import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/gg.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:iconify_flutter/icons/pepicons.dart';
import 'package:iconify_flutter/icons/whh.dart';
import 'package:wajbah_chef/core/constants/constants.dart';
import 'package:wajbah_chef/core/styles.dart';
import 'package:wajbah_chef/features/Home/data/requests_item.dart';
import 'package:wajbah_chef/features/Home/presentation/view/widgets/TextRich.dart';
import 'package:wajbah_chef/features/detailed_request/presentation/view_model/timer_bloc.dart';

class RequestsListItem extends StatefulWidget {
  const RequestsListItem(
      {Key? key,
      required this.height,
      required this.width,
      required this.OrderId,
      required this.Client_name,
      required this.Client_location,
      required this.Order_Price,
      required this.Order_name,
      required this.Order_item_count,
      required this.Available_time,
      required this.Condition,
      required this.PhoneNumber,
      required this.ItemDescription})
      : super(key: key);

  final double height;
  final double width;
  final String OrderId;
  final String Order_name;
  final int Order_item_count;
  final String Client_name;
  final String Client_location;
  final int Order_Price;
  final String Available_time;
  final String PhoneNumber;
  final String Condition;
  final String ItemDescription;

  @override
  _RequestsListItemState createState() => _RequestsListItemState();
}

class _RequestsListItemState extends State<RequestsListItem> {
  late Duration _duration;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startCountdown();
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
    final timerbloc = BlocProvider.of<TimerBloc>(context);
    final availableTimeSplit = widget.Available_time.split(':');
    final availableTimeDuration = Duration(
      minutes: int.parse(availableTimeSplit[0]),
      seconds: int.parse(availableTimeSplit[1]),
    );
    timerbloc.add(StartTimer(availableTimeDuration));

    return InkWell(
      
      onTap: () {
        Navigator.pushNamed(context, 'requestView',
            arguments: Request(
                Request_ID: widget.OrderId,
                Item_name: widget.Order_name,
                num_of_items: widget.Order_item_count,
                Requester_name: widget.Client_name,
                Requester_location: widget.Client_location,
                Item_price: widget.Order_Price,
                Available_time: formattedTime,
                Request_condition: widget.Condition,
                Phone_number: widget.PhoneNumber,
                item_Description: widget.ItemDescription));
      },
      child: Container(
        height: widget.height * 0.3,
        width: widget.width * 0.8,
        decoration: BoxDecoration(
          color: _duration.inSeconds == 0 && _duration.inMinutes == 0
              ? Colors.red.withOpacity(0.3)
              : wajbah_green_light,
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
                  Text(
                    '#${widget.OrderId}',
                    style: Styles.titleSmall.copyWith(fontSize: 16),
                  ),
                  const Iconify(
                    Pepicons.electricity_print,
                    color: Colors.yellow,
                  )
                ],
              ),
              SizedBox(
                height: widget.height * 0.01,
              ),
              CustomTextRich(
                FirstColor: wajbah_green,
                SecondColor: wajbah_black,
                firstText: '${widget.Order_item_count} x ',
                SecondText: widget.Order_name,
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
                  Text(
                    widget.Client_name,
                    style: Styles.titleSmall.copyWith(fontSize: 13),
                    textAlign: TextAlign.center,
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
                  Text(
                    widget.Client_location,
                    style: Styles.titleSmall.copyWith(fontSize: 13),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              SizedBox(
                height: widget.height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${widget.Order_Price} EGP',
                      style: Styles.titleMedium.copyWith(fontSize: 18),
                    ),
                    Container(
                      width: widget.width * 0.18,
                      height: widget.height * 0.04,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(23),
                        color: _duration.inMinutes > 5
                            ? wajbah_green_light
                            : _duration.inMinutes > 1 && _duration.inMinutes < 5
                                ? Colors.orange.withOpacity(0.3)
                                : Colors.red.withOpacity(0.3),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Iconify(
                            Mdi.clock_time_three,
                            color: _duration.inMinutes > 5
                                ? wajbah_green_light
                                : _duration.inMinutes > 1 &&
                                        _duration.inMinutes < 5
                                    ? Colors.orange.withOpacity(0.8)
                                    : Colors.red.withOpacity(0.8),
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
                                      ? Colors.orange.withOpacity(0.8)
                                      : Colors.red.withOpacity(0.8),
                            ),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
