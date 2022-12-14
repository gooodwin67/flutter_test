import 'package:flutter/material.dart';
import 'package:flutterprojects/go_router/go_bottom_bar.dart';

class GoRouterFirstScreen4 extends StatelessWidget {
  const GoRouterFirstScreen4({Key? key}) : super(key: key);

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
            Text('FirstPage4'),
            //ElevatedButton(onPressed: () {}, child: Text('ToFirstScreen3'))
          ],
        ),
      ),
    );
  }
}
