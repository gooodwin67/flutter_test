import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedTest extends StatefulWidget {
  const SharedTest({Key? key}) : super(key: key);

  @override
  State<SharedTest> createState() => _SharedTestState();
}

class _SharedTestState extends State<SharedTest> {
  int number = 0;
  int number2 = 0;

  onPress() async {
    final pref = await SharedPreferences.getInstance();
    setState(() {
      number++;
      pref.setInt('number', number);
      number2 = pref.getInt('number') ?? 0;
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
              Text(number.toString()),
              ElevatedButton(
                onPressed: onPress,
                child: Text('press'),
              ),
              Text(number2.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
