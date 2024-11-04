import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:selaty/constants/assets.dart';
import 'package:selaty/core/helpers/extensions/app_navigotion.dart';
import 'package:selaty/core/routing/route.dart';
import 'package:selaty/core/theming/app_colors.dart';
import 'package:selaty/core/theming/app_text_styles.dart';
import 'package:selaty/core/widgets/app_text_button.dart';

class MainAuth extends StatelessWidget {
  const MainAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
                    Assets.resourceImagesSelaty,
                    width: 200.r,
                    height: 200.r,
                  ),
                  SizedBox(height: 40.r),
                  // Login button
                  AppTextButton(
                    onPressed: () {
                      context.pushNamed(Routes.loginScreen);
                    },
                    buttonText: "تسجيل الدخول",
                    textStyle: AppTextStyles.font16Whiteregular,
                    backgroundColor: AppColors.lightRed,
                    buttonWidth: MediaQuery.of(context).size.width * 0.95,
                  ),
                  SizedBox(height: 20.r),
                  // Sign-up button
                  AppTextButton(
                    onPressed: () {
                      context.pushNamed(Routes.signUpScreen);
                    },
                    buttonText: "إنشاء حساب جديد",
                    textStyle: AppTextStyles.font16Whiteregular,
                    backgroundColor: AppColors.softGreen,
                    buttonWidth: MediaQuery.of(context).size.width * 0.95,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
