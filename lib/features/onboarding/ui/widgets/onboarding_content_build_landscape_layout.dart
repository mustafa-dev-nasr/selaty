import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../data/models/onboarding_info.dart';
import '../../../../core/theming/app_text_styles.dart';

class OnboardingContentBuildLandscapeLayout extends StatelessWidget {
  const OnboardingContentBuildLandscapeLayout({
    super.key,
    required this.item,
    required this.pageController,
  });

  final OnboardingInfo item;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Image Circles
          Expanded(
            flex: 1,
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: screenHeight * 0.5,
                    height: screenHeight * 0.5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: item.backgroundColor3,
                    ),
                  ),
                  Container(
                    width: screenHeight * 0.4,
                    height: screenHeight * 0.4,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: item.backgroundColor2,
                    ),
                  ),
                  Container(
                    width: screenHeight * 0.3,
                    height: screenHeight * 0.3,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: item.backgroundColor1,
                    ),
                  ),
                  Image.asset(
                    item.image,
                    width: screenHeight * 0.2,
                    height: screenHeight * 0.2,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ),
          // Text Content
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item.title,
                    style: TextStyle(
                      fontSize: isLandscape ? 24.sp : 24.sp,
                      fontWeight: FontWeight.bold,
                      color: item.textColor,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    item.description,
                    style: AppTextStyles.font20BlackRegular.copyWith(
                      fontSize: isLandscape ? 11.sp : 16.sp,
                    ),
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
