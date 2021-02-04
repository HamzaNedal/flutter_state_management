import 'package:equatable/equatable.dart';

abstract class TimerState extends Equatable {
  int duration;
  TimerState(this.duration);

  @override
  List<Object> get props => [duration];
}

// class InitialState extends TimerState {
//   int duration = 0;
//   InitialState({this.duration}) : super(0);
//   @override
//   List<Object> get props => [duration];
// }

class Ready extends TimerState {
  Ready(int duration) : super(duration);
}

class Paused extends TimerState {
  Paused(int duration) : super(duration);
}

class Running extends TimerState {
  Running(int duration) : super(duration);
}

class Finished extends TimerState {
  Finished(int duration) : super(0);
}
