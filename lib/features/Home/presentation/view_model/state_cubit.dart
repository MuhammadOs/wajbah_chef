// home_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:wajbah_chef/features/Home/data/repo/home_repo.dart';
import 'package:wajbah_chef/features/Home/presentation/view_model/state_states.dart';

class HomeCubit extends Cubit<HomeCubitState> {
  final HomeRepo homeRepo;
  final String token;

  HomeCubit({required this.homeRepo ,required this.token}) : super(HomeInitial());

  void switchActiveStatus(String chefId, String token) async {
    emit(HomeLoading());
    Either<Exception, void> result = await homeRepo.activeSwitch(chefId, token);
    result.fold(
      (error) => emit(HomeFailure(error: error.toString())),
      (_) => emit(HomeSuccess()),
    );
  }
}
