import 'package:flutter/material.dart';
import 'package:flutterprojects/nav_prov_botbar2/bottom_bar2.dart';

class MySecondScreen2 extends StatelessWidget {
  const MySecondScreen2({Key? key}) : super(key: key);

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
      bottomNavigationBar: Bottombar2(),
    );
  }
}
