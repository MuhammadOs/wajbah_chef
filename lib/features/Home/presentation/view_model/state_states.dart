// home_cubit_state.dart
import 'package:equatable/equatable.dart';

abstract class HomeCubitState extends Equatable {
  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeCubitState {}

class HomeLoading extends HomeCubitState {}

class HomeSuccess extends HomeCubitState {}

class HomeFailure extends HomeCubitState {
  final String error;

  HomeFailure({required this.error});

  @override
  List<Object> get props => [error];
}
