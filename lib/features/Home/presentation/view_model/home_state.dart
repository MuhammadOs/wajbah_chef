import 'package:wajbah_chef/core/errors/error_model.dart';
import 'package:wajbah_chef/features/Home/data/model/request_model.dart';

abstract class HomeState {}

class InitialHomeState extends HomeState {}

class OnlineState extends HomeState {}

class OfflineState extends HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeActiveSwitchSuccess extends HomeState {}


class HomeOrdersLoaded extends HomeState {
  final  RequestModel orders;

  HomeOrdersLoaded(this.orders);
}



class HomeErrorState extends HomeState {
  final ErrorModel errorModel;

  HomeErrorState({required this.errorModel});
}
