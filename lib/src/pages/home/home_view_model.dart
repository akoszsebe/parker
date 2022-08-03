import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:location/location.dart';

class HomeViewModel with ChangeNotifier {
  HomeViewModel({required this.auth, required this.locationService});
  final FirebaseAuth auth;
  final Location locationService;

  //
  dynamic error;
  bool isLoading = false;
  LatLng currentLocation = const LatLng(
      0, 0); // TODO : save the last position and load it when apa is starting

  final Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();

  Future<void> initLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await locationService.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await locationService.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await locationService.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await locationService.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    await locationService.getLocation().then((value) {
      print("-----------" + value.toString());
      currentLocation = LatLng(value.latitude ?? 0, value.longitude ?? 0);
      mapController.future.then((value) {
        value.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(
            target: currentLocation,
            zoom: 15.4746,
          ),
        ));
      });
    });
  }

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
