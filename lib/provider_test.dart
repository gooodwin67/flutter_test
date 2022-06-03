import 'package:flutter/material.dart';
import 'package:flutterprojects/provider_test2.dart';

import 'package:flutterprojects/providers.dart';
import 'package:provider/provider.dart';

class TestProvider extends StatelessWidget {
  const TestProvider({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: double.infinity,
          color: Color.fromARGB(255, 188, 255, 221),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(context.watch<Number>().num.toString()),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  context.read<Number>().increment();
                  //print(aa.toString());
                },
                child: Text('Press'),
              ),
              SizedBox(height: 20),
              TestProviderSecondFile(),
            ],
          ),
        ),
      ),
    );
  }
}
