import "package:flutter/material.dart";

import "package:wajbah_chef/features/Dashboard/presentation/view/widgets/dashboard_body.dart";

class DashboardView extends StatelessWidget {
  const DashboardView({super.key, required this.chef_id});
  final String chef_id;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: DashBoardBody(chef_id: chef_id,),
    );
  }
}
