import 'package:flutter/material.dart';
import 'package:flutterprojects/user_profile.dart';

class App extends StatelessWidget {
  const App();

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: UserProfile(),
    );
  }
}
