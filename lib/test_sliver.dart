import 'package:flutter/material.dart';

class TestSliver extends StatelessWidget {
  const TestSliver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: ListView(
        children: [
          Container(
            color: Colors.red,
            height: 100,
          ),
          Container(
            height: 800,
            child: CustomScrollView(
              slivers: <Widget>[
                new SliverAppBar(
                  floating: true,
                  title: Row(
                    children: [
                      Container(
                        width: 50,
                        height: 250,
                        color: Colors.green,
                      )
                    ],
                  ),
                  pinned: true,
                ),
                new SliverFixedExtentList(
                  itemExtent: 50.0,
                  delegate: new SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return new Container(
                        alignment: Alignment.center,
                        color: Colors.lightBlue[100 * (index % 9)],
                        child: new Text('list item $index'),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
