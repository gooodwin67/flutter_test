import 'package:flutter/material.dart';

class TestApp extends StatelessWidget {
  const TestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var list = [
      RowData(icon: Icons.access_alarm, text: '1'),
      RowData(icon: Icons.access_alarm, text: '2')
    ];
    List<Widget> listW = [];

    //list.map((el) => listW.add(_ColItem(data: el)));
    /*for (var i = 0; i < list.length; i++) {
      listW.add(ColItem(icon: list[i].icon, data: list[i].text));
    }*/
    list.map((el) => listW.add(ColItem(icon: el.icon, data: el.text)));

    print(listW);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: listW,
        ),
      ),
    );
  }
}

class RowData {
  var icon;
  var text;
  RowData({this.icon, this.text});
}

class ColItem extends StatelessWidget {
  IconData icon;
  String data;
  ColItem({
    required this.icon,
    required this.data,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        Text(data),
      ],
    );
  }
}
