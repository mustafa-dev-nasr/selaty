import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:selaty/constants/assets.dart';
import 'package:selaty/core/helpers/extensions/app_navigotion.dart';
import 'package:selaty/core/routing/route.dart';
import 'package:selaty/core/theming/app_colors.dart';
import 'package:selaty/core/theming/app_text_styles.dart';
import 'package:selaty/core/widgets/add_text_form_field.dart';

class CustomHomeBar extends StatelessWidget {
  const CustomHomeBar({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: orientation == Orientation.portrait
              ? _buildPortraitLayout(context)
              : _buildLandscapeLayout(context),
        );
      },
    );
  }

  Widget _buildPortraitLayout(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () => context.pushNamed(Routes.profileScreen),
                child: CircleAvatar(
                  radius: 35.w,
                  backgroundColor: Colors.red,
                  backgroundImage:
                      const AssetImage(Assets.resourceImagesPerson),
                ),
              ),
              SizedBox(width: 20.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "مصطفي مجدي",
                      style: AppTextStyles.font22BlackMedium,
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 15.w,
                          backgroundImage: const AssetImage(
                              Assets.resourceImagesPlaceholder),
                        ),
                        SizedBox(width: 5.w),
                        Expanded(
                          child: Text(
                            "المنوفيه - شبين الكوم",
                            style:
                                TextStyle(fontSize: 18.sp, color: Colors.grey),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  // Add your onPressed functionality here
                },
                icon:
                    const Icon(Icons.camera_alt_outlined, color: Colors.black),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              Container(
                width: 55.w,
                height: 55.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.vibrantRed,
                ),
                child: const Icon(
                  Icons.format_list_bulleted_rounded,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 20.w),
              Expanded(
                child: AppTextFormField(
                  hintText: "البحث عن المنتجات",
                  suffixIcon: const Icon(
                    Icons.search_rounded,
                    color: Colors.grey,
                  ),
                  prefixIcon:
                      const Icon(Icons.cancel_outlined, color: Colors.black),
                  validator: (value) {
                    // Add validation logic if needed
                    return null;
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLandscapeLayout(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        children: [
          GestureDetector(
            onTap: () => context.pushNamed(Routes.profileScreen),
            child: CircleAvatar(
              radius: 35.w,
              backgroundColor: Colors.red,
              backgroundImage: const AssetImage(Assets.resourceImagesPerson),
            ),
          ),
          SizedBox(width: 20.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "مصطفي مجدي",
                  style: AppTextStyles.font22BlackMedium,
                ),
                SizedBox(height: 5.h),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 15.w,
                      backgroundImage:
                          const AssetImage(Assets.resourceImagesPlaceholder),
                    ),
                    SizedBox(width: 5.w),
                    Expanded(
                      child: Text(
                        "المنصوره - شبين الكوم",
                        style: TextStyle(fontSize: 18.sp, color: Colors.grey),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              // Add your onPressed functionality here
            },
            icon: const Icon(Icons.camera_alt_outlined, color: Colors.black),
          ),
          SizedBox(width: 20.w),
          Container(
            width: 55.w,
            height: 55.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.vibrantRed,
            ),
            child: const Icon(
              Icons.format_list_bulleted_rounded,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 20.w),
          Expanded(
            child: AppTextFormField(
              hintText: "البحث عن المنتجات",
              suffixIcon: const Icon(Icons.search_rounded, color: Colors.grey),
              prefixIcon:
                  const Icon(Icons.cancel_outlined, color: Colors.black),
              validator: (value) => null,
            ),
          ),
        ],
      ),
    );
  }
}
