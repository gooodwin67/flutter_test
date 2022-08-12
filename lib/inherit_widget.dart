import 'package:flutter/material.dart';

class InheritWidgetTest extends StatelessWidget {
  const InheritWidgetTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: InheritStatefullOne(),
        ),
      ),
    );
  }
}

class InheritStatefullOne extends StatefulWidget {
  const InheritStatefullOne({Key? key}) : super(key: key);

  @override
  State<InheritStatefullOne> createState() => _InheritStatefullOneState();
}

class _InheritStatefullOneState extends State<InheritStatefullOne> {
  int _value = 0;

  void _increment() {
    _value++;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
          onPressed: _increment,
          child: Text('press'),
        ),
        Text(
          'state: $_value',
        ),
        MyInheritWidget(
          value: _value,
          child: const InheritStatelessOne(),
        ),
      ],
    );
  }
}

class InheritStatelessOne extends StatelessWidget {
  const InheritStatelessOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final value =
    // context.findAncestorStateOfType<_InheritStatefullOneState>()?._value ?? 0;

    final value =
        context.dependOnInheritedWidgetOfExactType<MyInheritWidget>()?.value ??
            0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Получили и подписались: $value',
        ),
        const InheritStatelessTwo(),
      ],
    );
  }
}

class InheritStatelessTwo extends StatelessWidget {
  const InheritStatelessTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final element =
        context.getElementForInheritedWidgetOfExactType<MyInheritWidget>();
    final inherit = element?.widget as MyInheritWidget;
    final value = inherit.value;

    return Text(
      'Получили без подписки: $value',
    );
  }
}

class MyInheritWidget extends InheritedWidget {
  final int value;

  MyInheritWidget({
    Key? key,
    required Widget child,
    required int this.value,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(MyInheritWidget oldWidget) {
    return value != oldWidget.value;
  }
}
