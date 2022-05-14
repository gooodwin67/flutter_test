import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  int inc = 0;

  pressedMinus() {
    setState(() {
      if (inc > 0) {
        inc--;
      }
    });
  }

  pressedPlus() {
    setState(() {
      inc++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
            width: double.infinity,
            color: Colors.red,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: pressedMinus,
                      child: Text('-'),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: pressedPlus,
                      child: Text('+'),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  inc.toString(),
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            )),
      ),
    );
  }
}
