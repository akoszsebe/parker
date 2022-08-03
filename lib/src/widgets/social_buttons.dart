import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:parker/src/constants/assests.dart';

class GoogleSignInButton extends StatelessWidget {
  final String tag;
  final VoidCallback? onPressed;

  // ignore: use_key_in_widget_constructors
  const GoogleSignInButton({required this.tag, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
        scale: 1.28,
        child: FloatingActionButton(
            heroTag: tag,
            backgroundColor: Colors.white,
            onPressed: onPressed,
            child: SvgPicture.asset(AppSVGAssets.googleLogo, height: 37.5)));
  }
}

class FacebookSignInButton extends StatelessWidget {
  final String tag;
  final VoidCallback? onPressed;

  // ignore: use_key_in_widget_constructors
  const FacebookSignInButton({required this.tag, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
        scale: 1.28,
        child: FloatingActionButton(
            heroTag: tag,
            backgroundColor: Color(0xff4267B2),
            onPressed: onPressed,
            child: Image.asset(AppAssets.facebookLogo)));
  }
}

class AppleSignInButton extends StatelessWidget {
  final String tag;
  final VoidCallback? onPressed;

  // ignore: use_key_in_widget_constructors
  const AppleSignInButton({required this.tag, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
        scale: 1.28,
        child: FloatingActionButton(
            heroTag: tag,
            backgroundColor: Colors.black,
            onPressed: onPressed,
            child: Image.asset(AppAssets.appleLogo)));
  }
}
