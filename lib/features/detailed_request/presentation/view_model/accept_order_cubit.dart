import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wajbah_chef/features/detailed_request/data/model/state_model.dart';
import 'package:wajbah_chef/features/detailed_request/data/repo/state_repo_impl.dart';

import 'accept_order_states.dart';

class StateCubit extends Cubit<StateManagementState> {
  final StateRepoImpl stateRepoImpl;
  final String token;
  int? orderId;
  String? orderState;

  StateCubit(this.token , {required this.stateRepoImpl})
      : super(InitialStateManagementState());

  void initialize({required int orderId, required String state}) {
    this.orderId = orderId;
    this.orderState = state;
  }

  Future<void> updateOrderState() async {
    if (orderId == null || orderState == null) {
      emit(OrderStateUpdateError("Order ID or state is not initialized"));
      return;
    }

    try {
      emit(UpdatingOrderState());
      debugPrint('Updating Order: $orderId to state: $orderState');
      final response = await stateRepoImpl.updateOrderState(orderId!, orderState!, token);
      emit(
        response.fold(
          (exception) => OrderStateUpdateError(exception.toString()),
          (data) {
            final stateModel = StateModel.fromJson(data);
            return OrderStateUpdated(stateModel);
          },
        ),
      );
    } catch (e) {
      debugPrint('Error updating order state: $e');
      emit(OrderStateUpdateError(e.toString()));
    }
  }

  String? get getToken => token;
}

StateCubit updateStateCubit(BuildContext context, {bool listen = false}) =>
    BlocProvider.of<StateCubit>(context, listen: listen);
