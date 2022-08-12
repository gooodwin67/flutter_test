// Без InheritedModel обновляются оба выджета, не важно какое значение в инхерите изменилось

import 'package:flutter/material.dart';

class InheritModelTest extends StatelessWidget {
  const InheritModelTest({Key? key}) : super(key: key);

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
  int _value1 = 0;
  int _value2 = 0;

  void _increment1() {
    _value1++;
    setState(() {});
  }

  void _increment2() {
    _value2++;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
          onPressed: _increment1,
          child: Text('press1'),
        ),
        ElevatedButton(
          onPressed: _increment2,
          child: Text('press2'),
        ),
        MyInheritWidget(
          value1: _value1,
          value2: _value2,
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
    final value = context
            .dependOnInheritedWidgetOfExactType<MyInheritWidget>(aspect: 'one')
            ?.value1 ??
        0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Первое значение: $value',
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
    final value = context
            .dependOnInheritedWidgetOfExactType<MyInheritWidget>(aspect: 'two')
            ?.value2 ??
        0;

    return Text(
      'Второе значение: $value',
    );
  }
}

class MyInheritWidget extends InheritedModel {
  final int value1;
  final int value2;

  MyInheritWidget({
    Key? key,
    required Widget child,
    required int this.value1,
    required int this.value2,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(MyInheritWidget oldWidget) {
    return value1 != oldWidget.value1 || value2 != oldWidget.value2;
  }

  @override
  bool updateShouldNotifyDependent(
    covariant MyInheritWidget oldWidget,
    Set dependencies,
  ) {
    final isValue1Update =
        value1 != oldWidget.value1 && dependencies.contains('one');
    final isValue2Update =
        value2 != oldWidget.value2 && dependencies.contains('two');
    return isValue1Update || isValue2Update;
  }
}
