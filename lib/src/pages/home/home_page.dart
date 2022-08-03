import 'dart:async';
import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:parker/src/pages/home/home_view_model.dart';
import 'package:parker/src/constants/tags.dart';
import 'package:parker/src/providers/providers.dart';
import 'package:parker/src/style/app_colors.dart';
import 'package:parker/src/style/app_map_style.dart';
import 'package:parker/src/widgets/rounded_container.dart';
import 'package:parker/src/widgets/social_buttons.dart';

final ChangeNotifierProvider<HomeViewModel> homeModelProvider =
    ChangeNotifierProvider<HomeViewModel>(
  (ChangeNotifierProviderRef<HomeViewModel> ref) => HomeViewModel(
      auth: ref.watch(firebaseAuthProvider),
      locationService: ref.read(locationServiceProvider)),
);

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    ref.read(homeModelProvider).initLocation();
  }

  @override
  Widget build(BuildContext context) {
    final HomeViewModel homeModel = ref.watch(homeModelProvider);
    ref.listen<HomeViewModel>(homeModelProvider,
        (_, HomeViewModel model) async {
      if (model.error != null) {
        // show popup Text("Sigin failed");
      }
    });
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
        backgroundColor: AppColors.background,
        body: ExpandableBottomSheet(
          persistentContentHeight: 100,
          background: Container(
              padding: EdgeInsets.only(bottom: 60),
              child: GoogleMap(
                mapType: MapType.normal,
                zoomGesturesEnabled: true,
                compassEnabled: false,
                myLocationButtonEnabled: false,
                myLocationEnabled: false,
                zoomControlsEnabled: false,
                initialCameraPosition: CameraPosition(
                  target: homeModel.currentLocation,
                  zoom: 12.4746,
                ),
                onMapCreated: (GoogleMapController controller) async {
                  String style = await AppMapStyle.getMapStyleInstance();
                  controller.setMapStyle(style);
                  homeModel.mapController.complete(controller);
                },
              )),
          persistentHeader: Container(
            padding: EdgeInsets.all(16),
            child: Container(
              color: AppColors.background,
              height: 40,
              child: Row(
                children: [
                  const Text("Gareg1"),
                  const Padding(padding: EdgeInsets.only(left: 20)),
                  const Text("Gareg2"),
                  const Padding(padding: EdgeInsets.only(left: 20)),
                  const Text("Gareg3"),
                ],
              ),
            ),
          ),
          expandableContent: Container(
            height: 300,
            width: double.infinity,
            color: AppColors.background,
            child: Column(
              children: [
                const Text("Search bar ..."),
                const Padding(padding: EdgeInsets.only(top: 20)),
                const Text('log out '),
                const Padding(padding: EdgeInsets.only(top: 20)),
                GoogleSignInButton(
                  tag: AppTags.googleSignInButton,
                  onPressed: () {
                    homeModel.logOut();
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
