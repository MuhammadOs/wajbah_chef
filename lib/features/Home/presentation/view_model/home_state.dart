import 'package:wajbah_chef/core/errors/error_model.dart';

abstract class HomeState {}

class InitialHomeState extends HomeState {}

class OnlineState extends HomeState {}

class OfflineState extends HomeState {}

class HomeErrorState extends HomeState {
  final ErrorModel errorModel;

  HomeErrorState({required this.errorModel});
}
