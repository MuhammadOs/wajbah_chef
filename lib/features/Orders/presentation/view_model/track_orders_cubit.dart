import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wajbah_chef/features/Home/data/model/request_model.dart';
import 'package:wajbah_chef/features/Home/data/repo/home_repo_impl.dart';
import 'package:wajbah_chef/features/Home/presentation/view_model/home_state.dart';
import 'package:wajbah_chef/features/Orders/data/repo/track_repo_impl.dart';
import 'package:wajbah_chef/features/Orders/presentation/view_model/track_orders_state.dart';
import 'package:wajbah_chef/features/detailed_request/presentation/view_model/accept_order_cubit.dart';

class TrackOrdersCubit extends Cubit<TrackState> {
  final TrackRepoImpl trackRepoImpl;
  final String token;
  String? chefId;
  bool? active;

  TrackOrdersCubit(this.token, {required this.trackRepoImpl})
      : super(InitialTrackState());

  void initialize({required String chefId, required bool active}) {
    this.chefId = chefId;
    this.active = active;
  }

  

  Future<void> trackOrders() async {
    try {
      emit(TrackStateLoading());
      print('Fetching orders for chef ID: $chefId');
      final response = await trackRepoImpl.trackOrdersByChefId(chefId!, token);
      final requestModel = response.fold(
        (exception) => throw exception,
        (map) => RequestModel.fromJson(map),
      );
      emit(TrackStateLoaded(requestModel));
    } catch (e) {
      print('Error fetching orders: $e');
      emit(TrackErrorState(errMessage: e.toString()));
    }
  }

  String? get getToken => token;

  String? get getChefId => chefId;

}

StateCubit getStateCubit(BuildContext context, {bool listen = false}) =>
    BlocProvider.of<StateCubit>(context, listen: listen);
