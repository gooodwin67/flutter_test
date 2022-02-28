import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  TextFieldWidget({Key? key}) : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  final textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String text = '';

    void _onTapBtn() {
      text = textFieldController.text;
      setState(() {});
    }

    void _onChanged(texxt) {
      text = textFieldController.text;
      setState(() {});
    }

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(15),
                child: TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Phone',
                      prefixIcon: Icon(Icons.phone),
                      prefixText: '+7'),
                  controller: textFieldController,
                  onChanged: _onChanged,
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(onPressed: _onTapBtn, child: Text('press')),
              SizedBox(height: 30),
              Text(textFieldController.text),
            ],
          ),
        ),
      ),
    );
  }
}
