import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_management/simple_bolc/bloc_observer.dart';
import 'package:flutter_state_management/simple_bolc/counter_bloc/bloc.dart';
import 'package:flutter_state_management/simple_bolc/counter_bloc/event.dart';

class MainCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Bloc.observer = SimpleBlocObserver();
    return BlocProvider(create: (_) => CounterBloc(0), child: Counter());
  }
}

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc Pattern'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      counterBloc.add(CounterEvent.decrement);
                    }),
                BlocBuilder<CounterBloc, int>(
                    builder: (context, state) => Text("$state")),
                IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      counterBloc.add(CounterEvent.increment);
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
