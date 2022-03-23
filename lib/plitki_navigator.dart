import 'package:flutter/material.dart';

class Plitki extends StatelessWidget {
  const Plitki({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => const Home(),
        '/contacts': (BuildContext context) => const Contacts(),
        '/account': (BuildContext context) => const Account(),
        '/exit': (BuildContext context) => const Exit(),
      },
      home: Scaffold(
          appBar: AppBar(
            title: Text('Test'),
          ),
          bottomNavigationBar: BottomAppBar(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: CircularNotchedRectangle(),
            child: Container(
              height: 60.0,
              color: Color.fromARGB(255, 7, 143, 7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(),
                  Builder(
                    builder: (context) => InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/home');
                      },
                      splashColor: Colors.black,
                      child: Icon(Icons.home, color: Colors.white),
                    ),
                  ),
                  SizedBox(),
                  Builder(
                    builder: (context) => InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/contacts');
                      },
                      splashColor: Colors.black,
                      child: Icon(Icons.map, color: Colors.white),
                    ),
                  ),
                  SizedBox(),
                  SizedBox(),
                  SizedBox(),
                  Builder(
                    builder: (context) => InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/account');
                      },
                      splashColor: Colors.black,
                      child: Icon(Icons.account_box, color: Colors.white),
                    ),
                  ),
                  SizedBox(),
                  Builder(
                    builder: (context) => InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/exit');
                      },
                      splashColor: Colors.black,
                      child: Icon(Icons.exit_to_app, color: Colors.white),
                    ),
                  ),
                  SizedBox(),
                ],
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.done_all),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                SizedBox(height: 30),
                Row(
                  children: const [
                    MyBlock(
                      color: Color.fromARGB(235, 24, 199, 33),
                      icon: Icons.home,
                      text: 'Home',
                      link: '/home',
                    ),
                    SizedBox(width: 15),
                    MyBlock(
                      color: Color.fromARGB(235, 255, 177, 59),
                      icon: Icons.map,
                      text: 'Contacts',
                      link: '/contacts',
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: const [
                    MyBlock(
                      color: Color.fromARGB(235, 24, 129, 199),
                      icon: Icons.account_box,
                      text: 'Account',
                      link: '/account',
                    ),
                    SizedBox(width: 15),
                    MyBlock(
                      color: Color.fromARGB(235, 255, 59, 157),
                      icon: Icons.exit_to_app,
                      text: 'Exit',
                      link: '/exit',
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}

class MyBlock extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String text;
  final String link;

  const MyBlock({
    Key? key,
    required this.color,
    required this.icon,
    required this.text,
    required this.link,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(10)),
            alignment: Alignment.bottomRight,
            height: 180,
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 5, 5),
              child: Icon(icon, size: 100, color: Colors.white),
            ),
          ),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            alignment: Alignment.topLeft,
            height: 180,
            child: Container(
              margin: EdgeInsets.fromLTRB(15, 10, 0, 0),
              child: Text(text,
                  style: TextStyle(color: Colors.white, fontSize: 30)),
            ),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () {
              Navigator.pushNamed(context, link);
            },
            splashColor: Colors.black,
            child: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              width: double.infinity,
              height: 180,
            ),
          ),
        ],
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: Text('Home'),
        ),
      ),
    );
  }
}

class Contacts extends StatelessWidget {
  const Contacts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: Text('Contacts'),
        ),
      ),
    );
  }
}

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: Text('Account'),
        ),
      ),
    );
  }
}

class Exit extends StatelessWidget {
  const Exit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: Text('Exit'),
        ),
      ),
    );
  }
}
