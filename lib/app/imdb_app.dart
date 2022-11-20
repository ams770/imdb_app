import 'package:flutter/material.dart';


class ImdbApp extends StatefulWidget {
  // ignore: empty_constructor_bodies
  ImdbApp._internal() {}

  static final ImdbApp _instance = ImdbApp._internal();

  factory ImdbApp() => _instance;

  @override
  State<ImdbApp> createState() => _ImdbAppState();
}

class _ImdbAppState extends State<ImdbApp> {

  @override
  Widget build(BuildContext context) {
  
    return MaterialApp(
       home: Scaffold(
        body: Container(),
       ),
      );
  }
}