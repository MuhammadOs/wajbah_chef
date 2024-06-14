import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wajbah_chef/core/networking/dio_factory.dart';
import 'package:wajbah_chef/features/Authentication/data/repo/auth_remote_source.dart';
import 'package:wajbah_chef/features/Authentication/data/repo/auth_rep_impl.dart';
import 'package:wajbah_chef/features/Authentication/presentation/view_model/auth_cubit.dart';
import 'package:wajbah_chef/features/Home/data/repo/home_remote_source.dart';
import 'package:wajbah_chef/features/Home/data/repo/home_repo_impl.dart';
import 'package:wajbah_chef/features/Home/presentation/view/home_body.dart';
import 'package:wajbah_chef/features/Home/presentation/view_model/home_cubit.dart';
import 'package:wajbah_chef/features/OnBoarding/presentations/view/onboarding.dart';
import 'package:wajbah_chef/features/Orders/presentation/view/orders_view.dart';
import 'package:wajbah_chef/features/detailed_request/presentation/view_model/timer_bloc.dart';
import 'package:wajbah_chef/features/menu/data/repo/menuItem_remotesource.dart';
import 'package:wajbah_chef/features/menu/data/repo/menuitem_repo_impl.dart';
import 'package:wajbah_chef/features/menu/presentation/view_model/menuItem_cubit.dart';

import 'features/Authentication/presentation/view/login_view/login_view.dart';
import 'features/Authentication/presentation/view/signup_view/register_view.dart';
import 'features/Authentication/presentation/view_model/auth_states.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => AuthCubit(
        authRepoImpl: AuthRepoImpl(
          authRemoteResource: AuthRemoteResource(
            dio: DioFactory.getDio(),
          ),
        ),
      ),
      child: const WajbahChef(),
    ),
  );
}

class WajbahChef extends StatelessWidget {
  const WajbahChef({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
      final authCubit = context.read<AuthCubit>();
      final token = authCubit.token;
      return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeCubit(
                homeRepoImpl: HomeRepoImpl(
                  homeRemoteSource: HomeRemoteSource(
                    dio: DioFactory.getDio(),
                  ),
                ),
                token ?? ""),
          ),
          BlocProvider(
            create: (context) => MenuGetCubit(
                menuItemRepoImpl: MenuItemRepoImpl(
                    menuRemoteSource:
                        MenuRemoteSource(dio: DioFactory.getDio())),
                token ?? ""),
          ),
          BlocProvider<TimerBloc>(
            create: (_) => TimerBloc(Duration.zero),
          ),
        ],
        child: const WajbahApp(),
      );
    });
  }
}

class WajbahApp extends StatelessWidget {
  const WajbahApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Biryani", canvasColor: Colors.white),
      debugShowCheckedModeBanner: false,
      home: const LoginView(),
      routes: {
        "onboarding": (context) => const OnBoardingScreen(),
        "orders": (context) => const OrdersView(),
        "login": (context) => const LoginView(),
        "home": (context) => const HomeScreenView(),
        "register": (context) => const MultiStepRegistration(),
        "profile": (context) => const LoginView(),
      },
    );
  }
}
