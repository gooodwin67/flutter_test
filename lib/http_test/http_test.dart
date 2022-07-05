import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpWidget extends StatefulWidget {
  const HttpWidget({Key? key}) : super(key: key);

  @override
  State<HttpWidget> createState() => _HttpWidgetState();
}

class _HttpWidgetState extends State<HttpWidget> {
  List listClassPosts = [];

  @override
  void initState() {
    print('init');
    getJson();

    super.initState();
  }

  Future getJson() async {
    print('foo');
    var response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    print('then');

    setState(() {
      List listPosts = jsonDecode(response.body);
      listClassPosts = listPosts.map((e) => Post.fromJson(e)).toList();
      print(listClassPosts[0].id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView.builder(
            itemCount: listClassPosts.length == 0 ? 0 : listClassPosts.length,
            itemBuilder: (BuildContext, index) {
              return Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(7),
                color: Colors.grey,
                child: Text(listClassPosts[index].title),
              );
            }),
      ),
    );
  }
}

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
