import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile();

  @override
  Widget build(BuildContext context) {
    var list = [
      RowDataFront(text: 'text', icon: Icons.info_outline),
      RowDataFront(text: 'text2', icon: Icons.message_outlined),
    ];

    var list2 = list.map((e) => _UserRow(text: e.text, icon: e.icon)).toList();

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('User Info'),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Container(
              color: Colors.white,
              width: double.infinity,
              child: Column(
                children: const [
                  SizedBox(height: 20),
                  _UserLogo(),
                  SizedBox(height: 15),
                  _UserName(),
                  SizedBox(height: 5),
                  _UserAccoutName(),
                  SizedBox(height: 20),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Column(
              children:
                  /*
                _UserRow(text: 'Информация', icon: Icons.info_outline),
                _UserRow(text: 'Сообщения', icon: Icons.message_outlined),
                _UserRow(text: 'Фотографии', icon: Icons.photo),
                _UserRow(text: 'Контакты', icon: Icons.contact_mail),
                */
                  list2,
            ),
            const SizedBox(height: 15),
            Column(
              children: const [
                _UserRow(text: 'Выйти', icon: Icons.exit_to_app),
                _UserRow(text: 'Удалить аккаунт', icon: Icons.delete),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class RowDataFront {
  var text;
  var icon;
  RowDataFront({this.text, this.icon});
}

class _UserRow extends StatelessWidget {
  final String text;
  final IconData icon;

  const _UserRow({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 1),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.cyan,
            ),
            const SizedBox(width: 15),
            Expanded(
                child: Text(
              text,
              style: const TextStyle(fontSize: 20),
            )),
            const Icon(Icons.chevron_right_outlined),
          ],
        ),
      ),
    );
  }
}

class _UserAccoutName extends StatelessWidget {
  const _UserAccoutName({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      '@gooodwin67',
      style: TextStyle(color: Colors.black, fontSize: 15),
    );
  }
}

class _UserName extends StatelessWidget {
  const _UserName({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Алейник Андрей',
      style: TextStyle(color: Colors.black, fontSize: 25),
    );
  }
}

class _UserLogo extends StatelessWidget {
  const _UserLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      child: const Placeholder(),
    );
  }
}
