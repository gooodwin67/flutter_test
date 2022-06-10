import 'package:flutter/material.dart';
import 'package:flutterprojects/navigator/first_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: FirstScreen());
  }
}
