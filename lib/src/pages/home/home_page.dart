import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:parker/src/pages/home/home_view_model.dart';
import 'package:parker/src/constants/tags.dart';
import 'package:parker/src/providers/providers.dart';
import 'package:parker/src/style/app_map_style.dart';
import 'package:parker/src/widgets/social_buttons.dart';

final ChangeNotifierProvider<HomeViewModel> homeModelProvider =
    ChangeNotifierProvider<HomeViewModel>(
  (ChangeNotifierProviderRef<HomeViewModel> ref) => HomeViewModel(
    auth: ref.watch(firebaseAuthProvider),
  ),
);

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final HomeViewModel homeModel = ref.watch(homeModelProvider);
    ref.listen<HomeViewModel>(homeModelProvider,
        (_, HomeViewModel model) async {
      if (model.error != null) {
        // show popup Text("Sigin failed");
      }
    });
    return HomePageContents(
      viewModel: homeModel,
    );
  }
}

class HomePageContents extends StatelessWidget {
  HomePageContents({required this.viewModel, Key? key}) : super(key: key);
  final HomeViewModel viewModel;

  static final LatLng myLocation = LatLng(46.769933, 23.586294);

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Colors.grey[500],
      body: Stack(children: [
        GoogleMap(
          mapType: MapType.normal,
          zoomGesturesEnabled: true,
          compassEnabled: false,
          myLocationButtonEnabled: false,
          myLocationEnabled: false,
          zoomControlsEnabled: false,
          initialCameraPosition: CameraPosition(
            target: myLocation,
            zoom: 12.4746,
          ),
          onMapCreated: (GoogleMapController controller) async {
            String style = await AppMapStyle.getMapStyleInstance();
            controller.setMapStyle(style);
            viewModel.mapController.complete(controller);
          },
        ),
        Container(
            padding: EdgeInsets.only(top: statusBarHeight),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('log out '),
                  GoogleSignInButton(
                    tag: AppTags.googleSignInButton,
                    onPressed: () {
                      viewModel.logOut();
                    },
                  ),
                ]))
      ]),
    );
  }
}
