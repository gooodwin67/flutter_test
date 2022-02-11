import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BankApp extends StatelessWidget {
  const BankApp({Key? key}) : super(key: key);

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
                      decoration: BoxDecoration(
                        color: Colors.grey[800],
                        borderRadius: BorderRadius.circular(7),
                      ),
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
              Expanded(
                child: ListView(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[800],
                            borderRadius: BorderRadius.circular(7)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
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
                        )),
                    SizedBox(height: 20),
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[800],
                              borderRadius: BorderRadius.circular(7)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Container(
                                  width: 80,
                                  height: 100,
                                  color: Colors.grey[900],
                                ),
                                SizedBox(width: 30),
                                Container(
                                  width: 80,
                                  height: 100,
                                  color: Colors.grey[900],
                                ),
                                SizedBox(width: 30),
                                Container(
                                  width: 80,
                                  height: 100,
                                  color: Colors.grey[900],
                                ),
                                SizedBox(width: 30),
                                Container(
                                  width: 80,
                                  height: 100,
                                  color: Colors.grey[900],
                                ),
                                SizedBox(width: 30),
                                Container(
                                  width: 80,
                                  height: 100,
                                  color: Colors.grey[900],
                                ),
                                SizedBox(width: 30),
                              ],
                            ),
                          ),
                        ),
                        const Positioned.fill(
                          right: -2,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Icon(
                              Icons.chevron_right,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: BorderRadius.circular(7)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: const Text(
                        'Новости',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 20),
                    Column(
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(7)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: const Text('Здесь будет первая новость',
                              style: TextStyle(color: Colors.white)),
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(7)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: const Text('Здесь будет первая новость',
                              style: TextStyle(color: Colors.white)),
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(7)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: const Text('Здесь будет первая новость',
                              style: TextStyle(color: Colors.white)),
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(7)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: const Text('Здесь будет первая новость',
                              style: TextStyle(color: Colors.white)),
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(7)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: const Text('Здесь будет первая новость',
                              style: TextStyle(color: Colors.white)),
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(7)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: const Text('Здесь будет первая новость',
                              style: TextStyle(color: Colors.white)),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ],
                ),
              ),
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
