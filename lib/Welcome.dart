import 'dart:async';

import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  startTime() {
    return new Timer(Duration(seconds: 1), navigateToPage);
  }

  void navigateToPage() {
    Navigator.of(context).pushReplacementNamed('/Home');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          alignment: Alignment.center,
          child: Image.asset("assets/images/ic_app_icon.png"),
        ),
      ),
    );
  }
}
