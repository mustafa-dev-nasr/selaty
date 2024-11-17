import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:selaty/core/helpers/extensions/app_navigotion.dart';
import 'package:selaty/core/theming/app_colors.dart';
import 'package:selaty/core/widgets/custom_icon_bar.dart';
import '../../../../constants/assets.dart';
import '../../../../core/widgets/add_text_form_field.dart';

class CategoryHeader extends StatelessWidget {
  final String categoryTitle;

  const CategoryHeader({
    super.key,
    required this.categoryTitle,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isPortraitOrientation =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            // Background container
            Container(
              width: double.infinity,
              height: isPortraitOrientation
                  ? screenHeight / 5 // 1/5th height for portrait
                  : screenHeight / 3, // 1/3rd height for landscape
              decoration: const BoxDecoration(
                color: AppColors.aquaGreen,
              ),
            ),
            Positioned(
              top: 20.h,
              left: 0.w,
              right: 0.w,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomIconBar(
                      icon: Icons.camera_alt_outlined,
                      onPressed: () {
                        // Add your camera action here
                      },
                    ),
                    Text(
                      categoryTitle,
                      style: TextStyle(fontSize: 20.sp),
                    ),
                    CustomIconBar(
                      icon: Icons.arrow_forward_ios_outlined,
                      onPressed: () {
                        context.pop();
                      },
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: -40.h,
              left: screenWidth / 2 - 100.w,
              right: screenWidth / 2 - 100.w,
              child: Container(
                width: 100.w,
                height: 100.h,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.lightGreen,
                ),
              ),
            ),
            Positioned(
              bottom: -30.h,
              left: screenWidth / 2 - 100.w,
              right: screenWidth / 2 - 100.w,
              child: Container(
                padding: EdgeInsets.all(4.r),
                width: 80.w,
                height: 80.h,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Center(
                  child: Image.asset(Assets.resourceImagesFruitIcon),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 50.h), // Corrected SizedBox for vertical spacing
        Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: Row(
            children: [
              // Action button
              Container(
                width: 55.w,
                height: 55.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.vibrantRed,
                ),
                child: const Icon(Icons.format_list_bulleted_rounded,
                    color: Colors.white),
              ),
              const Spacer(),
              // Search field
              SizedBox(
                width: screenWidth / (isPortraitOrientation ? 1.3 : 1.5) -
                    20.w, // Adjust width for landscape and portrait
                child: AppTextFormField(
                  hintText: "البحث عن المنتجات",
                  suffixIcon: const Icon(
                    Icons.search_rounded,
                    color: Colors.grey,
                  ),
                  prefixIcon:
                      const Icon(Icons.cancel_outlined, color: Colors.black),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a search term.";
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
