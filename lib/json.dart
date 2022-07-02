import 'dart:convert';

import 'package:flutter/material.dart';

class JsonWidget extends StatelessWidget {
  const JsonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //printJson();
    decode() {
      print('decode');
      final Map<String, dynamic> jSon = jsonDecode(jsonData2);
      print(jSon);
      final jSon2 = WidgetInfo.fromJson(jSon);
      print(jSon2.myWidget["myDebug"]);
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

class WidgetInfo {
  final Map myWidget;

  WidgetInfo({required this.myWidget});

  factory WidgetInfo.fromJson(Map<String, dynamic> json) {
    return WidgetInfo(
      myWidget: json["myWidget"],
    );
  }
}

class WidgetInfoResponce {
  final String myDebug;
  final WindowInfoResponce myWindow;
  final ImageInfoResponce myImage;

  WidgetInfoResponce(
      {required this.myDebug, required this.myWindow, required this.myImage});

  factory WidgetInfoResponce.fromJson(Map<String, dynamic> json) {
    return WidgetInfoResponce(
      myDebug: json["myDebug"] as String,
      myWindow: json["myWindow"] as WindowInfoResponce,
      myImage: json["myImage"] as ImageInfoResponce,
    );
  }
}

class WindowInfoResponce {
  final String myTitle;
  final String myName;
  final int myWidth;
  final int myHeight;

  WindowInfoResponce(this.myTitle, this.myName, this.myWidth, this.myHeight);
}

class ImageInfoResponce {
  final String mySrc;
  final String myName;
  final int myHOffset;
  final int myVOffset;
  final String myAlignment;

  ImageInfoResponce(this.mySrc, this.myName, this.myHOffset, this.myVOffset,
      this.myAlignment);
}
