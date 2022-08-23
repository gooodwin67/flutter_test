import 'package:flutter/material.dart';

class InheritWidget3 extends StatelessWidget {
  const InheritWidget3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = InheritWidget3Model();
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Inherit3Provider(
              model: model,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FirstNumWidget(),
                  SizedBox(height: 10),
                  SecondNumWidget(),
                  SizedBox(height: 10),
                  CalcButtonWidget(),
                  SizedBox(height: 10),
                  resWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FirstNumWidget extends StatelessWidget {
  const FirstNumWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
      ),
      onChanged: (value) => context
          .dependOnInheritedWidgetOfExactType<Inherit3Provider>()
          ?.model
          .firstNum = int.tryParse(value),
    );
  }
}

class SecondNumWidget extends StatelessWidget {
  const SecondNumWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
      ),
      onChanged: (value) => context
          .dependOnInheritedWidgetOfExactType<Inherit3Provider>()
          ?.model
          .secondNum = int.tryParse(value),
    );
  }
}

class CalcButtonWidget extends StatelessWidget {
  const CalcButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => context
          .dependOnInheritedWidgetOfExactType<Inherit3Provider>()
          ?.model
          .sum(),
      child: Text('calculate'),
    );
  }
}

class resWidget extends StatelessWidget {
  const resWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final result = Inherit3Provider.of(context)?.model.result ?? 0;
    return Text('result: $result');
  }
}

class InheritWidget3Model extends ChangeNotifier {
  int? firstNum;
  int? secondNum;
  int? result;

  void sum() {
    print(1);
    if (firstNum != null && secondNum != null) {
      result = firstNum! + secondNum!;
      print(2);
      notifyListeners();
    } else {
      result = null;
    }
    notifyListeners();
  }
}

class Inherit3Provider extends InheritedNotifier {
  final InheritWidget3Model model;

  Inherit3Provider({Key? key, required Widget child, required this.model})
      : super(key: key, notifier: model, child: child);

  static Inherit3Provider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Inherit3Provider>();
  }

  @override
  bool updateShouldNotify(Inherit3Provider oldWidget) {
    return true;
  }
}
