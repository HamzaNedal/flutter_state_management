import 'package:flutter/material.dart';
import 'package:flutter_state_management/InheritedWidget/main.dart';
import 'package:flutter_state_management/InheritedWidget/shopping_cart/main.dart';
import 'package:flutter_state_management/simple_bolc/main.dart';
import 'package:flutter_state_management/statefulBuilder.dart';
import 'package:flutter_state_management/statefulWidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          // When navigating to the "/second" route, build the SecondScreen widget.
          '/statefullwidget': (context) => Home_StatefulWidget(),
          '/statefulBuilder': (context) => Home_StatefulBuilder(),
          '/inheritedWidget': (context) => Home_InheritedWidget(),
          '/homeShoppingCart': (context) => HomeShoppingCart(),
          '/mainCounter': (context) => MainCounter(),
        },
        title: 'Flutter State Management',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Builder(
            builder: (context) => Scaffold(
                appBar: AppBar(
                  title: Text('State Managemt'),
                ),
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, '/statefullwidget'),
                        child: Text("StatefulWidget"),
                      ),
                      RaisedButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, '/statefulBuilder'),
                        child: Text("StatefulBulider"),
                      ),
                      RaisedButton(
                        onPressed: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) =>
                          //             Home_InheritedWidget()));
                          Navigator.pushNamed(context, '/inheritedWidget');
                        },
                        child: Text("InheritedWidget"),
                      ),
                      RaisedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/homeShoppingCart');
                        },
                        child: Text("ShoppingCartWithIW"),
                      ),
                      RaisedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/mainCounter');
                        },
                        child: Text("Bloc"),
                      ),
                    ],
                  ),
                ))));
  }
}
