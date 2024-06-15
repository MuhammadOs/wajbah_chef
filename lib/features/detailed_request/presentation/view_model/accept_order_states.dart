import 'package:wajbah_chef/features/detailed_request/data/model/state_model.dart';

abstract class StateManagementState {}

class InitialStateManagementState extends StateManagementState {}

class UpdatingOrderState extends StateManagementState {}

class OrderStateUpdated extends StateManagementState {
  final StateModel requestModel;

  OrderStateUpdated(this.requestModel);
}

class OrderStateUpdateError extends StateManagementState {
  final String message;

  OrderStateUpdateError(this.message);
}
