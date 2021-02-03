import 'package:flutter/material.dart';
import 'package:flutter_state_management/InheritedWidget/inheritedWidget.dart';

class Home2_InheritedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = CounterProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('InheritedWidget2'),
      ),
      body: Center(
        child: StatefulBuilder(
          builder: (context, StateSetter setState) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      setState(() {
                        return provider.counter--;
                      });
                    }),
                Text("${provider.counter}"),
                IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        return provider.counter++;
                      });
                    }),
              ],
            );
          },
        ),
      ),
    );
  }
}
