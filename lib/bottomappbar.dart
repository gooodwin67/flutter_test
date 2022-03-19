import 'package:flutter/material.dart';

class BottomAppBarr extends StatelessWidget {
  const BottomAppBarr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter notch demo'),
        ),
        bottomNavigationBar: BottomAppBar(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: CircularNotchedRectangle(),
          child: Container(
            height: 60.0,
            color: Colors.pinkAccent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(),
                Icon(Icons.home, color: Colors.white),
                SizedBox(),
                Icon(Icons.mail, color: Colors.white),
                SizedBox(),
                SizedBox(),
                SizedBox(),
                Icon(Icons.home, color: Colors.white),
                SizedBox(),
                Icon(Icons.mail, color: Colors.white),
                SizedBox(),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.done_all),
        ),
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
