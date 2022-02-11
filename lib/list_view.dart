import 'package:flutter/material.dart';
import 'dart:math';

class ListViewApp extends StatelessWidget {
  const ListViewApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Column(
                    children: [
                      Container(
                        width: 100,
                        height: 500,
                        color: Colors.red,
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: 100,
                        height: 500,
                        color: Colors.red,
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: 100,
                        height: 500,
                        color: Colors.red,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
