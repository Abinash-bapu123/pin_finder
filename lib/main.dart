import 'package:flutter/material.dart';
import 'package:pin_finder/Pages/Home.dart';
import 'package:pin_finder/Welcome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Welcome(),
      routes: {
        '/Home': (BuildContext context) => new Home(),
      },
    );
  }
}
