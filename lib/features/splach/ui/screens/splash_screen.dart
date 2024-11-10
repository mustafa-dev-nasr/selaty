import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:selaty/constants/assets.dart';
import 'package:selaty/core/helpers/extensions/app_navigotion.dart';
import 'package:selaty/core/routing/route.dart'; // Make sure this contains your route paths
import 'package:selaty/core/theming/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      context.pushNamed(Routes.onBoardingScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            Assets.resourceImagesBackground,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: isPortrait ? 20.r : 40.r),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  Assets.resourceImagesSplash,
                  width:
                      isPortrait ? 500.r : 300.r, // Adjust based on orientation
                  height:
                      isPortrait ? 400.r : 250.r, // Adjust based on orientation
                  fit: BoxFit.contain,
                ),
                SizedBox(height: isPortrait ? 40.r : 20.r), // Adjust spacing
                const CircularProgressIndicator(
                  color: AppColors
                      .softGreen, // Set to your primary color or desired color
                  strokeWidth: 4.0,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
