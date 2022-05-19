import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parker/src/pages/home_page.dart';
import 'package:parker/src/pages/sign_in_page.dart';
import 'package:parker/src/providers/providers.dart';
import 'package:parker/src/routing/app_routes.dart';
import 'package:parker/src/widgets/auth_widget.dart';

class MainApp extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final firebaseAuth = ref.watch(firebaseAuthProvider);
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.indigo),
      debugShowCheckedModeBanner: false,
      home: AuthWidget(
        nonSignedInBuilder: (_) => Consumer(
          builder: (context, ref, _) {
            return SignInPage();
          },
        ),
        signedInBuilder: (_) => HomePage(),
      ),
      onGenerateRoute: (settings) =>
          AppRouter.onGenerateRoute(settings, firebaseAuth),
    );
  }

}