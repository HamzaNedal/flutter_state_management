import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_state_management/provider_select/myModel.dart';
import 'package:provider/provider.dart';

class ProviderSelect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Provider Select'),
        ),
        body: ChangeNotifierProvider(
            create: (context) => MyModel(),
            child: Column(
              children: <Widget>[
                Age(),
                Name(),
              ],
            )));
  }
}

class Age extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Age : ${Random().nextInt(200)}');
    var age = context.select((MyModel myModel) => myModel.age);
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("${age}"),
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Provider.of<MyModel>(context, listen: false).inc();
              }),
        ],
      ),
    );
  }
}

class Name extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var name = context.select((MyModel myModel) => myModel.name);
    print(Random().nextInt(200));
    return Column(
      children: <Widget>[
        Text(name),
        RaisedButton(
            child: Text('Change Name'),
            onPressed: () {
              Provider.of<MyModel>(context, listen: false).changeName();
            }),
      ],
    );
  }
}
