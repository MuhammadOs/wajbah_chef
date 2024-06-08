import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:iconify_flutter/icons/prime.dart';
import 'package:wajbah_chef/core/constants/constants.dart';
import 'package:wajbah_chef/core/sizeConfig.dart';
import 'package:wajbah_chef/core/styles.dart';
import 'package:wajbah_chef/features/Home/presentation/view/widgets/custom_drawer.dart';
import 'package:wajbah_chef/features/Home/presentation/view/widgets/home_screen_body.dart';
import 'package:wajbah_chef/features/Home/presentation/view_model/home_cubit.dart';

class HomeScreenView extends StatefulWidget {
  final String token;
  final String chefId;
  final bool active;

  const HomeScreenView({
    Key? key,
    required this.token,
    required this.chefId,
    required this.active,
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
      drawer: CustomDrawer(height: height),
      body: SafeArea(
        child: HomeScreenBody(online: online),
      ),
    );
  }
}
