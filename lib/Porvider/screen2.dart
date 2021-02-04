import 'package:flutter/material.dart';
import 'package:flutter_state_management/Porvider/my_counter.dart';
import 'package:provider/provider.dart';

class ProviderScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ProviderScreen2"),
        ),
        body: Center(
          child: Consumer<MyCounter>(builder: (context, mycounter, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      mycounter.decrement();
                    }),
                Text("${mycounter.counter}"),
                IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      mycounter.increment();
                    }),
              ],
            );
          }),
        ));
  }
}
