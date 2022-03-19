import 'package:flutter/material.dart';

class Wrapp extends StatelessWidget {
  const Wrapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Container(
            color: Color.fromARGB(255, 133, 223, 31),
            child: Center(
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                direction: Axis.vertical,
                children: [
                  Cont(),
                  Cont(),
                  Cont(),
                  Cont(),
                  Cont(),
                  Cont(),
                  Cont(),
                  Cont(),
                  Cont(),
                  Cont(),
                  Cont(),
                  Cont(),
                  Cont(),
                  Cont(),
                  Cont(),
                  Cont(),
                  Cont(),
                  Cont(),
                  Cont(),
                  Cont(),
                  Cont(),
                ],
              ),
            ),
          ),
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
