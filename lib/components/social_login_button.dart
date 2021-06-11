import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:relay/types/social_provider.dart';

class SocialLoginButton extends StatelessWidget {
  SocialLoginButton({@required provider})
      : assetName = getAssetName(provider),
        handlePress = getHandlePress(provider);

  final String assetName;
  final VoidCallback handlePress;

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

  static VoidCallback getHandlePress(SocialProvider provider) {
    switch (provider) {
      case SocialProvider.GOOGLE:
        return () {};
      case SocialProvider.APPLE:
        return () {};
      case SocialProvider.FACEBOOK:
        return () {};
      case SocialProvider.KAKAO:
        return () {};
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: TextButton(
      onPressed: handlePress,
      child: SvgPicture.asset(assetName),
    ));
  }
}
