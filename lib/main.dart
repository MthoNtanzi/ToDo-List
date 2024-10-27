import 'package:flutter/material.dart';

void main() {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "To-Do List",
      home: new Scaffold(
        appBar: new AppBar(title: new Text("My list"),),
        body: new Text("Input App"),
      ),
    );
  }
}
