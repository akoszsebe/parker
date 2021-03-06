import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parker/src/style/app_colors.dart';
import 'package:parker/src/pages/home/home_page.dart';
import 'package:parker/src/pages/sign_in/sign_in_page.dart';
import 'package:parker/src/providers/providers.dart';
import 'package:parker/src/routing/app_routes.dart';
import 'package:parker/src/widgets/auth_widget.dart';

class MainApp extends ConsumerWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FirebaseAuth firebaseAuth = ref.watch(firebaseAuthProvider);
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
          primaryColor: AppColors.primary,
          textTheme: GoogleFonts.interTextTheme()),
      debugShowCheckedModeBanner: false,
      home: AuthWidget(
        nonSignedInBuilder: (_) => Consumer(
          builder: (BuildContext context, WidgetRef ref, _) {
            return const SignInPage();
          },
        ),
        signedInBuilder: (_) => const HomePage(),
      ),
      onGenerateRoute: (RouteSettings settings) =>
          AppRouter.onGenerateRoute(settings, firebaseAuth),
    );
  }
}
