import 'package:wajbah_chef/features/Home/data/model/request_model.dart';

abstract class TrackState {}

class InitialTrackState extends TrackState {}







class TrackStateLoading extends TrackState {}

class HomeActiveSwitchSuccess extends TrackState {}


class TrackStateLoaded extends TrackState {
  final  RequestModel orders;

  TrackStateLoaded(this.orders);
}



class TrackErrorState extends TrackState {
  String errMessage;

  TrackErrorState({required this.errMessage});

  @override
  String toString() => 'Get kitchen { errMessage: $errMessage }';
}
