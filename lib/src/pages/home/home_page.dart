import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parker/src/pages/home/home_view_model.dart';
import 'package:parker/src/constants/tags.dart';
import 'package:parker/src/providers/providers.dart';
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
  const HomePageContents({required this.viewModel, Key? key}) : super(key: key);
  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Colors.grey[500],
      body: Container(
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
              ])),
    );
  }
}
