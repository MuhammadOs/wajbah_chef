import 'package:flutter/material.dart';
import 'package:wajbah_chef/core/constants/constants.dart';
import 'package:wajbah_chef/core/widgets/custom_appbar.dart';
import 'package:wajbah_chef/features/menu/presentation/screens/create_menu_item_view.dart';
import '../../../../../core/styles.dart';
import '../../../data/menu_item.dart';
import '../room_card_list_view.dart';

class MenuViewBody extends StatefulWidget {
  @override
  _MenuViewBodyState createState() => _MenuViewBodyState();
}

class _MenuViewBodyState extends State<MenuViewBody>
    with SingleTickerProviderStateMixin {
  List<MenuItem> menuItems = [];

  late TabController _tabController;

  void addRoom(MenuItem menuItem) {
    setState(() {
      menuItems.add(menuItem);
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomAppBar(title: "Menu"),
            TabBar(
              controller: _tabController,
              isScrollable: true,
              automaticIndicatorColorAdjustment: false,
              dividerHeight: 0,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Colors.transparent,
              tabs: [
                _buildTab("Trending", 0),
                _buildTab("Up to 50 %", 1),
                _buildTab("Share Box", 2),
                _buildTab("Kids Meal", 3),
                _buildTab("Offers", 4),
              ],
              onTap: (index) {
                setState(() {});
              },
            ),
            menuItems.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/menu/empty_menu.png"),
                      SizedBox(
                        height: 20,
                      ),
                      const Text(
                          "Looks like you haven’t uploaded any menu yet"),
                      SizedBox(
                        height: 20,
                      ),
                      const Text("tab + button to uploads your first menu"),
                    ],
                  )
                : MenuCardListView(
                    menuItems,
                    isMyRoom: true,
                  ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (c) {
              return CreateRoomView(onMenuItemCreated: addRoom);
            },
          ));
        },
        backgroundColor: wajbah_green_light,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          color: wajbah_green,
          size: 30,
        ),
      ),
    );
  }

  Widget _buildTab(String text, int index) {
    return Tab(
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: _tabController.index == index
              ? wajbah_primary
              : wajbah_gray_light,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style: Styles.hint.copyWith(
            color: _tabController.index == index ? Colors.white : wajbah_gray,
            fontSize: MediaQuery.of(context).size.width * 0.03,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
