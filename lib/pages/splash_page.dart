import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:relay/config/config.dart';
import 'package:relay/pages/login_page.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: AppConfig.SplashDuration), navigate);
  }

  navigate() {
    // if (isUser) {
    // Route route = MaterialPageRoute(builder: (_) => HomePage());
    // Navigator.pushReplacement(context, route);
    // } else {
    Route route = MaterialPageRoute(builder: (context) => LoginPage());
    Navigator.pushReplacement(context, route);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset("images/welcome.png");
  }
}
