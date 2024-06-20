import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wajbah_chef/core/constants/constants.dart';
import 'package:wajbah_chef/core/styles.dart';
import 'package:wajbah_chef/core/widgets/custom_appbar.dart';
import 'package:wajbah_chef/features/menu/data/model/get_menu_item_model/menu_item_model.dart';
import 'package:wajbah_chef/features/menu/data/model/menu_item.dart';
import 'package:wajbah_chef/features/menu/presentation/view/create_menu_item_view.dart';
import 'package:wajbah_chef/features/menu/presentation/view_model/menuItem_cubit.dart';
import 'package:wajbah_chef/features/menu/presentation/view_model/menuItem_states.dart';
import 'package:wajbah_chef/features/menu/presentation/widgets/menu_card_list_view.dart';

class MenuViewBody extends StatefulWidget {
  final String chefId;
  final String token;

  MenuViewBody({required this.chefId, required this.token});

  @override
  _MenuViewBodyState createState() => _MenuViewBodyState();
}

class _MenuViewBodyState extends State<MenuViewBody>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<MenuItem> menuItems = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    final menuCubit = context.read<MenuGetCubit>();
    print('chef id : ${widget.chefId}');
    print('token : ${widget.token}');
    menuCubit.fetchMenuItemsByID(chefId: widget.chefId);
  }

  void addRoom(MenuItem menuItem) {
    setState(() {
      menuItems.add(menuItem);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<MenuGetCubit, MenuGetState>(
        builder: (context, state) {
          if (state is MenuGetStateLoading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (state is MenuGetStateLoaded) {
            return _buildLoadedState(state.menuItemModel);
          } else if (state is MenuGetErrorState) {
            return Center(
                child: Text("Error loading menu items: ${state.errMessage}"));
          } else {
            return const Center(child: Text("No menu items available"));
          }
        },
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

  Widget _buildLoadedState(MenuItemModel menuItems) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomAppBar(title: "Menu"),
          TabBar(
            controller: _tabController,
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Colors.transparent,
            tabs: [
              _buildTab("Grilled", 0),
              _buildTab("Oriental", 1),
              _buildTab("Greeny", 2),
              _buildTab("Desserts", 3),
              _buildTab("Offers", 4),
            ],
            onTap: (index) {
              setState(() {});
            },
          ),
          _buildMenuList(menuItems.result ?? []),
        ],
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

  Widget _buildMenuList(List<MenuItem> items) {
    List<MenuItem> filteredItems;
    switch (_tabController.index) {
      case 0:
        filteredItems =
            items.where((item) => item.category == 'Grilled' || item.category == "grilled").toList();
        break;
      case 1:
        filteredItems =
            items.where((item) => item.category == 'Oriental' || item.category == "oriental").toList();
        break;
      case 2:
        filteredItems =
            items.where((item) => item.category == 'Greeny' || item.category == "greeny").toList();
        break;
      case 3:
        filteredItems =
            items.where((item) => item.category == 'Desserts' || item.category == "desserts").toList();
        break;
      case 4:
        filteredItems =
            items.where((item) => item.category == 'Offers' || item.category == "offers").toList();
        break;
      default:
        filteredItems = items;
    }

    return filteredItems.isEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/menu/empty_menu.png"),
              const SizedBox(height: 20),
              const Text("Looks like you haven’t uploaded any menu yet"),
              const SizedBox(height: 20),
              const Text("Tap the + button to upload your first menu"),
            ],
          )
        : MenuCardListView(
            filteredItems,
            isMyRoom: true,
          );
  }
}
