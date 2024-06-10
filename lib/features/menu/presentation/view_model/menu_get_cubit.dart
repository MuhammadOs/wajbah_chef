import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wajbah_chef/core/errors/error_handler.dart';
import 'package:wajbah_chef/features/menu/data/model/menu_item_model.dart';
import 'package:wajbah_chef/features/menu/data/repo/menuitem_repo_impl.dart';
import 'package:wajbah_chef/features/menu/presentation/view_model/menu_get_state.dart';

class MenuGetCubit extends Cubit<MenuGetState> {
  final MenuItemRepoImpl menuItemRepoImpl;
  String? token;
  String? chefId;

  MenuGetCubit({required this.menuItemRepoImpl}) : super(InitialMenuGetState());

  Future<void> fetchMenu({required String chefId, required String token}) async {
    this.chefId = chefId;
    this.token = token;
    try {
      emit(MenuGetStateLoading());
      final result = await menuItemRepoImpl.fetchMenuItemsByID(chefId, token);
      final menuItemModel = result.fold(
        (exception) {
          if (exception is DioException) {
            throw exception;
          } else {
            throw Exception('Unknown error occurred');
          }
        },
        (map) => MenuItemModel.fromJson(map),
      );
      emit(MenuGetStateLoaded(menuItemModel));
    } catch (e) {
      emit(MenuGetErrorState(errorModel: ErrorHandler.errorModel));
    }
  }
}

MenuGetCubit getHomeCubit(BuildContext context, {bool listen = false}) =>
    BlocProvider.of<MenuGetCubit>(context, listen: listen);
