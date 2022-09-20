import 'package:flutter/material.dart';

class DataProvider2 with ChangeNotifier {
  String _num = 'test provider';
  int _index = 0;

  int _screen = 0;

  String get num => _num;
  int get index => _index;
  int get screen => _screen;

  void changeScreen(i) {
    _screen = i;
    notifyListeners();
  }

  void changeBarItemActive(i) {
    _index = i;
    notifyListeners();
  }

  void changeText(text) {
    _num = 'New Text Provider';
    notifyListeners();
  }
}
