import 'package:flutter/material.dart';
import 'package:flutterprojects/nav_prov_botbar2/data_provider2.dart';
import 'package:provider/provider.dart';

class Bottombar2 extends StatelessWidget {
  const Bottombar2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    onTap(index) {
      context.read<DataProvider2>().changeScreen(index + 1);
      context.read<DataProvider2>().changeBarItemActive(index);
    }

    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'First',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Second',
        ),
      ],
      currentIndex: context.watch<DataProvider2>().index,
      selectedItemColor: Colors.amber[800],
      onTap: (index) => onTap(index),
    );
  }
}
