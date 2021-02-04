import 'package:flutter/material.dart';
import 'package:flutter_state_management/InheritedWidget/main.dart';
import 'package:flutter_state_management/InheritedWidget/shopping_cart/main.dart';
import 'package:flutter_state_management/Porvider/main.dart';
import 'package:flutter_state_management/blocs/bloc_with_repository/main.dart';
import 'package:flutter_state_management/blocs/simple_bolc/main.dart';
import 'package:flutter_state_management/provider_select/main.dart';
import 'package:flutter_state_management/statefulBuilder.dart';
import 'package:flutter_state_management/statefulWidget.dart';
import 'package:flutter_state_management/blocs/timer/main.dart';

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
          '/timer': (context) => Timer(),
          '/posts': (context) => Posts(),
          '/provider': (context) => MainAppProvider(),
          '/provider-select': (context) => ProviderSelect(),
        },
        title: 'Flutter State Management',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Builder(
            builder: (context) => Scaffold(
                appBar: AppBar(
                  title: Text('State Management'),
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
                        child: Text("BlocCounter"),
                      ),
                      RaisedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/timer');
                        },
                        child: Text("BlocTimer"),
                      ),
                      RaisedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/posts');
                        },
                        child: Text("blocWithRepository"),
                      ),
                      RaisedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/provider');
                        },
                        child: Text("Provider"),
                      ),
                      RaisedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/provider-select');
                        },
                        child: Text("ProviderSelect"),
                      ),
                    ],
                  ),
                ))));
  }
}
