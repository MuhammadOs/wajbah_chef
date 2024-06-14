import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimerBloc extends Bloc<TimerEvent, Duration> {
  late Timer _timer;

  TimerBloc(super.initialState) {
    on<StartTimer>((event, emit) {
      _startTimer(event.duration);
    });
    on<UpdateTimer>((event, emit) {
      _updateTimer(event.seconds);
    });
  }

  void _startTimer(Duration duration) {
    emit(duration);
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      add(UpdateTimer(timer.tick));
    });
  }

  void _updateTimer(int seconds) {
    emit(state - Duration(seconds: 1));
    if (state.inSeconds == 0) {
      _timer.cancel();
    }
  }
}

abstract class TimerEvent {}

class StartTimer extends TimerEvent {
  final Duration duration;

  StartTimer(this.duration);
}

class UpdateTimer extends TimerEvent {
  final int seconds;

  UpdateTimer(this.seconds);
}
