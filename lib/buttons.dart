import 'package:flutter/material.dart';

class Buttons extends StatefulWidget {
  const Buttons({Key? key}) : super(key: key);

  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  double textSize = 30;
  void pressedButton() {
    setState(() {
      textSize++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: pressedButton,
                child: Text(
                  'Нажми',
                  style: TextStyle(fontSize: textSize),
                ),
              ),
              SizedBox(height: 50),
              OutlinedButton(
                onPressed: () {},
                child: const Text(
                  'Нажми',
                  style: TextStyle(fontSize: 40),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
