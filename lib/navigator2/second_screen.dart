import 'package:flutter/material.dart';
import 'package:flutterprojects/navigator2/bottom_bar.dart';

class Navigator2TestSecondScreen extends StatelessWidget {
  final Function goToRoute;
  const Navigator2TestSecondScreen(this.goToRoute, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBar(goToRoute),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('SecondPage'),
          ],
        ),
      ),
    );
  }
}
