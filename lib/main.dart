import 'package:flutter/material.dart';
import 'package:wajbah_chef/core/constants/constants.dart';

import 'features/Authentication/presentations/views/login_view/login_view.dart';
import 'features/Authentication/presentations/views/signup_view/register_view.dart';
import 'features/Authentication/presentations/views/signup_view/signup_view.dart';
import 'package:wajbah_chef/features/Home/presentation/view/home_body.dart';
import 'package:wajbah_chef/features/OnBoarding/presentations/view/onboarding.dart';
import 'package:wajbah_chef/features/Orders/presentation/view/orders_view.dart';

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
        "Orders": (context) => const OrdersView(),
        "login": (context) => const LoginView(),
        "register": (context) => const MultiStepRegistration(),
      },
    );
  }
}
