import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:relay/controller/login_controller.dart';
import 'package:relay/types/social_provider.dart';

class SocialLoginButton extends StatelessWidget {
  SocialLoginButton({@required provider})
      : assetName = getAssetName(provider),
        url = getUrl(provider);

  final String assetName;
  final String url;

  static String getAssetName(SocialProvider provider) {
    switch (provider) {
      case SocialProvider.GOOGLE:
        return 'images/google.svg';
      case SocialProvider.APPLE:
        return 'images/apple.svg';
      case SocialProvider.FACEBOOK:
        return 'images/facebook.svg';
      case SocialProvider.KAKAO:
        return 'images/kakao.svg';
    }
  }

  onPress(url) async {
    final result =
        await FlutterWebAuth.authenticate(url: url, callbackUrlScheme: "relay");
    final body = Uri.parse(result).queryParameters;
    final id = body['id'];
    final code = body['code'];
    final loginResult = await LoginController().login(id, code);
    await LoginController()
        .saveToken(loginResult.accessToken, loginResult.refreshToken);
    final tokens = await LoginController().loadToken();
    print(tokens);
  }

  static String getUrl(SocialProvider provider) {
    switch (provider) {
      case SocialProvider.GOOGLE:
        return 'http://localhost:3000/auth/google';
      case SocialProvider.APPLE:
        return 'http://localhost:3000/auth/apple';
      case SocialProvider.FACEBOOK:
        return 'http://localhost:3000/auth/facebook';
      case SocialProvider.KAKAO:
        return 'http://localhost:3000/auth/kakao';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: TextButton(
      onPressed: () => onPress(url),
      child: SvgPicture.asset(assetName),
    ));
  }
}
