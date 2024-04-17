import "package:flutter/material.dart";

import "package:wajbah_chef/features/Dashboard/presentation/view/widgets/dashboard_body.dart";

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DashBoardBody(),
    );
  }
}
