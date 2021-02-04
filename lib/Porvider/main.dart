import 'package:flutter/material.dart';
import 'package:flutter_state_management/Porvider/my_counter.dart';
import 'package:flutter_state_management/Porvider/screen2.dart';
import 'package:provider/provider.dart';

class MainAppProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyCounter>(
      create: (context) => MyCounter(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Provider(),
      ),
    );
  }
}

class Provider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider'),
        actions: [
          IconButton(
              icon: Icon(Icons.forward),
              onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ProviderScreen2())))
        ],
      ),
      body: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}
