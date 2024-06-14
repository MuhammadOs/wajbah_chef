import 'package:flutter/material.dart';import 'package:wajbah_chef/features/menu/presentation/widgets/menu_view_widgets/menu_view_body.dart';

class MenuView extends StatefulWidget {
  final String chefId;
  final String token;

  const MenuView({Key? key, required this.chefId, required this.token})
      : super(key: key);

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: MenuViewBody(chefId: widget.chefId, token: widget.token),
      ),
    );
  }
}
