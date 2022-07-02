import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'json_gen.g.dart';

class JSonGenWidget extends StatelessWidget {
  const JSonGenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //printJson();
    decode() {
      print('decode');
      Map<String, dynamic> userMap = jsonDecode(jsonData1);
      var user = User.fromJson(userMap);
      print(user.name);
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

@JsonSerializable()
class User {
  final String name;
  final String surname;
  final int age;

  User(this.name, this.surname, this.age);

  factory User.fromJson(Map<String, dynamic> json) {
    return _$UserFromJson(json);
  }
}

String jsonData1 = """
{
  "name": "Andrey",
  "surname": "Aleynik",
  "age": 38
}
""";

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
