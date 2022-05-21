// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class LayoutTest extends StatelessWidget {
  const LayoutTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(10),
            color: Color.fromARGB(255, 180, 234, 255),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.black,
                  ),
                  height: 100,
                  width: double.infinity,
                  child: Center(
                      child:
                          Text('Head', style: TextStyle(color: Colors.white))),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.red,
                        ),
                        height: 200,
                        child: Center(child: Text('Block1')),
                      ),
                      SizedBox(height: 20),
                      Container(
                        height: 200,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Color.fromARGB(255, 54, 244, 63),
                              ),
                              width: 150,
                            ),
                            SizedBox(width: 20),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Color.fromARGB(255, 54, 244, 63),
                              ),
                              width: 150,
                            ),
                            SizedBox(width: 20),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Color.fromARGB(255, 54, 244, 63),
                              ),
                              width: 150,
                            ),
                            SizedBox(width: 20),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Color.fromARGB(255, 54, 244, 63),
                              ),
                              width: 150,
                            ),
                            SizedBox(width: 20),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Color.fromARGB(255, 54, 98, 244),
                        ),
                        height: 40,
                        child: Center(child: Text('Block1')),
                      ),
                      Column(
                        children: [
                          Block(),
                          SizedBox(height: 10),
                          Block(),
                          SizedBox(height: 10),
                          Block(),
                          SizedBox(height: 10),
                          Block(),
                          SizedBox(height: 10),
                          Block(),
                          SizedBox(height: 10),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Block extends StatelessWidget {
  const Block({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        color: Color.fromARGB(255, 54, 222, 244),
      ),
    );
  }
}
