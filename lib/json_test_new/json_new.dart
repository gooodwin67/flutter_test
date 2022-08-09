import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class JsonNew extends StatefulWidget {
  const JsonNew({Key? key}) : super(key: key);

  @override
  State<JsonNew> createState() => _JsonNewState();
}

class _JsonNewState extends State<JsonNew> {
  List posts = [];
  void getHttp() async {
    try {
      var response =
          await Dio().get('https://jsonplaceholder.typicode.com/posts');
      posts = response.data.map((e) => Post.getJson(e)).toList();
      //print(posts[2].id);
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    getHttp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Text(posts[index].id.toString()),
                );
              }),
        ),
      ),
    );
  }
}

class Post {
  final int id;

  Post({required this.id});

  factory Post.getJson(Map<String, dynamic> json) {
    return Post(id: json['id']);
  }
}
