import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  int value = 0;
  _onPressed() {
    value++;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _onPressed,
                child: Text('press'),
              ),
              TestInherit(
                value: value,
                child: SecondWidget(),
              )
            ],
          ),
        )),
      ),
    );
  }
}

class SecondWidget extends StatelessWidget {
  const SecondWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int value =
        context.dependOnInheritedWidgetOfExactType<TestInherit>()?.value ?? 0;
    return Column(
      children: [
        Text(value.toString()),
        TestInherit(
          value: value,
          child: ThirdWidget(),
        )
      ],
    );
  }
}

class ThirdWidget extends StatefulWidget {
  const ThirdWidget({Key? key}) : super(key: key);

  @override
  State<ThirdWidget> createState() => _ThirdWidgetState();
}

class _ThirdWidgetState extends State<ThirdWidget> {
  @override
  Widget build(BuildContext context) {
    int value =
        context.dependOnInheritedWidgetOfExactType<TestInherit>()?.value ?? 0;
    return Column(
      children: [
        Text('$value'),
      ],
    );
  }
}

class TestInherit extends InheritedWidget {
  final int value;
  const TestInherit({Key? key, required this.child, required this.value})
      : super(key: key, child: child);

  final Widget child;

  static TestInherit? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TestInherit>();
  }

  @override
  bool updateShouldNotify(TestInherit oldWidget) {
    return value != oldWidget.value;
  }
}
