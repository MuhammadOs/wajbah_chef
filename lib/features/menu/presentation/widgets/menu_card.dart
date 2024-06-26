import 'package:flutter/material.dart';
import 'package:wajbah_chef/core/constants/constants.dart';
import 'package:wajbah_chef/features/menu/data/model/get_menu_item_model/menu_item_model.dart';
import 'package:wajbah_chef/features/menu/data/model/menu_item.dart';
import '../../../../core/sizeConfig.dart';
import '../../../../core/styles.dart';
import '../../data/menu_item.dart';

class MenuCard extends StatelessWidget {
  final MenuItem menuItem;
  final Color color;

  const MenuCard(this.menuItem, {Key? key, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;
    final theme = Theme.of(context).colorScheme;
    return Material(
      borderRadius: BorderRadius.circular(8),
      child: ListTile(
        leading: menuItem.photo != null
            ? //Image(
                //image: FileImage(menuItem.photo!),
                //width: width * 0.1,
              //)
              CircleAvatar(
                radius: 22,
                backgroundColor: Theme.of(context).primaryColor,
                child: const Icon(Icons.photo),
              )
            : CircleAvatar(
                radius: 22,
                backgroundColor: Theme.of(context).primaryColor,
                child: const Icon(Icons.photo),
              ),
        title: Text(
          menuItem.name!,
          style: Styles.titleMedium.copyWith(fontSize: 18, color: wajbah_black),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        subtitle: Text(
          menuItem.description!,
          style: Styles.hint.copyWith(fontSize: 12),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        trailing: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.edit_note_outlined,
              color: wajbah_primary,
            )
          ],
        ),
      ),
    );
  }
}
