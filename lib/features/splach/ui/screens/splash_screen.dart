import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:selaty/constants/assets.dart';
import 'package:selaty/core/helpers/extensions/app_navigotion.dart';
import 'package:selaty/core/routing/route.dart'; // Make sure this contains your route paths
import 'package:selaty/core/theming/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to the next screen after 5 seconds
    Future.delayed(const Duration(seconds: 3), () {
      context.pushNamed(Routes.onBoardingScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background image fills the screen
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
            padding: EdgeInsets.symmetric(horizontal: 20.r),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo image with responsive size
                Image.asset(
                  Assets.resourceImagesSplash,
                  width: 500.r,
                  height: 400.r,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 40.r),
                // Circular progress indicator
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
