import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class JsonWidget extends StatelessWidget {
  const JsonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    printJson();
    return MaterialApp(
      home: Scaffold(
        body: Container(),
      ),
    );
  }
}

String jsonData1 = """
{
  "name": "Andrey",
  "surname": "Aleynik",
  "age": 38
}
""";

class User {
  String name;
  final String surname;
  final int age;

  User(this.name, this.surname, this.age);

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        surname = json['surname'],
        age = json['age'];

  Map<String, dynamic> toJson() =>
      {'name': name, 'surname': surname, 'age': age};
}

printJson() {
  Map<String, dynamic> userMap = jsonDecode(jsonData1);
  var user = User.fromJson(userMap);
  user.name = 'Oleg';
  String userJson = jsonEncode(user);
  print(user.name);
  print(userJson);
}

String jsonData2 = """
{
  
    "name": "Andrey",
    "surname": "Aleynik",
    "age": 38,
    "adresses": [
      {
        "city": "Smolensk",
        "street": "Garaburdy",
        "house": 17
      },
      {
        "city": "Smolensk",
        "street": "Nahimova",
        "house": 18
      }
    ]
  
}
""";
