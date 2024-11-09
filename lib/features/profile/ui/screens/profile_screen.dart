import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:selaty/constants/assets.dart';
import 'package:selaty/core/helpers/extensions/app_navigotion.dart';
import 'package:selaty/core/theming/app_colors.dart';

import '../../../../core/widgets/custom_icon_bar.dart';
import '../../../home/ui/screens/home_screen.dart';
import '../widgets/add_image.dart';
import '../widgets/info_card.dart';

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
            top: 20.h,
            left: 20.w,
            right: 20.w,
            bottom: 20.h,
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
                  Container(
                    width: 0.75.sw,
                    height: 0.25.sh,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: AppColors.softGreen,
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).orientation ==
                            Orientation.landscape
                        ? -20.h
                        : -80.h,
                    child: AddImage(
                      onImageSelected: (imagePath) {
                        // Handle the selected image path here
                      },
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        "مصطفي مجدي",
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        "mustafa.dev.nasr@gmail.com",
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 20.h),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 20.h,
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  childAspectRatio: (screenWidth / 3) / 120.h,
                  children: List.generate(
                    9,
                    (index) => InfoCard(screenWidth: screenWidth),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  20.horizontalSpace,
                  Container(
                    width: 0.30.sw,
                    height: 0.15.sh,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: AppColors.lightRed,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.lightGreen.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          width: 50.w,
                          height: 50.h,
                          child: const Icon(
                            Icons.exit_to_app,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "التحديثات",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: 0.30.sw,
                    height: 0.15.sh,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: AppColors.softGreen,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.lightGreen.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          width: 50.w,
                          height: 50.h,
                          child: const Icon(
                            Icons.add_ic_call_outlined,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "مركز الادعم",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
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
