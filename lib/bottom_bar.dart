import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Floating Action Button'),
        ),
        body: Container(
          color: Color.fromARGB(255, 133, 223, 31),
          child: Center(
            child: Opacity(
              opacity: 1,
              child: Cont(),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(50))),
          child: Padding(
            padding: EdgeInsets.all(4),
            child: FloatingActionButton.small(
              onPressed: () {},
              child: Icon(Icons.add),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'one',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fireplace_sharp),
            label: 'two',
          ),
        ]),
      ),
    );
  }
}

class Cont extends StatelessWidget {
  const Cont({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      color: Colors.red,
    );
  }
}
