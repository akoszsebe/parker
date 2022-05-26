import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parker/generated/locale_keys.g.dart';
import 'package:parker/src/constants/keys.dart';
import 'package:parker/src/pages/sign_in/sign_in_view_model.dart';
import 'package:parker/src/providers/providers.dart';
import 'package:parker/src/routing/app_routes.dart';

final ChangeNotifierProvider<SignInViewModel> signInModelProvider = ChangeNotifierProvider<SignInViewModel>(
  (ChangeNotifierProviderRef<SignInViewModel> ref) => SignInViewModel(auth: ref.watch(firebaseAuthProvider)),
);

class SignInPage extends ConsumerWidget {

  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SignInViewModel signInModel = ref.watch(signInModelProvider);
    ref.listen<SignInViewModel>(signInModelProvider, (_, SignInViewModel model) async {
      if (model.error != null) {
        // show popup Text("Sigin failed");
      }
    });
    return SignInPageContents(
      viewModel: signInModel,
      title: LocaleKeys.SignIn_PageName.tr(),
    );
  }
}

class SignInPageContents extends StatelessWidget {
  const SignInPageContents(
      {required this.viewModel, Key? key, this.title = 'Architecture Demo'})
      : super(key: key);
  final SignInViewModel viewModel;
  final String title;

  static const Key emailPasswordButtonKey = Key(Keys.emailPassword);
  static const Key anonymousButtonKey = Key(Keys.anonymous);

  Future<void> _showEmailPasswordSignInPage(BuildContext context) async {
    final NavigatorState navigator = Navigator.of(context);
    await navigator.pushNamed(
      AppRoutes.entryPage,
      arguments: () => navigator.pop(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        title: Text(title),
      ),
      backgroundColor: Colors.grey[200],
      body: _buildSignIn(context),
    );
  }

  Widget _buildHeader() {
    if (viewModel.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return const Text(
      'signIn',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.w600),
    );
  }

  Widget _buildSignIn(BuildContext context) {
    return Center(
      child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          width: min(constraints.maxWidth, 600),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 32.0),
              SizedBox(
                height: 50.0,
                child: _buildHeader(),
              ),
              const SizedBox(height: 32.0),
              MaterialButton(
                key: emailPasswordButtonKey,
                onPressed: viewModel.isLoading
                    ? null
                    : () => _showEmailPasswordSignInPage(context),
                textColor: Colors.white,
                color: Theme.of(context).primaryColor,
                child: Text(LocaleKeys.SignIn_actionEmailPassword.tr()),
              ),
              const SizedBox(height: 8),
              const Text(
                'or',
                style: TextStyle(fontSize: 14.0, color: Colors.black87),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              MaterialButton(
                key: anonymousButtonKey,
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                onPressed:
                    viewModel.isLoading ? null : viewModel.signInAnonymously,
                child: const Text('goAnonymous'),
              ),
            ],
          ),
        );
      }),
    );
  }
}
