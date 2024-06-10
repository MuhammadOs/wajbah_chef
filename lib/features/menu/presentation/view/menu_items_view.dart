import 'package:flutter/material.dart';
import 'package:wajbah_chef/features/menu/presentation/widgets/kitchen_menu_tab.dart';
import '../widgets/chat_room_view_widgets/menu_view_body.dart';

class MenuView extends StatefulWidget {
  const MenuView({super.key});

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: MenuViewBody(),
      ),
    );
  }
}
