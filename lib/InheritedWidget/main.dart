import 'package:flutter/material.dart';
import 'package:flutter_state_management/InheritedWidget/home.dart';
import 'package:flutter_state_management/InheritedWidget/inheritedWidget.dart';

class Home_InheritedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CounterProvider(
        child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeInheritedWidget(),
    ));
  }
}
