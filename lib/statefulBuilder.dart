import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home_StatefulBuilder extends StatelessWidget {
  int counter = 1;
  @override
  Widget build(BuildContext context) {
    // print();
    return Scaffold(
      appBar: AppBar(
        title: Text('StatefulBuilder'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            myCounter(context),
            Text('rebuild $counter'),
          ],
        ),
      ),
    );
  }

  Widget myCounter(BuildContext context) {
    return StatefulBuilder(builder: (context, StateSetter setState) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {
                setState(() {
                  return counter--;
                });
              }),
          Text("$counter"),
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                setState(() {
                  return counter++;
                });
              }),
        ],
      );
    });
  }
}
