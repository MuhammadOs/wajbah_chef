import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:iconify_flutter/icons/prime.dart';
import 'package:wajbah_chef/core/constants/constants.dart';
import 'package:wajbah_chef/core/sizeConfig.dart';
import 'package:wajbah_chef/core/styles.dart';
import 'package:wajbah_chef/features/Authentication/presentation/view_model/auth_cubit.dart';
import 'package:wajbah_chef/features/Authentication/presentation/view_model/auth_states.dart';
import 'package:wajbah_chef/features/Home/data/model/request_model.dart';
import 'package:wajbah_chef/features/Home/presentation/view/widgets/custom_drawer.dart';
import 'package:wajbah_chef/features/Home/presentation/view/widgets/home_screen_body.dart';
import 'package:wajbah_chef/features/Home/presentation/view_model/home_cubit.dart';
import 'package:wajbah_chef/features/Home/presentation/view_model/home_state.dart';

class HomeScreenView extends StatefulWidget {
  final String token;
  final String chefId;
  final bool active;
  final String chef_mail;
  final String resturant_name;
  final String description;
  final String chef_Fname;
  final String chef_Lname;
  final String wallet;
  final String password;

  const HomeScreenView({
    Key? key,
    required this.token,
    required this.chefId,
    required this.active,
    required this.chef_mail, required this.resturant_name, required this.description, required this.chef_Fname, required this.chef_Lname, required this.wallet,required this.password
  }) : super(key: key);

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  bool online = true;

  @override
  void initState() {
    super.initState();
    print("Token: ${widget.token}");
    print("Chef ID: ${widget.chefId}");
    print("Active Status: ${widget.active}");
    online = widget.active; // Set the initial online status based on the active status
    final homeCubit = context.read<HomeCubit>();
    homeCubit.token = widget.token;
    homeCubit.chefId = widget.chefId;
    homeCubit.active = widget.active;
    homeCubit.fetchOrders();  // Fetch orders when the screen initializes
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
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
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
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(23),
                      color: online ? wajbah_primary : wajbah_gray,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(7.0),
                      child: Iconify(
                        Mdi.wireless,
                        color: wajbah_white,
                        size: width * 0.067,
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      online = !online; // Toggle the value of online between true and false
                    });
                    context.read<HomeCubit>().activeSwitch();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: BlocBuilder<AuthCubit, AuthState>(
  builder: (context, state) {
    if (state is LoginSuccessfullyState) {
      final resturant_name = state.resturant_name;
      final chef_mail = state.chef_mail;
      final chef_Fname = state.chef_Fname;
      final chef_Lname = state.chef_Lname;
      final password = state.password;
      final wallet = state.wallet;
      final description = state.description;
      final phone_number = state.phone_number;
      final token = state.token;
      return CustomDrawer(height: height, token: token,kitchenName: resturant_name , chef_mail: chef_mail, chef_Fname: chef_Fname, chef_Lname: chef_Lname, description: description,phone_number: phone_number,wallet: wallet,password: password,);
    } else {
      return CustomDrawer(height: height, token: '',kitchenName: '' , chef_mail: '', chef_Fname: '', chef_Lname: '', description: '', phone_number: 0, wallet: 0, password: '',); // Default kitchen name
    }
  },
),
      body: SafeArea(
  child: BlocBuilder<HomeCubit, HomeState>(
    builder: (context, state) {
      if (state is HomeLoading) {
        return Center(child: CircularProgressIndicator());
      } else if (state is HomeOrdersLoaded) {
        return HomeScreenBody(online: online, orders: state.orders);
      } else if (state is HomeErrorState) {
        return Center(child: Text(state.errorModel.message!));
      } else {
        return HomeScreenBody(online: online, orders: RequestModel()); // Pass an empty RequestModel
      }
    },
  ),
),
    );
  }
}
