import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:get/get.dart';
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
        return 'assets/images/google.svg';
      case SocialProvider.APPLE:
        return 'assets/images/apple.svg';
      case SocialProvider.FACEBOOK:
        return 'assets/images/facebook.svg';
      case SocialProvider.KAKAO:
        return 'assets/images/kakao.svg';
    }
  }

  onPress(url) async {
    final _loginController = Get.find<LoginController>();
    final result =
        await FlutterWebAuth.authenticate(url: url, callbackUrlScheme: "relay");
    final body = Uri.parse(result).queryParameters;

    final id = body['id'];
    final tempToken = body['temp_token'];
    _loginController.getToken(id, tempToken);

    print(id);
    print(tempToken);
  }

  static String getUrl(SocialProvider provider) {
    final url = 'http://localhost:3000/auth';
    switch (provider) {
      case SocialProvider.GOOGLE:
        return url + '/google';
      case SocialProvider.APPLE:
        return url + '/apple';
      case SocialProvider.FACEBOOK:
        return url + '/facebook';
      case SocialProvider.KAKAO:
        return url + '/kakao';
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
