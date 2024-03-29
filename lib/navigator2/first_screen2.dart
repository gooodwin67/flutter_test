import 'package:flutter/material.dart';
import 'package:flutterprojects/navigator2/bottom_bar.dart';

class Navigator2TestFirstScreen2 extends StatelessWidget {
  final Function goToRoute;
  const Navigator2TestFirstScreen2(this.goToRoute, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: BottomBar(goToRoute),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('FirstPage2'),
            ElevatedButton(
                onPressed: () {
                  goToRoute('/first/first2/first3');
                },
                child: Text('ToFirstScreen3'))
          ],
        ),
      ),
    );
  }
}
