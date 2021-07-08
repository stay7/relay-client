import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:relay/components/social_login_button.dart';
import 'package:relay/header/app_header.dart';
import 'package:relay/types/social_provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(),
      body: Center(
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/images/app_name.svg'),
                  SvgPicture.asset('assets/images/arrow.svg')
                ],
              ),
            ),
            Flexible(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialLoginButton(provider: SocialProvider.GOOGLE),
                  SocialLoginButton(provider: SocialProvider.FACEBOOK),
                  SocialLoginButton(provider: SocialProvider.KAKAO),
                  SocialLoginButton(provider: SocialProvider.APPLE),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
