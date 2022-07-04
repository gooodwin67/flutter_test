import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpWidget extends StatelessWidget {
  const HttpWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future getJson() async {
      var response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      List listPosts = jsonDecode(response.body);
      List listClassPosts = listPosts.map((e) => Post.fromJson(e)).toList();
      print(listClassPosts[0].id);
    }

    return MaterialApp(
      home: Scaffold(
        body: ListView.builder(
            itemCount: listClassPosts.length,
            itemBuilder: (BuildContext, index) {
              return Text(listClassPosts[index].title);
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
