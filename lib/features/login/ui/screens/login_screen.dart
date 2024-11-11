import 'package:flutter/material.dart';
import '../widgets/login_build_landscape_layout.dart';
import '../widgets/login_build_portrait_layout.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: OrientationBuilder(
          builder: (context, orientation) {
            if (orientation == Orientation.portrait) {
              return const LoginBuildPortraitLayout();
            } else {
              return const LoginBuildLandscapeLayout();
            }
          },
        ),
      ),
    );
  }
}
