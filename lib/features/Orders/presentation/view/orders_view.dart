import 'package:flutter/material.dart';

import 'widgets/orders_body.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OrdersBody(),
    );
  }
}
