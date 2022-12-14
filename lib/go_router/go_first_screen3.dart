import 'package:flutter/material.dart';
import 'package:flutterprojects/go_router/go_bottom_bar.dart';
import 'package:go_router/go_router.dart';

class GoRouterFirstScreen3 extends StatelessWidget {
  const GoRouterFirstScreen3({Key? key}) : super(key: key);

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
            Text('FirstPage3'),
            ElevatedButton(
                onPressed: () {
                  context.go('/first2/first3/first4');
                },
                child: Text('ToFirstScreen4'))
          ],
        ),
      ),
    );
  }
}
