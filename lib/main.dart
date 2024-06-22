import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wajbah_chef/core/networking/dio_factory.dart';
import 'package:wajbah_chef/features/Authentication/data/repo/auth_remote_source.dart';
import 'package:wajbah_chef/features/Authentication/data/repo/auth_rep_impl.dart';
import 'package:wajbah_chef/features/Authentication/presentation/view_model/auth_cubit.dart';
import 'package:wajbah_chef/features/Home/data/repo/home_remote_source.dart';
import 'package:wajbah_chef/features/Home/data/repo/home_repo_impl.dart';
import 'package:wajbah_chef/features/Home/presentation/view/home_body.dart';
import 'package:wajbah_chef/features/OnBoarding/presentations/view/onboarding.dart';
import 'package:wajbah_chef/features/Orders/data/repo/track_remote_source.dart';
import 'package:wajbah_chef/features/Orders/data/repo/track_repo_impl.dart';
import 'package:wajbah_chef/features/Orders/presentation/view/orders_view.dart';
import 'package:wajbah_chef/features/dashboard/presentation/view/widgets/finance_view.dart';
import 'package:wajbah_chef/features/Orders/presentation/view_model/track_orders_cubit.dart';
import 'package:wajbah_chef/features/detailed_request/presentation/view/detailed_request_view.dart';
import 'package:wajbah_chef/features/detailed_request/presentation/view/widgets/detailed_request_body.dart';
import 'package:wajbah_chef/features/detailed_request/presentation/view_model/accept_order_cubit.dart';
import 'package:wajbah_chef/features/detailed_request/presentation/view_model/timer_bloc.dart';
import 'package:wajbah_chef/features/home/presentation/view_model/home_cubit.dart';
import 'package:wajbah_chef/features/menu/data/repo/menuItem_remotesource.dart';
import 'package:wajbah_chef/features/menu/data/repo/menuitem_repo_impl.dart';
import 'package:wajbah_chef/features/menu/presentation/view_model/menuItem_cubit.dart';
import 'package:wajbah_chef/features/profile/data/repo/profile_remote_source.dart';
import 'package:wajbah_chef/features/profile/data/repo/profile_repo_impl.dart';
import 'package:wajbah_chef/features/profile/presentation/view/profile_view.dart';
import 'package:wajbah_chef/features/profile/presentation/view_model/profile_cubit.dart';
import 'features/Authentication/presentation/view/login_view/login_view.dart';
import 'features/Authentication/presentation/view/signup_view/register_view.dart';
import 'features/Authentication/presentation/view_model/auth_states.dart';
import 'features/detailed_request/data/repo/state_remote_source.dart';
import 'features/detailed_request/data/repo/state_repo_impl.dart';

void main() {
  runApp(
    DevicePreview(
      builder: (context) => BlocProvider(
        create: (context) => AuthCubit(
          authRepoImpl: AuthRepoImpl(
            authRemoteResource: AuthRemoteResource(
              dio: DioFactory.getDio(),
            ),
          ),
        ),
        child: const WajbahChef(),
      ),
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
              token ?? "",
            ),
          ),
          BlocProvider(
            create: (context) => MenuGetCubit(
              menuItemRepoImpl: MenuItemRepoImpl(
                menuRemoteSource: MenuRemoteSource(
                  dio: DioFactory.getDio(),
                ),
              ),
              token ?? "",
            ),
          ),
          BlocProvider<TimerBloc>(
            create: (_) => TimerBloc(Duration.zero),
          ),
          BlocProvider(
            create: (context) => StateCubit(
              stateRepoImpl: StateRepoImpl(
                stateRemoteSource: StateRemoteSource(
                  dio: DioFactory.getDio(),
                ),
              ),
              token ?? "",
            ),
          ),
          BlocProvider(
            create: (context) => ProfileCubit(
              profileRepoImpl: ProfileRepoImpl(
                profileRemoteSource: ProfileRemoteSource(
                  dio: DioFactory.getDio(),
                ),
              ),
              token ?? "",
            ),
          ),
          BlocProvider(
            create: (context) => TrackOrdersCubit(
              trackRepoImpl: TrackRepoImpl(
                trackRemoteSource: TrackRemoteSource(
                  dio: DioFactory.getDio(),
                ),
              ),
              token ?? "",
            ),
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
      home: const OnBoardingScreen(),
      routes: {
        "onboarding": (context) => const OnBoardingScreen(),
        "orders": (context) => const OrdersView(),
        "login": (context) => const LoginView(),
        "home": (context) => const HomeScreenView(),
        "register": (context) => const MultiStepRegistration(),
        "profile": (context) => const LoginView(),
        "financeView": (context) => const FinanceView(),
        "requestView": (context) => const DetailedRequestView(duration: Duration(seconds: 0)),
        "chef_profile":(context) => const ProfileView(),
      },
    );
  }
}
