import 'package:bloc/bloc.dart';
import 'package:flutter_state_management/timer/bloc/state.dart';
import 'package:flutter_state_management/timer/bloc/timer_event.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  TimerBloc(TimerState initialState) : super(initialState);

  @override
  Stream<TimerState> mapEventToState(TimerEvent event) {
    throw UnimplementedError();
  }
}
