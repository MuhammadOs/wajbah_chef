import 'package:flutter/material.dart';
import 'package:wajbah_chef/features/Home/presentation/view/home_body.dart';
import 'package:wajbah_chef/features/OnBoarding/presentations/view/onboarding.dart';

void main() {
  runApp(const WajbahChef());
}

class WajbahChef extends StatelessWidget {
  const WajbahChef({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Biryani"),
      debugShowCheckedModeBanner: false,
      home: const HomeScreenView(),
      routes: {
        "Onboarding": (context) => const OnBoardingScreen(),
        "Home": (context) => const HomeScreenView(),
      },
    );
  }
}
