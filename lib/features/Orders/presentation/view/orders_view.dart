import 'package:flutter/material.dart';

import 'widgets/orders_body.dart';

class OrdersView extends StatelessWidget {
  final String chefId;
  final String token;
  const OrdersView({super.key, required this.chefId, required this.token});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: OrdersBody(chefId: chefId,token:token ,),
    );
  }
}
