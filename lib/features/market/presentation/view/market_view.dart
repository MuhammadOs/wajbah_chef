import 'package:flutter/material.dart';
import 'package:wajbah_chef/features/market/presentation/view/widgets/market_body.dart';

class MarketView extends StatelessWidget {
  const MarketView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MarketBody(),
    );
  }
}
