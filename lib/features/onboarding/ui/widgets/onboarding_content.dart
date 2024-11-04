import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../data/models/onboarding_info.dart';
import '../../../../core/theming/app_text_styles.dart';

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    super.key,
    required this.item,
    required this.pageController,
  });

  final OnboardingInfo item;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        children: [
          50.verticalSpace,
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Outer circle with responsive sizing
                Container(
                  width: screenWidth * 0.7, // 70% of screen width
                  height: screenWidth * 0.7,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: item.backgroundColor3,
                  ),
                ),
                Container(
                  width: screenWidth * 0.6, // 60% of screen width
                  height: screenWidth * 0.6,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: item.backgroundColor2,
                  ),
                ),
                // Middle circle
                Container(
                  width: screenWidth * 0.5, // 50% of screen width
                  height: screenWidth * 0.5,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: item.backgroundColor1,
                  ),
                ),
                // Inner circle (image)
                Image.asset(
                  item.image,
                  width: screenWidth * 0.3, // 30% of screen width
                  height: screenWidth * 0.3,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          SizedBox(height: 0.1.sh), 
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    item.title,
                    style: TextStyle(
                        fontSize: 36.sp,
                        fontWeight: FontWeight.bold,
                        color: item.textColor),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    item.description,
                    textAlign: TextAlign.start,
                    style: AppTextStyles.font20BlackRegular,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}


