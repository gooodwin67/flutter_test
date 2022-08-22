import 'package:flutter/material.dart';

class SimpleCalcWidget extends StatefulWidget {
  const SimpleCalcWidget({Key? key}) : super(key: key);

  @override
  State<SimpleCalcWidget> createState() => _SimpleCalcWidgetState();
}

class _SimpleCalcWidgetState extends State<SimpleCalcWidget> {
  final model = SimpleCalcWidgetModel();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SimpleCalcWidgetProvider(
                model: model,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FirstNumberWidget(),
                    SizedBox(height: 10),
                    SecondNumberWidget(),
                    SizedBox(height: 10),
                    ButtonCalculateWidget(),
                    ResultWidget(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FirstNumberWidget extends StatelessWidget {
  const FirstNumberWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
      ),
      onChanged: (value) =>
          SimpleCalcWidgetProvider.of(context)?.model.firstNumber = value,
    );
  }
}

class SecondNumberWidget extends StatelessWidget {
  const SecondNumberWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
      ),
      onChanged: (value) =>
          SimpleCalcWidgetProvider.of(context)?.model.secondNumber = value,
    );
  }
}

class ButtonCalculateWidget extends StatelessWidget {
  const ButtonCalculateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => SimpleCalcWidgetProvider.of(context)?.model.getSum(),
      child: Text('Calculate'),
    );
  }
}

class ResultWidget extends StatelessWidget {
  const ResultWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final result = SimpleCalcWidgetProvider.of(context)?.model.result ?? 0;
    print(result);
    return Text('Result: $result');
  }
}

class SimpleCalcWidgetModel extends ChangeNotifier {
  int? _firstNumber;
  int? _secondNumber;
  int? result;

  set firstNumber(String value) => _firstNumber = int.tryParse(value);
  set secondNumber(String value) => _secondNumber = int.tryParse(value);

  void getSum() {
    if (_firstNumber != null && _secondNumber != null) {
      result = _firstNumber! + _secondNumber!;
    } else {
      result = null;
    }
    if (_firstNumber != null && _secondNumber != null) {
      print(_secondNumber);
      notifyListeners();
    }
  }
}

class SimpleCalcWidgetProvider extends InheritedNotifier {
  final SimpleCalcWidgetModel model;
  SimpleCalcWidgetProvider(
      {Key? key, required Widget child, required this.model})
      : super(key: key, notifier: model, child: child);

  static SimpleCalcWidgetProvider? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<SimpleCalcWidgetProvider>();
  }
}
