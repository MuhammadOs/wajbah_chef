import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wajbah_chef/core/constants/constants.dart';
import 'package:wajbah_chef/core/styles.dart';
import 'package:wajbah_chef/core/widgets/custom_appbar.dart';
import 'package:wajbah_chef/features/menu/data/model/menu_item_model.dart';
import 'package:wajbah_chef/features/menu/presentation/view_model/menuItem_cubit.dart';
import 'package:wajbah_chef/features/menu/presentation/view_model/menuItem_states.dart';
import 'package:wajbah_chef/features/menu/presentation/widgets/room_card_list_view.dart';

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

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    final menuCubit = context.read<MenuGetCubit>();
    print('chef id : ${widget.chefId}');
    print('token : ${widget.token}');
    menuCubit.fetchMenuItemsByID(chefId: widget.chefId, token: widget.token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<MenuGetCubit, MenuGetState>(
        builder: (context, state) {
          if (state is MenuGetStateLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is MenuGetStateLoaded) {
            return _buildLoadedState(state.menuItemModel);
          } else if (state is MenuGetErrorState) {
            return Center(child: Text("Error loading menu items"));
          } else {
            return Center(child: Text("No menu items available"));
          }
        },
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
          color: _tabController.index == index ? wajbah_primary : wajbah_gray_light,
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
        filteredItems = items.where((item) => item.category == 'Grilled').toList();
        break;
      case 1:
        filteredItems = items.where((item) => item.category == 'Oriental').toList();
        break;
      case 2:
        filteredItems = items.where((item) => item.category == 'Greeny').toList();
        break;
      case 3:
        filteredItems = items.where((item) => item.category == 'Desserts').toList();
        break;
      case 4:
        filteredItems = items.where((item) => item.category == 'Offers').toList();
        break;
      default:
        filteredItems = items;
    }

    return filteredItems.isEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/menu/empty_menu.png"),
              SizedBox(height: 20),
              const Text("Looks like you haven’t uploaded any menu yet"),
              SizedBox(height: 20),
              const Text("Tap the + button to upload your first menu"),
            ],
          )
        : MenuCardListView(
            filteredItems,
            isMyRoom: true,
          );
  }
}
