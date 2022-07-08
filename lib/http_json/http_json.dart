import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpJson extends StatefulWidget {
  const HttpJson({Key? key}) : super(key: key);

  @override
  State<HttpJson> createState() => _HttpJsonState();
}

class _HttpJsonState extends State<HttpJson> {
  List listPosts = [];

  Future getPosts() async {
    var response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));

    List postsMap = jsonDecode(response.body);
    listPosts = postsMap.map((e) => Post.fromJson(e)).toList();
    //print(listPosts);
    setState(() {});
  }

  @override
  void initState() {
    getPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView.builder(
            itemCount: listPosts.length,
            itemBuilder: (BuildContext, index) {
              return DefaultTextStyle(
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
                child: Container(
                  color: index % 2 == 0
                      ? Color.fromARGB(255, 77, 122, 79)
                      : Color.fromARGB(255, 64, 74, 131),
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                  child: index % 2 == 0
                      ? Text(listPosts[index].title, textAlign: TextAlign.left)
                      : Text(listPosts[index].title,
                          textAlign: TextAlign.right),
                ),
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
  final bool completed;

  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }
}
