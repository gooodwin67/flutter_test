import 'dart:convert';

import 'package:flutter/material.dart';

class JsonTest1 extends StatefulWidget {
  const JsonTest1({Key? key}) : super(key: key);

  @override
  State<JsonTest1> createState() => _JsonTest1State();
}

class _JsonTest1State extends State<JsonTest1> {
  @override
  void initState() {
    getJson();
    super.initState();
  }

  getJson() {
    print(jsonExample.runtimeType); //String

    var jsonMap = jsonDecode(jsonExample);

    print(jsonMap.runtimeType); //_InternalLinkedHashMap<String, dynamic>

    var item = Item.fromJson(jsonMap);

    print(item.key1); //1
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

String jsonExample = '''
{
  "key1": "1",
  "key2": "value2"
}
''';

class Item {
  final String key1;
  final String key2;

  Item({
    required this.key1,
    required this.key2,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      key1: json['key1'],
      key2: json['key2'],
    );
  }
}
