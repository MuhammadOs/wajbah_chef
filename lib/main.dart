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
import 'package:wajbah_chef/features/menu/data/repo/menuItem_remotesource.dart';
import 'package:wajbah_chef/features/menu/data/repo/menuitem_repo_impl.dart';
import 'package:wajbah_chef/features/menu/presentation/view_model/menuItem_cubit.dart';

import 'features/Authentication/presentation/view/login_view/login_view.dart';
import 'features/Authentication/presentation/view/signup_view/register_view.dart';
import 'features/Authentication/presentation/view_model/auth_states.dart';
import 'features/detailed_request/presentation/view/detailed_request_view.dart';
import 'features/detailed_request/presentation/view_model/timer_bloc.dart';

void main() {
  runApp(const WajbahChef());
}

class WajbahChef extends StatelessWidget {
  const WajbahChef({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(
            authRepoImpl: AuthRepoImpl(
              authRemoteResource: AuthRemoteResource(
                dio: DioFactory.getDio(),
              ),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => HomeCubit(
            homeRepoImpl: HomeRepoImpl(
              homeRemoteSource: HomeRemoteSource(
                dio: DioFactory.getDio(),
              ),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => MenuGetCubit(menuItemRepoImpl: MenuItemRepoImpl(menuRemoteSource: MenuRemoteSource(dio: Dio()))),
        ),
        BlocProvider<TimerBloc>(
          create: (_) => TimerBloc(Duration.zero), 
        ),
      ],
      child: const WajbahApp(),
    );
  }
}

class WajbahApp extends StatelessWidget {
  const WajbahApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authCubit = getAuthCubit(context);
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        final token = authCubit.getToken;
        return MaterialApp(
          theme: ThemeData(fontFamily: "Biryani", canvasColor: Colors.white),
          debugShowCheckedModeBanner: false,
          home: const LoginView(),
          onGenerateRoute: (settings) {
            if (settings.name == 'home') {
              final args = settings.arguments as Map<String, dynamic>;
              return MaterialPageRoute(
                builder: (context) {
                  return HomeScreenView(
                    token: args['token'],
                    chefId: args['chefId'],
                    active: args['active'],
                    chef_mail: args['chef_mail'],
                    resturant_name: args['resturant_name'],
                    chef_Fname: args['chef_Fname'],
                    chef_Lname: args['chef_Lname'],
                    wallet: args['wallet'],
                    description: args['description'],
                    password: args['password'],
                  );
                },
              );
            }
            return null;
          },
          routes: {
            "onboarding": (context) => const OnBoardingScreen(),
            "orders": (context) => const OrdersView(),
            "login": (context) => const LoginView(),
            "register": (context) => const MultiStepRegistration(),
            "profile": (context) => const LoginView(),
            "requestView": (context) => const DetailedRequestView(
              duration: Duration(seconds: 120), // Provide a non-null duration
            ),
          },
        );
      },
    );
  }
}
