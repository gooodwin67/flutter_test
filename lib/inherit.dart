import 'package:flutter/material.dart';

class InheritValue extends InheritedWidget {
  final int value;
  const InheritValue({Key? key, required this.value, required this.child})
      : super(key: key, child: child);

  final Widget child;

  static InheritValue? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritValue>();
  }

  @override
  bool updateShouldNotify(InheritValue oldWidget) {
    return value != oldWidget.value;
  }
}

class InheritTest extends StatefulWidget {
  const InheritTest({Key? key}) : super(key: key);

  @override
  State<InheritTest> createState() => _InheritTestState();
}

class _InheritTestState extends State<InheritTest> {
  int value = 0;

  onIncrement() {
    value++;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InheritValue(
        value: value,
        child: Scaffold(
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: onIncrement,
                child: Text('press'),
              ),
              SecondWidget(),
            ],
          )),
        ),
      ),
    );
  }
}

class SecondWidget extends StatelessWidget {
  const SecondWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int value =
        context.dependOnInheritedWidgetOfExactType<InheritValue>()?.value ?? 0;
    return Container(
      child: Text('$value'),
    );
  }
}
