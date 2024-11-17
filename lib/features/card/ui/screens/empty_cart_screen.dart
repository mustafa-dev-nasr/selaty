import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:selaty/constants/assets.dart';
import 'package:selaty/core/helpers/extensions/app_navigotion.dart';
import 'package:selaty/core/theming/app_colors.dart';
import 'package:selaty/core/widgets/app_text_button.dart';

import '../../../../core/routing/route.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/widgets/custom_icon_bar.dart';

class EmptyCartScreen extends StatelessWidget {
  const EmptyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orientation =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgrond,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
          child: SingleChildScrollView(
            // Fixed typo here
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomIconBar(icon: Icons.camera_alt_outlined),
                    Text("عربه التسوق",
                        style: orientation
                            ? AppTextStyles.font20BlackBold
                            : AppTextStyles.font12BlackRegular),
                    CustomIconBar(
                      icon: Icons.arrow_forward_ios_outlined,
                      onPressed: () => context.pop(),
                    ),
                  ],
                ),
                SizedBox(
                    height: orientation
                        ? 100.h
                        : 0.h), // Space between header and content
                Center(
                  child: Container(
                    constraints: BoxConstraints(
                      maxHeight: orientation
                          ? MediaQuery.of(context).size.height / 2
                          : MediaQuery.of(context).size.height - 100,
                      maxWidth: MediaQuery.of(context).size.width,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          Assets.resourceImagesBagIcon,
                          color: Colors.red,
                          width: 100.w,
                          height: 100.h,
                        ),
                        SizedBox(height: 20.h), // Space between image and text
                        Text(
                          "السلة الحالية فارغة",
                          style: orientation
                              ? AppTextStyles.font24BlackSemibold
                              : AppTextStyles.font12BlackRegular
                                  .copyWith(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10.h), // Space between texts
                        Text(
                          "أجعل سلتك سعيده وأضف منتجات",
                          textAlign: TextAlign.center,
                          style: orientation
                              ? AppTextStyles.font16BlackRegular
                              : AppTextStyles.font12BlackRegular
                                  .copyWith(fontSize: 12),
                        ),
                        SizedBox(height: 10.h), // Space before button
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 40.w, vertical: 20.h),
                          child: AppTextButton(
                            backgroundColor: AppColors.softGreen,
                            onPressed: () {
                              context.pushNamed(Routes.deliveryAddressScreen);
                            },
                            buttonText: "أبدأ التسوق",
                            textStyle: orientation
                                ? AppTextStyles.font20WhiteBold
                                : AppTextStyles.font12BlackRegular
                                    .copyWith(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
