import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:selaty/constants/assets.dart';
import 'package:selaty/core/helpers/extensions/app_navigotion.dart';
import 'package:selaty/core/theming/app_colors.dart';

import '../../../../core/widgets/custom_icon_bar.dart';
import '../../../home/ui/screens/home_screen.dart';
import '../widgets/add_image.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgrond,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: 50.h, // Responsive padding
            left: 20.w,
            right: 20.w,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomIconBar(icon: Icons.camera_alt_outlined),
                  CustomIconBar(
                    icon: Icons.arrow_forward_ios_outlined,
                    onPressed: () {
                      context.pop();
                    },
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  // Profile Information Container
                  Container(
                    width: 0.75.sw, // 75% of screen width
                    height: 0.25.sh, // 25% of screen height
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: AppColors.softGreen,
                    ),
                  ),
                  // Circular Avatar Positioned Above the Profile Container
                  Positioned(
                    top: MediaQuery.of(context).orientation ==
                            Orientation.landscape
                        ? -20.h // Smaller offset in landscape
                        : -80.h, // Larger offset in portrait
                    child: AddImage(
                      onImageSelected: (imagePath) {
                        // Handle the selected image path here
                      },
                    ),
                  ),
                  // Profile Information Container
                  Column(
                    children: [
                      Text(
                        " مصطفي مجدي",
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: white,
                        ),
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        "mustafa.dev.nasr@gmail.com",
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: white,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  )
                ],
              ),
              Column(
                children: [
                  SizedBox(height: 10.h), // Optional spacing between rows
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InfoCard(screenWidth: screenWidth),
                      InfoCard(screenWidth: screenWidth),
                      InfoCard(screenWidth: screenWidth),
                    ],
                  ),
                  20.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InfoCard(screenWidth: screenWidth),
                      InfoCard(screenWidth: screenWidth),
                      InfoCard(screenWidth: screenWidth),
                    ],
                  ),
                ],
              ),
              20.verticalSpace,
              Row(
                children: [
                  20.horizontalSpace,
                  Container(
                    width: 0.30.sw, // Width relative to screen width
                    height: 0.15.sh, // Height relative to screen height
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: AppColors.softGreen,
                    ),
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.lightBlueAccent,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        width: 50.w,
                        height: 50.h,
                        child: const Icon(
                          Icons.add_ic_call_outlined,
                          color: Colors.white, // Icon color
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: 0.30.sw, // Width relative to screen width
                    height: 0.15.sh, // Height relative to screen height
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: AppColors.softGreen,
                    ),
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.lightBlueAccent,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        width: 50.w,
                        height: 50.h,
                        child: const Icon(
                          Icons.add_ic_call_outlined,
                          color: Colors.white, // Icon color
                        ),
                      ),
                    ),
                  ),
                  20.horizontalSpace,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    // Calculate width dynamically for fitting items with spacing
    final double cardWidth = (screenWidth - 60.w) / 3.5;

    return Container(
      width: cardWidth,
      height: 0.13.sh, // 13% of screen height
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(36.r),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // Adds a subtle shadow
          ),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Icon(
              Icons.person,
              color: Colors.blueAccent,
            ),
            Text(
              'Item',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
