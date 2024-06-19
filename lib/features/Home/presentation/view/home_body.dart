import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:iconify_flutter/icons/prime.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/sizeConfig.dart';
import '../../../../core/styles.dart';
import '../../../Authentication/presentation/view_model/auth_cubit.dart';
import '../../../Authentication/presentation/view_model/auth_states.dart';
import '../../data/model/request_model.dart';
import '../view_model/home_cubit.dart';
import '../view_model/home_state.dart';
import 'widgets/custom_drawer.dart';
import 'widgets/home_screen_body.dart';

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  _HomeScreenViewState createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  bool online = true;
  late String chefId;
  late String token;

  @override
  void initState() {
    super.initState();
    final authCubit = context.read<AuthCubit>();
    chefId = authCubit.getChefId ?? "";
    token = authCubit.getToken ?? "";
    online = authCubit.getActive ?? false;

    // Initialize HomeCubit and fetch orders
    final homeCubit = context.read<HomeCubit>();
    homeCubit.initialize(chefId: chefId, active: online);
      if (online) {
        homeCubit.fetchOrders();
      }
    
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => _scaffoldKey.currentState!.openDrawer(),
          icon: Iconify(
            Prime.align_left,
            color: wajbah_black,
            size: width * 0.09,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Row(
              children: [
                Text(
                  online ? 'Online' : 'Offline',
                  style: Styles.titleMedium.copyWith(fontSize: 14, color: wajbah_gray),
                ),
                SizedBox(width: width * 0.03),
                InkWell(
                  onTap: _toggleOnlineStatus,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(23),
                      color: online ? wajbah_primary : wajbah_gray,
                    ),
                    padding: const EdgeInsets.all(7.0),
                    child: Iconify(
                      Mdi.wireless,
                      color: wajbah_white,
                      size: width * 0.067,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: _buildDrawer(height),
      body: SafeArea(
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else if (state is HomeOrdersLoaded) {
              return HomeScreenBody(
                online: online,
                orders: state.orders,
                token: token,
                chef_id: chefId,
              );
            } else if (state is HomeErrorState) {
              return Center(child: Text(state.errMessage));
            } else {
              return HomeScreenBody(
                online: online,
                orders: RequestModel(),
                token: token,
                chef_id: chefId,
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildDrawer(double height) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is LoginSuccessfullyState) {
          return CustomDrawer(
            height: height,
            token: state.token,
            kitchenName: state.resturant_name,
            chef_mail: state.chef_mail,
            chef_Fname: state.chef_Fname,
            chef_Lname: state.chef_Lname,
            description: state.description,
            phone_number: state.phone_number,
            wallet: state.wallet,
            password: state.password,
            chef_id: state.chef_id,
            birthdate: state.birthdata,
            buildingNumber: state.buildingNumber,
            city: state.city,
            flatNumber: state.flatNumber,
            floor: state.floor,
            governorate: state.governorate,
            street: state.street,
          );
        } else {
          return CustomDrawer(
            height: height,
            token: '',
            buildingNumber: '',
            city: '',
            flatNumber: '',
            floor: '',
            governorate: '',
            street: '',
            birthdate: DateTime(DateTime.april),
            kitchenName: '',
            chef_mail: '',
            chef_Fname: '',
            chef_Lname: '',
            description: '',
            phone_number: 0,
            chef_id: '',
            wallet: 0,
            password: '',
          );
        }
      },
    );
  }

  void _toggleOnlineStatus() async {
    final wasOnline = online;
    setState(() {
      online = !online;
    });
    final homeCubit = context.read<HomeCubit>();

    try {
      if (!wasOnline && online) {
        await homeCubit.activeSwitch();
        await homeCubit.fetchOrders();
      } else {
        await homeCubit.activeSwitch();
      }
    } catch (e) {
      // Revert the online status if there is an error
      setState(() {
        online = wasOnline;
      });
      print('Error toggling online status: $e');
    }
  }
}
