import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wajbah_chef/features/Home/data/model/request_model.dart';
import 'package:wajbah_chef/features/Home/data/repo/home_repo_impl.dart';
import 'package:wajbah_chef/features/Home/presentation/view_model/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepoImpl homeRepoImpl;
  final String token;
  String? chefId;
  bool? active;

  HomeCubit(this.token, {required this.homeRepoImpl})
      : super(InitialHomeState());

  void initialize({required String chefId, required bool active}) {
    this.chefId = chefId;
    this.active = active;
  }

  Future<void> activeSwitch() async {
    if (chefId == null || active == null) return;
    if (kDebugMode) {
      print(
          'Toggling active status for chef ID: $chefId, current status: $active');
    }
    emit(OnlineState());
    final response = await homeRepoImpl.activeSwitch(chefId!, token);
    response.fold(
      (exception) {
        if (kDebugMode) {
          print('Error during active switch: $exception');
        }
        emit(HomeErrorState(errMessage: exception.toString()));
      },
      (_) {
        active = !active!;
        if (kDebugMode) {
          print('Active status toggled to: $active');
        }
        emit(active! ? OnlineState() : OfflineState());
      },
    );
  }

  Future<void> fetchOrders() async {
    try {
      emit(HomeLoading());
      print('Fetching orders for chef ID: $chefId');
      final response = await homeRepoImpl.fetchOrdersByChefId(chefId!, token);
      final requestModel = response.fold(
        (exception) => throw exception,
        (map) => RequestModel.fromJson(map),
      );
      emit(HomeOrdersLoaded(requestModel));
    } catch (e) {
      print('Error fetching orders: $e');
      emit(HomeErrorState(errMessage: e.toString()));
    }
  }

  String? get getToken => token;

  String? get getChefId => chefId;

  bool? get getActive => active;
}

HomeCubit getHomeCubit(BuildContext context, {bool listen = false}) =>
    BlocProvider.of<HomeCubit>(context, listen: listen);
