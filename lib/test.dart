import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  int _counter = 0;
  List<String> list = [];
  List<String> list2 = ['6', '7', '8'];

  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  //Loading counter value on start
  void _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    //prefs.clear();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0);
      list = (prefs.getStringList('list') ?? ['0']);
    });
  }

  //Incrementing counter after click
  void _incrementCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0) + 1;
      prefs.setInt('counter', _counter);

      list.add('1');
      prefs.setStringList('list', list);
    });
  }

  void _reset() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.clear();
      list = [];
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              Text('$_counter'),
              SizedBox(height: 20),
              Row(
                children: list.map((e) => Text(e)).toList(),
              ),
              ElevatedButton(onPressed: _reset, child: Text('Reset'))
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
