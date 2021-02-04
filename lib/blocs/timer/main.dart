import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_management/blocs/timer/bloc/bloc.dart';
import 'package:flutter_state_management/blocs/timer/ticker.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class Timer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Color.fromRGBO(109, 234, 255, 1),
          accentColor: Color.fromRGBO(72, 74, 126, 1),
          brightness: Brightness.dark),
      home: BlocProvider(
        create: (_) => TimerBloc(5, Ticker()),
        child: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timer With bloc Pattern'),
      ),
      body: Stack(
        children: <Widget>[
          WaveWidget(
            config: CustomConfig(
              gradients: [
                [
                  Color.fromRGBO(72, 74, 126, 1),
                  Color.fromRGBO(125, 170, 206, 1),
                  Color.fromRGBO(184, 189, 245, 0.7),
                ],
                [
                  Color.fromRGBO(72, 74, 126, 1),
                  Color.fromRGBO(125, 170, 206, 1),
                  Color.fromRGBO(172, 182, 219, 0.7),
                ],
                [
                  Color.fromRGBO(72, 74, 126, 1),
                  Color.fromRGBO(125, 170, 206, 1),
                  Color.fromRGBO(190, 238, 246, 0.7),
                ],
              ],
              durations: [19400, 10000, 6000],
              heightPercentages: [0.03, 0.01, 0.02],
              gradientBegin: Alignment.bottomCenter,
              gradientEnd: Alignment.topCenter,
            ),
            size: Size(double.infinity, double.infinity),
            backgroundColor: Colors.blue[50],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 100),
                child: Center(
                  child: BlocBuilder<TimerBloc, TimerState>(
                    builder: (context, state) {
                      if (state == null) {
                        return Container();
                      }
                      final String minutesSection = ((state.duration / 60) % 60)
                          .floor()
                          .toString()
                          .padLeft(2, '0');
                      final String secondSection = (state.duration % 60)
                          .floor()
                          .toString()
                          .padLeft(2, '0');
                      return Text(
                        '$minutesSection:$secondSection',
                        style: TextStyle(
                            fontSize: 60, fontWeight: FontWeight.bold),
                      );
                    },
                  ),
                ),
              ),
              BlocBuilder<TimerBloc, TimerState>(
                buildWhen: (previousState, state) =>
                    state.runtimeType != previousState.runtimeType,
                builder: (context, state) {
                  return Actions();
                },
              )
            ],
          )
        ],
      ),
    );
  }
}

class Actions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: _mapStateToActionButtons(
          timerBloc: BlocProvider.of<TimerBloc>(context)),
    );
  }

  List<Widget> _mapStateToActionButtons({TimerBloc timerBloc}) {
    final TimerState currentState = timerBloc.state;
    if (timerBloc.state is Ready) {
      return [
        FloatingActionButton(
            child: Icon(Icons.play_arrow),
            onPressed: () {
              timerBloc.add(Start(duration: currentState.duration));
            }),
      ];
    }
    if (currentState is Running) {
      return [
        FloatingActionButton(
            child: Icon(Icons.pause), onPressed: () => timerBloc.add(Pause())),
        FloatingActionButton(
            child: Icon(Icons.replay), onPressed: () => timerBloc.add(Reset())),
      ];
    }
    if (currentState is Paused) {
      return [
        FloatingActionButton(
            child: Icon(Icons.play_arrow),
            onPressed: () => timerBloc.add(Resume())),
        FloatingActionButton(
            child: Icon(Icons.replay), onPressed: () => timerBloc.add(Reset())),
      ];
    }
    if (currentState is Finished) {
      return [
        FloatingActionButton(
            child: Icon(Icons.replay), onPressed: () => timerBloc.add(Reset())),
      ];
    }
    return [];
  }
}
