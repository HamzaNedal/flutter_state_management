import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class Home_StatefulWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home_StatefulWidget> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('State Managemt'),
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
          ),
          Text('rebuild widget $counter'),
        ],
      )),
    );
  }
}
