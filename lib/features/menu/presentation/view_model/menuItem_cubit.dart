import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wajbah_chef/core/errors/error_handler.dart';
import 'package:wajbah_chef/features/menu/data/model/get_menu_item_model/menu_item_model.dart';
import 'package:wajbah_chef/features/menu/data/model/post_menu_item_model/Post_menu_item_request.dart';
import 'package:wajbah_chef/features/menu/data/repo/menuitem_repo_impl.dart';
import 'package:wajbah_chef/features/menu/presentation/view_model/menuItem_states.dart';

class MenuGetCubit extends Cubit<MenuGetState> {
  final MenuItemRepoImpl menuItemRepoImpl;
  final String token; // Store the token

  MenuGetCubit(this.token, {required this.menuItemRepoImpl})
      : super(InitialMenuGetState());

  Future<void> fetchMenuItemsByID({required String chefId}) async {
    emit(MenuGetStateLoading());
    final response = await menuItemRepoImpl.fetchMenuItemsByID(chefId, token);
    response.fold(
      (exception) {
        emit(MenuGetErrorState(errMessage: exception.toString()));
      },
      (menuItemModel) {
        //final menuItemModel = MenuItemModel.fromJson(map);
        emit(MenuGetStateLoaded(menuItemModel));
      },
    );
  }

  Future<void> postMenuItem(
      PostMenuItemRequest postMenuItemRequest, String chefId) async {
    emit(MenuGetStateLoading());
    final result =
        await menuItemRepoImpl.postMenuItem(postMenuItemRequest, token, chefId);
    result.fold(
      (exception) {
        emit(MenuGetErrorState(errMessage: exception.toString()));
      },
      (postMenuItemRequest) => emit(MenuPostStateSuccess(postMenuItemRequest)),
    );
  }
}
