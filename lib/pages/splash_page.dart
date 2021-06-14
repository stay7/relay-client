import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:relay/config/config.dart';
import 'package:relay/pages/login_page.dart';
import 'package:relay/provider/preference_provider.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  checkSession() {
    return PreferenceProvider().loadToken();
  }

  navigate() {
    final tokens = checkSession();
    final accessToken = tokens[0], refreshToken = tokens[1];
    print({accessToken, refreshToken});

    // if (isUser) {
    // Route route = MaterialPageRoute(builder: (_) => HomePage());
    // Navigator.pushReplacement(context, route);
    // } else {
    Route route = MaterialPageRoute(builder: (context) => LoginPage());
    Navigator.pushReplacement(context, route);
    // }
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: AppConfig.SplashDuration), () => navigate());
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/images/welcome.png");
  }
}
