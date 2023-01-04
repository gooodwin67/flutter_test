import 'dart:convert';

import 'package:flutter/material.dart';

class JsonAllTest extends StatelessWidget {
  const JsonAllTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var response = jsonData1;
    final Map<String, dynamic> responseMap = jsonDecode(response);
    var resResponse = Response.fromJson(responseMap);

    var responseDataMap = ResponseData.fromJson(resResponse.response);

    int count = responseDataMap.count;
    List items = responseDataMap.items.map((e) => Item.fromJson(e)).toList();

    List attachments =
        items[0].attachments.map((e) => Attachment.fromJson(e)).toList();

    print(attachments[0].type);

    return Container(
      color: Colors.red,
    );
  }
}

class Response {
  final Map<String, dynamic> response;

  Response({required this.response});

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
      response: json['response'] as Map<String, dynamic>,
    );
  }
}

class ResponseData {
  final int count;
  final List items;

  ResponseData({required this.count, required this.items});

  factory ResponseData.fromJson(Map<String, dynamic> json) {
    return ResponseData(
      count: json['count'],
      items: json['items'],
    );
  }
}

class Item {
  final int id;
  final int date;
  final Map active;
  final List attachments;

  Item(
      {required this.id,
      required this.date,
      required this.active,
      required this.attachments});
  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      date: json['date'],
      active: json['active'],
      attachments: json['attachments'],
    );
  }
}

class Active {
  final bool isActive;

  Active({required this.isActive});
}

class Attachment {
  final String type;
  final Map photo;

  Attachment({required this.type, required this.photo});

  factory Attachment.fromJson(Map<String, dynamic> json) {
    return Attachment(type: json['type'], photo: json['photo']);
  }
}

class Photo {
  final int albumId;

  Photo({required this.albumId});
}

String jsonData1 = """
  {
    "response" : {
      "count": 2,
      "items": [
        {
          "id": 1,
          "date": 1574251946 ,
          "active": {
              "is_active": false
          },
          "attachments": [
            {
              "type": "photo",
              "photo": {
                "albom_id": 1
              }
            },
            {
              "type": "photo",
              "photo": {
                "albom_id": 2
              }
            }
          ]
        },
        {
          "id": 2,
          "date": 1574251946 ,
          "active": {
              "is_active": true
          },
          "attachments": [
            {
              "type": "photo",
              "photo": {
                "albom_id": 3
              }
            },
            {
              "type": "photo",
              "photo": {
                "albom_id": 4
              }
            }
          ]
        }
      ]
    }
  }
""";
