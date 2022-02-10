import 'package:flutter/material.dart';
import 'dart:math';

class SingleChildScrollViewApp extends StatelessWidget {
  const SingleChildScrollViewApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> items = <Widget>[];

    for (var i = 0; i < 10; i++) {
      //var aa = Text('$i');
      items.add(DataW());
      items.add(SizedBox(height: 5));
    }
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: items,
          ),
        ),
      ),
    );
  }
}

class DataW extends StatelessWidget {
  const DataW({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      color: Color.fromRGBO(Random().nextInt(255), Random().nextInt(255),
          Random().nextInt(255), 1),
    );
  }
}
