import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parker/generated/locale_keys.g.dart';
import 'package:parker/src/pages/sign_in/sign_in_view_model.dart';
import 'package:parker/src/providers/providers.dart';
import 'package:parker/src/constants/assests.dart';
import 'package:parker/src/constants/tags.dart';
import 'package:parker/src/style/app_text_style.dart';
import 'package:parker/src/widgets/rounded_container.dart';
import 'package:parker/src/widgets/social_buttons.dart';

final ChangeNotifierProvider<SignInViewModel> signInModelProvider =
    ChangeNotifierProvider<SignInViewModel>(
  (ChangeNotifierProviderRef<SignInViewModel> ref) => SignInViewModel(
    auth: ref.watch(firebaseAuthProvider),
  ),
);

class SignInPage extends ConsumerWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SignInViewModel signInModel = ref.watch(signInModelProvider);
    ref.listen<SignInViewModel>(signInModelProvider,
        (_, SignInViewModel model) async {
      if (model.error != null) {
        // show popup Text("Sigin failed");
      }
    });
    return SignInPageContents(
      viewModel: signInModel,
    );
  }
}

class SignInPageContents extends StatelessWidget {
  const SignInPageContents({required this.viewModel, Key? key})
      : super(key: key);
  final SignInViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppAssets.signinBg), fit: BoxFit.fill)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
              padding: EdgeInsets.only(top: statusBarHeight),
              child: _buildSignIn(context)),
        ));
  }

  Widget _buildSignIn(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      const SizedBox(),
      SizedBox(
        height: 160,
        width: 110,
        child: SvgPicture.asset(
          AppSVGAssets.nativeLogo,
          width: 110,
          fit: BoxFit.scaleDown,
        ),
      ),
      Text(
        LocaleKeys.SignIn_title,
        style: AppTextStyle.header1Light,
        textAlign: TextAlign.center,
      ).tr(),
      const SizedBox(),
      TopRoundedContainer(
          radius: 32.0,
          backgroundColor: Colors.white,
          padding: const EdgeInsets.only(top: 25.0, bottom: 34),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                LocaleKeys.SignIn_subtitle,
                style: AppTextStyle.body2,
              ).tr(),
              const SizedBox(height: 43),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FacebookSignInButton(
                    tag: AppTags.facebookSignInButton,
                    onPressed: () {
                      viewModel
                          .signInWithFacebook(); // finish flow firebase console
                    },
                  ),
                  GoogleSignInButton(
                    tag: AppTags.googleSignInButton,
                    onPressed: () {
                      viewModel.signInWithGoogle();
                    },
                  ),
                  AppleSignInButton(
                    tag: AppTags.appleSignInButton,
                    onPressed: () {
                      viewModel
                          .signInWithApple(); // finish flow firebase console
                    },
                  ),
                ],
              ),
            ],
          ))
    ]);
  }
}
