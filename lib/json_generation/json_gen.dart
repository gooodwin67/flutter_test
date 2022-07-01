import 'dart:convert';

import 'package:flutter/material.dart';

class JSonGenWidget extends StatelessWidget {
  const JSonGenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    decode() {
      print('decode');
    }

    encode() {
      print('encode');
    }

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: decode,
                child: Text('decode'),
              ),
              ElevatedButton(
                onPressed: encode,
                child: Text('encode'),
              ),
            ],
          ),
        ),
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

String jsonData2 = """
{
  "myWidget": {
    "myDebug": "on",
    "myWindow": {
        "title": "Sample Konfabulator Widget",
        "name": "main_window",
        "width": 500,
        "height": 500
    },
    "myImage": { 
        "src": "Images/Sun.png",
        "name": "sun1",
        "hOffset": 250,
        "vOffset": 250,
        "alignment": "center"
    }
  }
}  
""";
