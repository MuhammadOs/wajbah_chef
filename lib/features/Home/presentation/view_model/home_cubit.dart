import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wajbah_chef/core/errors/error_handler.dart';
import 'package:wajbah_chef/core/errors/error_model.dart';
import 'package:wajbah_chef/features/Home/data/repo/home_repo_impl.dart';
import 'package:wajbah_chef/features/Home/presentation/view_model/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepoImpl homeRepoImpl;
  String? token;
  String? chefId;
  bool? active;

  HomeCubit({required this.homeRepoImpl}) : super(InitialHomeState());

  Future<void> activeSwitch() async {
    emit(OnlineState());
    if (token != null && chefId != null && active != null) {
      final Either<Exception, void> response = await homeRepoImpl.activeSwitch(chefId!, token!);
      emit(
        response.fold(
          (exception) {
            ErrorHandler.handle(exception);
            return HomeErrorState(errorModel: ErrorHandler.errorModel);
          },
          (_) {
            active = !active!; // Toggle the active status
            return active! ? OnlineState() : OfflineState();
          },
        ),
      );
    } else {
      emit(HomeErrorState(errorModel: ErrorModel(message: "Token, Chef ID, or Active status is missing")));
    }
  }

  String? get getToken => token;
  String? get getChefId => chefId;
}

HomeCubit getHomeCubit(BuildContext context, {bool listen = false}) =>
    BlocProvider.of<HomeCubit>(context, listen: listen);
