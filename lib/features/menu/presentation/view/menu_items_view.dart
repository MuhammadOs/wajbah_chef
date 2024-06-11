import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wajbah_chef/features/menu/data/repo/menuItem_remotesource.dart';
import 'package:wajbah_chef/features/menu/data/repo/menuitem_repo_impl.dart';
import 'package:wajbah_chef/features/menu/presentation/view_model/menuItem_cubit.dart';
import 'package:wajbah_chef/features/menu/presentation/widgets/chat_room_view_widgets/menu_view_body.dart';

class MenuView extends StatefulWidget {
  final String chefId;
  final String token;

  const MenuView({Key? key, required this.chefId, required this.token}) : super(key: key);

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MenuGetCubit(menuItemRepoImpl: MenuItemRepoImpl(menuRemoteSource: MenuRemoteSource(dio: Dio()))),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: MenuViewBody(chefId: widget.chefId, token: widget.token),
        ),
      ),
    );
  }
}
