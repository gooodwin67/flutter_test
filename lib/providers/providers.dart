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

class Products with ChangeNotifier {
  List _list = [
    ProdBlock(name: 'aaa'),
    ProdBlock(name: 'bbb'),
  ];

  List get list => _list;
  setNewList(index) {
    _list[index].name = 'asdasd';
    notifyListeners();
  }

  setNewList2() {
    _list.add(ProdBlock(name: 'new'));
    notifyListeners();
  }
}

class ProdBlock {
  String name;
  ProdBlock({Key? key, required this.name});
}
