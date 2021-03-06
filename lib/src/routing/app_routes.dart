import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../pages/entry_page.dart';

class AppRoutes {
  // static const emailPasswordSignInPage = '/email-password-sign-in-page';
  // static const editJobPage = '/edit-job-page';
  static const String entryPage = '/entry-page';
}

class AppRouter {
  static Route<dynamic>? onGenerateRoute(
      RouteSettings settings, FirebaseAuth firebaseAuth) {
    final Object? args = settings.arguments;
    switch (settings.name) {
      // case AppRoutes.emailPasswordSignInPage:
      //   return MaterialPageRoute<dynamic>(
      //     builder: (_) => EmailPasswordSignInPage.withFirebaseAuth(firebaseAuth,
      //         onSignedIn: args as void Function()),
      //     settings: settings,
      //     fullscreenDialog: true,
      //   );
      // case AppRoutes.editJobPage:
      //   return MaterialPageRoute<dynamic>(
      //     builder: (_) => EditJobPage(job: args as Job?),
      //     settings: settings,
      //     fullscreenDialog: true,
      //   );
      // case AppRoutes.entryPage:
      //   final mapArgs = args as Map<String, dynamic>;
      //   final job = mapArgs['job'] as Job;
      //   final entry = mapArgs['entry'] as Entry?;
      //   return MaterialPageRoute<dynamic>(
      //     builder: (_) => EntryPage(job: job, entry: entry),
      //     settings: settings,
      //     fullscreenDialog: true,
      //   );
      case AppRoutes.entryPage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const EntryPage(),
          settings: settings,
          fullscreenDialog: true,
        );
      default:
        // TODO: Throw
        return null;
    }
  }
}
