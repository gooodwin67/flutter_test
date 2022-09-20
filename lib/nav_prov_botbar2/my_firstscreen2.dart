import 'package:flutter/material.dart';
import 'package:flutterprojects/nav_prov_botbar2/bottom_bar2.dart';
import 'package:flutterprojects/nav_prov_botbar2/data_provider2.dart';
import 'package:provider/provider.dart';

class MyFirstScreen2 extends StatelessWidget {
  const MyFirstScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('firstScreenBuild');
    changeText() {
      context.read<DataProvider2>().changeText('sdf');
    }

    String text = context.watch<DataProvider2>().num;
    return Scaffold(
      appBar: AppBar(
        title: Text('First'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text),
            ElevatedButton(onPressed: changeText, child: Text('change'))
          ],
        ),
      ),
      bottomNavigationBar: Bottombar2(),
    );
  }
}
