import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wajbah_chef/core/networking/dio_factory.dart';
import 'package:wajbah_chef/features/Authentication/data/repo/auth_remote_source.dart';
import 'package:wajbah_chef/features/Authentication/data/repo/auth_rep_impl.dart';
import 'package:wajbah_chef/features/Authentication/presentation/view_model/auth_cubit.dart';
import 'package:wajbah_chef/features/Home/presentation/view/home_body.dart';
import 'package:wajbah_chef/features/Home/presentation/view_model/state_cubit.dart';
import 'package:wajbah_chef/features/OnBoarding/presentations/view/onboarding.dart';
import 'package:wajbah_chef/features/Orders/presentation/view/orders_view.dart';
import 'features/Authentication/presentation/view/login_view/login_view.dart';
import 'features/Authentication/presentation/view/signup_view/register_view.dart';
import 'features/Authentication/presentation/view_model/auth_states.dart';
import 'features/Home/data/repo/home_remote_source.dart';
import 'features/Home/data/repo/home_repo_impl.dart';

void main() async {
  runApp(
    BlocProvider(
      create: (context) => AuthCubit(
        authRepoImpl: AuthRepoImpl(
          authRemoteResource: AuthRemoteResource(
            dio: DioFactory.getDio(),
          ),
        ),
      ),
      child: WajbahChef(),
    ),
  );
}

class WajbahChef extends StatelessWidget {
  const WajbahChef({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = getAuthCubit(context);
    return BlocBuilder<AuthCubit , AuthState>(builder: (context , state){
      final token = authCubit.token;
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
              token: token ?? '',
              homeRepo: HomeRepoImpl(
                homeremotesource: HomeRemoteSource(
                  dio: DioFactory.getDio(),
                ),
              ),
            ),
          ),
        ],
        child: MaterialApp(
            theme: ThemeData(fontFamily: "Biryani", canvasColor: Colors.white),
            debugShowCheckedModeBanner: false,
            home: const LoginView(),
            routes: {
        "onboarding": (context) => const OnBoardingScreen(),
        "home": (context) => const HomeScreenView(),
        "orders": (context) => const OrdersView(),
        "login": (context) => const LoginView(),
        "register": (context) => const MultiStepRegistration(),
        },
            )
      );
});

}
}
