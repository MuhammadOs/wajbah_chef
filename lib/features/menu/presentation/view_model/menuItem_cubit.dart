import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wajbah_chef/core/errors/error_handler.dart';
import 'package:wajbah_chef/features/menu/data/model/menu_item_model.dart';
import 'package:wajbah_chef/features/menu/data/repo/menuitem_repo_impl.dart';
import 'package:wajbah_chef/features/menu/presentation/view_model/menuItem_states.dart';

class MenuGetCubit extends Cubit<MenuGetState> {
  final MenuItemRepoImpl menuItemRepoImpl;

  MenuGetCubit({required this.menuItemRepoImpl}) : super(InitialMenuGetState());

  Future<void> fetchMenuItemsByID({required String chefId, required String token}) async {
    try {
      emit(MenuGetStateLoading());
      final result = await menuItemRepoImpl.fetchMenuItemsByID(chefId, token);
      result.fold(
        (exception) {
          if (exception is DioException) {
            print('DioError: ${exception.message}');
            print('DioError Response: ${exception.response?.data}');
          } else {
            print('Exception: ${exception.toString()}');
          }
          emit(MenuGetErrorState(errorModel: ErrorHandler.errorModel));
        },
        (map) {
          final menuItemModel = MenuItemModel.fromJson(map);
          emit(MenuGetStateLoaded(menuItemModel));
        },
      );
    } catch (e) {
      print('Error in fetchMenuItemsByID: $e');
      emit(MenuGetErrorState(errorModel: ErrorHandler.errorModel));
    }
  }

  Future<void> postMenuItem(MenuItem menuItem, String token) async {
    try {
      emit(MenuGetStateLoading());
      final result = await menuItemRepoImpl.postMenuItem(menuItem, token);
      result.fold(
        (exception) {
          print('DioError: ${exception.toString()}');
          emit(MenuGetErrorState(errorModel: ErrorHandler.errorModel));
        },
        (_) => emit(MenuPostStateSuccess()),
      );
    } catch (e) {
      print('Error in postMenuItem: $e');
      emit(MenuGetErrorState(errorModel: ErrorHandler.errorModel));
    }
  }
}
