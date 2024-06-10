import 'package:flutter/material.dart';
import 'package:wajbah_chef/core/constants/constants.dart';
import 'package:wajbah_chef/features/menu/data/model/menu_item_model.dart';
import 'menu_card.dart';

class MenuCardListView extends StatelessWidget {
  final List<MenuItem> menuItems;
  final bool isMyRoom;

  const MenuCardListView(this.menuItems, {Key? key, this.isMyRoom = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: menuItems.length,
      itemBuilder: (context, index) {
        final menuItem = menuItems[index];
        return Padding(
          padding: const EdgeInsets.only(top: 8.0, right: 8, left: 8),
          child: MenuCard(
            menuItem,
            color: wajbah_white,
          ),
        );
      },
    );
  }
}
