import 'package:flutter/material.dart';

class testApp extends StatefulWidget {
  testApp({Key? key}) : super(key: key);

  @override
  State<testApp> createState() => _testAppState();
}

class _testAppState extends State<testApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 30),
            Container(
              child: TextField(
                  decoration: InputDecoration(
                border: OutlineInputBorder(),
                focusColor: Colors.red,
              )),
            ),
          ],
        ),
      ),
    ));
  }
}
