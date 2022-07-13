import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpJson2 extends StatefulWidget {
  const HttpJson2({Key? key}) : super(key: key);

  @override
  State<HttpJson2> createState() => _HttpJson2State();
}

class _HttpJson2State extends State<HttpJson2> {
  List todoList = [];
  bool dataLoad = false;

  Future getData() async {
    var response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
    List responseMap = jsonDecode(response.body);
    setState(() {
      todoList = responseMap.map((e) => ToDoBlock.fromJson(e)).toList();
      todoList.length > 0 ? dataLoad = true : dataLoad = false;
    });

    //print(toDoList);
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: dataLoad
              ? ListView.builder(
                  itemCount: todoList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      color: todoList[index].completed
                          ? Color.fromARGB(255, 183, 252, 166)
                          : Color.fromARGB(255, 233, 233, 233),
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(5),
                      child: Text(
                        todoList[index].title,
                      ),
                    );
                  },
                )
              : Center(
                  child: Container(
                    color: Colors.red,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: const Text(
                      'LOADING...',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}

class ToDoBlock {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  ToDoBlock({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory ToDoBlock.fromJson(Map<String, dynamic> json) {
    return ToDoBlock(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }
}
