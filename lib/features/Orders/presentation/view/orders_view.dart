import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wajbah_chef/features/Authentication/presentation/view_model/auth_cubit.dart';

import 'widgets/orders_body.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = context.read<AuthCubit>();
    String? chefId = authCubit.getChefId;
    return Scaffold(
      backgroundColor: Colors.white,
      body: OrdersBody(chefId: chefId ?? ""),
    );
  }
}
