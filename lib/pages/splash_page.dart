import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    displaySplash();
  }

  displaySplash() {
    Timer(Duration(seconds: 2), () async {
      Firebase.initializeApp();
      //login 되어있으면 homepage
      //login 없으면 loginpage로 보내는 로직은 여기
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
