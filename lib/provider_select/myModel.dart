import 'package:flutter/foundation.dart';

class MyModel extends ChangeNotifier {
  String name = 'Apple';
  int age = 22;

  inc() {
    age++;
    notifyListeners();
  }

  changeName() {
    name = 'my name is banana';
    notifyListeners();
  }
}
