import 'package:flutter/material.dart';

import 'done_orders_body.dart';

class DoneOrdersView extends StatefulWidget {
  final String chefid;
  final String token;
  const DoneOrdersView({super.key , required this.chefid , required this.token});

  @override
  State<DoneOrdersView> createState() => _DoneOrdersViewState();
}

class _DoneOrdersViewState extends State<DoneOrdersView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DoneOrdersBody(chefId: widget.chefid ,token: widget.token,),
    );
  }
}