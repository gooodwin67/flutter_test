import 'package:flutter/material.dart';

class TestApp extends StatelessWidget {
  const TestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.account_box_rounded,
                    size: 40,
                    color: Colors.blue,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      color: Colors.grey[800],
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 4),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.search,
                              color: Colors.grey,
                              size: 25,
                            ),
                            SizedBox(width: 5),
                            Text('Поиск',
                                style: TextStyle(
                                  color: Colors.grey,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Icon(
                    Icons.menu,
                    size: 40,
                    color: Colors.blue,
                  ),
                  const SizedBox(width: 10),
                  const Icon(
                    Icons.notification_important,
                    size: 40,
                    color: Colors.blue,
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  color: Colors.grey[800],
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Text(
                            'Досупные средства',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.keyboard_arrow_up_outlined,
                            color: Colors.white,
                          ),
                          Expanded(child: SizedBox()),
                          Icon(
                            Icons.more_vert,
                            color: Colors.blue,
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      const RowData(
                          icon: Icons.room_rounded,
                          text: 'Всего',
                          money: '1 529 772,40 Р'),
                      const SizedBox(height: 30),
                      const RowData(
                          icon: Icons.star, text: 'Бонусы', money: '0'),
                      const SizedBox(height: 30),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class RowData extends StatelessWidget {
  final IconData icon;
  final String text;
  final String money;

  const RowData({
    required this.icon,
    required this.text,
    required this.money,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 40,
          color: Colors.grey[900],
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(text,
                style: const TextStyle(color: Colors.white, fontSize: 15)),
            const SizedBox(height: 5),
            Text(money,
                style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ],
        ),
        const Expanded(child: SizedBox()),
        const Icon(
          Icons.remove_red_eye_outlined,
          color: Colors.grey,
        )
      ],
    );
  }
}
