import 'package:flutter/material.dart';
import 'dart:math';

class ListViewApp extends StatelessWidget {
  const ListViewApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
            itemCount: 100,
            itemBuilder: (BuildContext, index) {
              return Text('data $index');
            }),
      ),
    );
  }
}
