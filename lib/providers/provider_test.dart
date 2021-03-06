import 'package:flutter/material.dart';
import 'package:flutterprojects/providers/providers.dart';

import 'package:provider/provider.dart';

class TestProvider extends StatefulWidget {
  const TestProvider({Key? key}) : super(key: key);

  @override
  State<TestProvider> createState() => _TestProviderState();
}

class _TestProviderState extends State<TestProvider> {
  @override
  Widget build(BuildContext context) {
    List list = context.watch<Products>().list;

    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: double.infinity,
          color: Color.fromARGB(255, 188, 255, 221),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return ElevatedButton(
                        onPressed: () {
                          context.read<Products>().setNewList(index);
                        },
                        child: Text(list[index].name));
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<Products>().setNewList2();
                },
                child: Text('Press'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
