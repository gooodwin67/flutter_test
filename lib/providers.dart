import 'package:flutter/material.dart';

class Number with ChangeNotifier {
  int _num = 7;
  int get num => _num;
  void increment() {
    _num++;
    notifyListeners();
  }

  void decrement(int a) {
    _num += a;
    notifyListeners();
  }
}
