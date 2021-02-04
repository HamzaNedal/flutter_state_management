import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_state_management/blocs/timer/bloc/timer_state.dart';
import 'package:flutter_state_management/blocs/timer/bloc/timer_event.dart';
import 'package:flutter_state_management/blocs/timer/ticker.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  final Ticker _ticker;
  final int _duration;
  StreamSubscription<int> _tickerSubscription;
  TimerBloc(this._duration, Ticker ticker)
      : this._ticker = ticker,
        super(Ready(_duration));

  // TimerState get initialState => Ready(_duration);

  @override
  Stream<TimerState> mapEventToState(TimerEvent event) async* {
    if (event is Start) {
      Start start = event;
      yield Running(start.duration);
      _tickerSubscription?.cancel();
      _tickerSubscription =
          _ticker.tick(ticks: start.duration).listen((duration) {
        add(Tick(duration: duration));
      });
    } else if (event is Pause) {
      if (state is Running) {
        _tickerSubscription.pause();
        yield Paused(state.duration);
      }
    } else if (event is Resume) {
      if (state is Paused) {
        _tickerSubscription?.resume();
        yield Running(state.duration);
      }
    } else if (event is Reset) {
      _tickerSubscription?.cancel();
      yield Ready(_duration);
    } else if (event is Tick) {
      Tick tick = event;
      yield tick.duration > 0
          ? Running(tick.duration)
          : Finished(tick.duration);
    }
  }

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }
}
