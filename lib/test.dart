import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class MultyGame extends StatefulWidget {
  const MultyGame({Key? key}) : super(key: key);

  @override
  State<MultyGame> createState() => _MultyGameState();
}

class SettingBlock {
  int res = 0;
  Color color = Color.fromARGB(235, 62, 136, 248);
  SettingBlock({required this.res, required this.color});
}

class _MultyGameState extends State<MultyGame> {
  bool canTap = true;
  int num1 = 0;
  int num2 = 0;
  int res = 0;
  List list = [
    SettingBlock(res: 0, color: Color.fromARGB(235, 62, 136, 248)),
    SettingBlock(res: 0, color: Color.fromARGB(235, 62, 136, 248)),
    SettingBlock(res: 0, color: Color.fromARGB(235, 62, 136, 248)),
  ];

  void multypleInit() {
    list = [
      SettingBlock(res: 0, color: Color.fromARGB(235, 62, 136, 248)),
      SettingBlock(res: 0, color: Color.fromARGB(235, 62, 136, 248)),
      SettingBlock(res: 0, color: Color.fromARGB(235, 62, 136, 248)),
    ];
    num1 = 1 + Random().nextInt(9);
    num2 = 1 + Random().nextInt(9);

    res = num1 * num2;
    list[0].res = (1 + Random().nextInt(9)) * (1 + Random().nextInt(9));
    list[1].res = res;
    list[2].res = (1 + Random().nextInt(9)) * (1 + Random().nextInt(9));
    list.shuffle();
  }

  void multypleRes(index) {
    if (canTap) {
      setState(() {
        if (list[index].res == res) {
          list[index].color = Color.fromARGB(235, 63, 228, 48);
          canTap = false;
        } else {
          list[index].color = Color.fromARGB(235, 228, 60, 48);
          canTap = false;
        }
      });
      Future.delayed(const Duration(milliseconds: 1000), () {
        setState(() {
          multypleInit();
          canTap = true;
        });
      });
    }
  }

  @override
  void initState() {
    multypleInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(num1.toString(), style: TextStyle(fontSize: 80)),
                  Text(' * ', style: TextStyle(fontSize: 80)),
                  Text(num2.toString(), style: TextStyle(fontSize: 80)),
                ],
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        return multypleRes(0);
                      },
                      splashColor: canTap ? Colors.black : Colors.white,
                      child: Container(
                        color: list[0].color,
                        height: 150,
                        child: Center(
                          child: Text(
                            list[0].res.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 45,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        return multypleRes(1);
                      },
                      splashColor: canTap ? Colors.black : Colors.white,
                      child: Container(
                        color: list[1].color,
                        height: 150,
                        child: Center(
                          child: Text(
                            list[1].res.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 45,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        return multypleRes(2);
                      },
                      splashColor: canTap ? Colors.black : Colors.white,
                      child: Container(
                        color: list[2].color,
                        height: 150,
                        child: Center(
                          child: Text(
                            list[2].res.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 45,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}








/*
class MyBlock extends StatelessWidget {
  const MyBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {},
        splashColor: Colors.black,
        child: Container(
          color: Color.fromARGB(235, 255, 91, 79),
          height: 150,
          child: Center(
            child: Text('15'),
          ),
        ),
      ),
    );
  }
}
*/