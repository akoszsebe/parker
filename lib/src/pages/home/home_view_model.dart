import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeViewModel with ChangeNotifier {
  HomeViewModel({required this.auth});
  final FirebaseAuth auth;
  dynamic error;
  bool isLoading = false;

  final Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();

  Future<void> logOut() async {
    try {
      isLoading = true;
      notifyListeners();
      await GoogleSignIn().signOut();
      await auth.signOut();
    } catch (e) {
      error = e;
      rethrow;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
