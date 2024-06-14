import 'package:wajbah_chef/core/errors/error_model.dart';
import 'package:wajbah_chef/features/menu/data/model/get_menu_item_model/menu_item_model.dart';
import 'package:wajbah_chef/features/menu/data/model/menu_item.dart';
import 'package:wajbah_chef/features/menu/data/model/post_menu_item_model/Post_menu_item_request.dart';

abstract class MenuGetState {}

class InitialMenuGetState extends MenuGetState {}

class MenuGetStateLoading extends MenuGetState {}

class MenuGetStateLoaded extends MenuGetState {
  final MenuItemModel menuItemModel;

  MenuGetStateLoaded(this.menuItemModel);
}

final class MenuGetErrorState extends MenuGetState {
  String errMessage;

  MenuGetErrorState({required this.errMessage});

  @override
  String toString() => 'Get kitchen { errMessage: $errMessage }';
}

class MenuPostState extends MenuGetState {}

class MenuPostStateSuccess extends MenuGetState {
  final Map<String, dynamic> menuItem;

  MenuPostStateSuccess(this.menuItem);
}
