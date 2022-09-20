import 'package:flutter/material.dart';
import 'package:flutterprojects/nav_prov_botbar/data_provider.dart';
import 'package:provider/provider.dart';

class Bottombar extends StatelessWidget {
  const Bottombar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    onTap(index) {
      final List list = ['first', 'second'];
      Navigator.pushNamed(context, list[index]);
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
