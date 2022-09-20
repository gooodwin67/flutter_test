import 'package:flutter/cupertino.dart';

class DataProvider2 with ChangeNotifier {
  String _num = 'test provider';
  int _index = 0;

  String get num => _num;
  int get index => _index;

  void changeBarItemActive(i) {
    _index = i;
    notifyListeners();
  }

  void changeText(text) {
    _num = 'New Text Provider';
    notifyListeners();
  }
}
