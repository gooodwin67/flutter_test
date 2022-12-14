import 'package:flutter/material.dart';
import 'package:flutterprojects/go_router/go_bottom_bar.dart';

class GoRouterSecondScreen extends StatelessWidget {
  const GoRouterSecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: GoBottomBar(),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('SecondPage'),
            ElevatedButton(onPressed: () {}, child: Text('ToSecondScreen2'))
          ],
        ),
      ),
    );
  }
}
