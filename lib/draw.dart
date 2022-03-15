import 'dart:math';

import 'package:flutter/material.dart';

class Draw extends StatefulWidget {
  const Draw({Key? key}) : super(key: key);

  @override
  State<Draw> createState() => _DrawState();
}

class _DrawState extends State<Draw> {
  var inputController = TextEditingController();
  double percent = 0;
  double newPersent = 0;
  double _currentSliderValue = 0;

  void onChangeSliderValue(value) {
    _currentSliderValue = value;
    percent = value / 100;
    newPersent = percent * 100.round();

    setState(() {});
  }

  void onChangedInput(text) {
    if (inputController.text.isNotEmpty) {
      int num = int.parse(inputController.text);
      percent = num / 100;
      newPersent = double.parse(text);
    } else
      newPersent = 0;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Slider(
                value: _currentSliderValue,
                max: 100,
                divisions: 100,
                label: _currentSliderValue.round().toString(),
                onChanged: onChangeSliderValue,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  keyboardType: TextInputType.numberWithOptions(
                      decimal: true, signed: false),
                  controller: inputController,
                  onChanged: onChangedInput,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
              ),
              SizedBox(height: 50),
              Container(
                width: 100,
                height: 100,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.green)),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    CustomPaint(
                      painter: MyPaint(percent: newPersent),
                    ),
                    Center(
                      child: Text(
                        '$newPersent%',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyPaint extends CustomPainter {
  final double percent;

  MyPaint({required this.percent});

  @override
  void paint(Canvas canvas, Size size) {
    final backgroundPaint = Paint();
    backgroundPaint.color = Colors.black;

    canvas.drawArc(
      Offset(2.5, 2.5) & Size(size.width - 5, size.height - 5),
      -pi / 2,
      pi * 2,
      false,
      backgroundPaint,
    );

    final paint2 = Paint();
    paint2.color = Colors.yellow;
    paint2.style = PaintingStyle.stroke;
    paint2.strokeWidth = 5;

    canvas.drawArc(
      Offset(2.5, 2.5) & Size(size.width - 5, size.height - 5),
      -pi / 2,
      pi * 2,
      false,
      paint2,
    );

    final paint = Paint();
    paint.color = Colors.green;
    paint.style = PaintingStyle.stroke;
    paint.strokeCap = StrokeCap.round;
    paint.strokeWidth = 5;

    canvas.drawArc(
      Offset(2.5, 2.5) & Size(size.width - 5, size.height - 5),
      -pi / 2,
      pi * 2 * percent,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(MyPaint oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(MyPaint oldDelegate) => true;
}
