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
  List _list = ['aaa', 'bbb', 'ccc', 4];
  List get list => _list;
  setNewList(newList) {
    _list = newList;
  }
}

class ProductsBlock extends StatelessWidget {
  final name;
  const ProductsBlock({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(name.toString());
  }
}
