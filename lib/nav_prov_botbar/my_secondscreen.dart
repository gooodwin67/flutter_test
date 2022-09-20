import 'package:flutter/material.dart';
import 'package:flutterprojects/nav_prov_botbar/bottom_bar.dart';

class MySecondScreen extends StatelessWidget {
  const MySecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('secondScreenBuild');
    return Scaffold(
      appBar: AppBar(
        title: Text('Second'),
      ),
      body: Center(
        child: Text('Second'),
      ),
      bottomNavigationBar: Bottombar(),
    );
  }
}
