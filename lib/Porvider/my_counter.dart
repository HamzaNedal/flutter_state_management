import 'package:flutter/foundation.dart';

class MyCounter extends ChangeNotifier {
  int counter = 0;

  increment() {
    counter++;
    notifyListeners();
  }

  decrement() {
    counter--;
    notifyListeners();
  }
}
