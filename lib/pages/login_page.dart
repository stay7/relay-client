import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:relay/components/social_login_button.dart';
import 'package:relay/types/social_provider.dart';

class LoginPage extends StatelessWidget {
  // signInWithGoogle() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            SocialLoginButton(provider: SocialProvider.GOOGLE),
            SocialLoginButton(provider: SocialProvider.FACEBOOK),
            SocialLoginButton(provider: SocialProvider.KAKAO),
            SocialLoginButton(provider: SocialProvider.APPLE),
          ],
        ),
      ),
    );
  }
}
