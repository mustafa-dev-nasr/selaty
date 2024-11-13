import 'package:flutter/material.dart';
import '../widgets/on_boarding_screen_build_landscape_layout.dart';
import '../widgets/on_boarding_screen_build_portrait_layout.dart';

class OnBoardingScreens extends StatelessWidget {
  const OnBoardingScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: OrientationBuilder(
          builder: (context, orientation) {
            if (orientation == Orientation.portrait) {
              return const OnBoardingScreenBuildPortraitLayout();
            } else {
              return const OnBoardingScreenBuildLandscapeLayout();
            }
          },
        ),
      ),
    );
  }
}
