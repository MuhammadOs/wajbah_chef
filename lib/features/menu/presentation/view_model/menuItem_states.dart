import 'package:wajbah_chef/core/errors/error_model.dart';
import 'package:wajbah_chef/features/menu/data/model/menu_item_model.dart';

abstract class MenuGetState {}

class InitialMenuGetState extends MenuGetState {}

class MenuGetStateLoading extends MenuGetState {}

class MenuGetStateLoaded extends MenuGetState {
  final MenuItemModel menuItemModel;
  MenuGetStateLoaded(this.menuItemModel);
}

class MenuGetErrorState extends MenuGetState {
  final ErrorModel errorModel;
  MenuGetErrorState({required this.errorModel});
}

class MenuPostStateSuccess extends MenuGetState {}
